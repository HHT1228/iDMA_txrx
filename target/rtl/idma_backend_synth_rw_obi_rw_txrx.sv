// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

// Authors:
// - Thomas Benz <tbenz@iis.ee.ethz.ch>
// - Tobias Senti <tsenti@ethz.ch>

`include "axi/typedef.svh"
`include "axi_stream/typedef.svh"
`include "idma/typedef.svh"
`include "obi/typedef.svh"
`include "tilelink/typedef.svh"
`include "txrx/typedef.svh"

/// Synthesis wrapper for the iDMA backend. Unpacks all the interfaces to simple logic vectors
module idma_backend_synth_rw_obi_rw_txrx #(
    /// Data width
    parameter int unsigned DataWidth           = 32'd32,
    /// Address width
    parameter int unsigned AddrWidth           = 32'd32,
    /// AXI user width
    parameter int unsigned UserWidth           = 32'd1,
    /// AXI ID width
    parameter int unsigned AxiIdWidth          = 32'd1,
    /// Number of transaction that can be in-flight concurrently
    parameter int unsigned NumAxInFlight       = 32'd3,
    /// The depth of the internal reorder buffer:
    /// - '2': minimal possible configuration
    /// - '3': efficiently handle misaligned transfers (recommended)
    parameter int unsigned BufferDepth         = 32'd3,
    /// With of a transfer: max transfer size is `2**TFLenWidth` bytes
    parameter int unsigned TFLenWidth          = 32'd32,
    /// The depth of the memory system the backend is attached to
    parameter int unsigned MemSysDepth         = 32'd0,
    /// Should both data shifts be done before the dataflow element?
    /// If this is enabled, then the data inserted into the dataflow element
    /// will no longer be word aligned, but only a single shifter is needed
    parameter bit          CombinedShifter     = 1'b0,
    /// Mask invalid data on the manager interface
    parameter bit          MaskInvalidData     = 1'b1,
    /// Should the `R`-`AW` coupling hardware be present? (recommended)
    parameter bit          RAWCouplingAvail    = 0,
    /// Should hardware legalization be present? (recommended)
    /// If not, software legalization is required to ensure the transfers are
    /// AXI4-conformal
    parameter bit          HardwareLegalizer   = 1'b1,
    /// Reject zero-length transfers
    parameter bit          RejectZeroTransfers = 1'b1,
    /// Should the error handler be present?
    parameter bit          ErrorHandling       = 1'b0,
    // Dependent parameters; do not override!
    /// Strobe Width (do not override!)
    parameter int unsigned StrbWidth           = DataWidth / 8,
    /// Offset Width (do not override!)
    parameter int unsigned OffsetWidth         = $clog2(StrbWidth),
    /// Address type (do not override!)
    parameter type addr_t                      = logic[AddrWidth-1:0],
    /// Data type (do not override!)
    parameter type data_t                      = logic[DataWidth-1:0],
    /// Strobe type (do not override!)
    parameter type strb_t                      = logic[StrbWidth-1:0],
    /// User type (do not override!)
    parameter type user_t                      = logic[UserWidth-1:0],
    /// ID type (do not override!)
    parameter type id_t                        = logic[AxiIdWidth-1:0],
    /// Transfer length type (do not override!)
    parameter type tf_len_t                    = logic[TFLenWidth-1:0],
    /// Offset type (do not override!)
    parameter type offset_t                    = logic[OffsetWidth-1:0]
)(
    input  logic                   clk_i,
    input  logic                   rst_ni,
    input  logic                   test_i,

    input  logic                   req_valid_i,
    output logic                   req_ready_o,

    input  tf_len_t                req_length_i,
    input  addr_t                  req_src_addr_i,
    input  addr_t                  req_dst_addr_i,
    input  idma_pkg::protocol_e    req_src_protocol_i,
    input  idma_pkg::protocol_e    req_dst_protocol_i,
    input  id_t                    req_axi_id_i,
    input  axi_pkg::burst_t        req_src_burst_i,
    input  axi_pkg::cache_t        req_src_cache_i,
    input  logic                   req_src_lock_i,
    input  axi_pkg::prot_t         req_src_prot_i,
    input  axi_pkg::qos_t          req_src_qos_i,
    input  axi_pkg::region_t       req_src_region_i,
    input  axi_pkg::burst_t        req_dst_burst_i,
    input  axi_pkg::cache_t        req_dst_cache_i,
    input  logic                   req_dst_lock_i,
    input  axi_pkg::prot_t         req_dst_prot_i,
    input  axi_pkg::qos_t          req_dst_qos_i,
    input  axi_pkg::region_t       req_dst_region_i,
    input  logic                   req_decouple_aw_i,
    input  logic                   req_decouple_rw_i,
    input  logic [2:0]             req_src_max_llen_i,
    input  logic [2:0]             req_dst_max_llen_i,
    input  logic                   req_src_reduce_len_i,
    input  logic                   req_dst_reduce_len_i,
    input  logic                   req_last_i,

    output logic                   rsp_valid_o,
    input  logic                   rsp_ready_i,

    output axi_pkg::resp_t         rsp_cause_o,
    output idma_pkg::err_type_t    rsp_err_type_o,
    output addr_t                  rsp_burst_addr_o,
    output logic                   rsp_error_o,
    output logic                   rsp_last_o,

    input  logic                   eh_req_valid_i,
    output logic                   eh_req_ready_o,
    input  idma_pkg::idma_eh_req_t eh_req_i,

    output logic                   obi_read_req_a_req_o,
    output addr_t                  obi_read_req_a_addr_o,
    output logic                   obi_read_req_a_we_o,
    output strb_t                  obi_read_req_a_be_o,
    output data_t                  obi_read_req_a_wdata_o,
    output logic                   obi_read_req_r_ready_o,
    
    input logic                    obi_read_rsp_a_gnt_i,
    input logic                    obi_read_rsp_r_valid_i,
    input data_t                   obi_read_rsp_r_rdata_i,
    input id_t                     obi_read_rsp_r_rid_i,
    input logic                    obi_read_rsp_r_err_i,
    

    output data_t                  txrx_read_req_a_ready_o,
    
    input data_t                   txrx_read_rsp_r_data_i,
    input tf_len_t                 txrx_read_rsp_r_datasize_i,
    input tf_len_t                 txrx_read_rsp_r_bytes_left_i,
    input logic                    txrx_read_rsp_r_valid_i,
    

    output logic                   obi_write_req_a_req_o,
    output addr_t                  obi_write_req_a_addr_o,
    output logic                   obi_write_req_a_we_o,
    output strb_t                  obi_write_req_a_be_o,
    output data_t                  obi_write_req_a_wdata_o,
    output id_t                    obi_write_req_a_aid_o,
    output logic                   obi_write_req_r_ready_o,
    
    input logic                    obi_write_rsp_a_gnt_i,
    input logic                    obi_write_rsp_r_valid_i,
    input data_t                   obi_write_rsp_r_rdata_i,
    

    output data_t                  txrx_write_req_a_data_o,
    output logic                   txrx_write_req_a_valid_o,
    
    input tf_len_t                 txrx_write_rsp_r_datasize_i,
    input tf_len_t                 txrx_write_rsp_r_bytes_left_i,
    input logic                    txrx_write_rsp_r_req_i,
    input logic                    txrx_write_rsp_r_ready_i,
    

    output idma_pkg::idma_busy_t   idma_busy_o
);

    /// Define the error handling capability
    localparam idma_pkg::error_cap_e ErrorCap = ErrorHandling ? idma_pkg::ERROR_HANDLING :
                                                                idma_pkg::NO_ERROR_HANDLING;

    // OBI typedefs
`OBI_TYPEDEF_MINIMAL_A_OPTIONAL(a_optional_t)
`OBI_TYPEDEF_MINIMAL_R_OPTIONAL(r_optional_t)

`OBI_TYPEDEF_TYPE_A_CHAN_T(obi_a_chan_t, addr_t, data_t, strb_t, id_t, a_optional_t)
`OBI_TYPEDEF_TYPE_R_CHAN_T(obi_r_chan_t, data_t, id_t, r_optional_t)

`OBI_TYPEDEF_REQ_T(obi_req_t, obi_a_chan_t)
`OBI_TYPEDEF_RSP_T(obi_rsp_t, obi_r_chan_t)


    // TXRX typedefs
`TXRX_TYPEDEF_TYPE_A_CHAN_T(txrx_a_chan_t, data_t)
`TXRX_TYPEDEF_TYPE_R_CHAN_T(txrx_r_chan_t, data_t, tf_len_t)

`TXRX_TYPEDEF_REQ_T(txrx_req_t, txrx_a_chan_t)
`TXRX_TYPEDEF_RSP_T(txrx_rsp_t, txrx_r_chan_t)


    // Meta Channel Widths
    localparam int unsigned obi_a_chan_width = $bits(obi_a_chan_t);
    localparam int unsigned txrx_a_chan_width = $bits(txrx_a_chan_t);

    /// Option struct: AXI4 id as well as AXI and backend options
    /// - `last`: a flag can be set if this transfer is the last of a set of transfers
    `IDMA_TYPEDEF_OPTIONS_T(options_t, id_t)

    /// 1D iDMA request type:
    /// - `length`: the length of the transfer in bytes
    /// - `*_addr`: the source / target byte addresses of the transfer
    /// - `opt`: the options field
    `IDMA_TYPEDEF_REQ_T(idma_req_t, tf_len_t, addr_t, options_t)

    /// 1D iDMA response payload:
    /// - `cause`: the AXI response
    /// - `err_type`: type of the error: read, write, internal, ...
    /// - `burst_addr`: the burst address where the issue error occurred
    `IDMA_TYPEDEF_ERR_PAYLOAD_T(err_payload_t, addr_t)

    /// 1D iDMA response type:
    /// - `last`: the response of the request that was marked with the `opt.last` flag
    /// - `error`: 1 if an error occurred
    /// - `pld`: the error payload
    `IDMA_TYPEDEF_RSP_T(idma_rsp_t, err_payload_t)

    function int unsigned max_width(input int unsigned a, b);
        return (a > b) ? a : b;
    endfunction

    typedef struct packed {
        obi_a_chan_t a_chan;
        logic[max_width(obi_a_chan_width, txrx_a_chan_width)-obi_a_chan_width:0] padding;
    } obi_read_a_chan_padded_t;

    typedef struct packed {
        txrx_a_chan_t a_chan;
        logic[max_width(obi_a_chan_width, txrx_a_chan_width)-txrx_a_chan_width:0] padding;
    } txrx_read_a_chan_padded_t;

    typedef union packed {
        obi_read_a_chan_padded_t obi;
        txrx_read_a_chan_padded_t txrx;
    } read_meta_channel_t;

    typedef struct packed {
        obi_a_chan_t a_chan;
        logic[max_width(obi_a_chan_width, txrx_a_chan_width)-obi_a_chan_width:0] padding;
    } obi_write_a_chan_padded_t;

    typedef struct packed {
        txrx_a_chan_t a_chan;
        logic[max_width(obi_a_chan_width, txrx_a_chan_width)-txrx_a_chan_width:0] padding;
    } txrx_write_a_chan_padded_t;

    typedef union packed {
        obi_write_a_chan_padded_t obi;
        txrx_write_a_chan_padded_t txrx;
    } write_meta_channel_t;

    // local types
    // OBI request and response
    obi_req_t obi_read_req;
    obi_rsp_t obi_read_rsp;

    obi_req_t obi_write_req;
    obi_rsp_t obi_write_rsp;

    // TXRX request and response
    txrx_req_t txrx_read_req;
    txrx_rsp_t txrx_read_rsp;

    txrx_req_t txrx_write_req;
    txrx_rsp_t txrx_write_rsp;

    idma_req_t idma_req;
    idma_rsp_t idma_rsp;

    idma_backend_rw_obi_rw_txrx #(
        .CombinedShifter      ( CombinedShifter         ),
        .DataWidth            ( DataWidth               ),
        .AddrWidth            ( AddrWidth               ),
        .AxiIdWidth           ( AxiIdWidth              ),
        .UserWidth            ( UserWidth               ),
        .TFLenWidth           ( TFLenWidth              ),
        .MaskInvalidData      ( MaskInvalidData         ),
        .BufferDepth          ( BufferDepth             ),
        .NumAxInFlight        ( NumAxInFlight           ),
        .MemSysDepth          ( MemSysDepth             ),
        .RAWCouplingAvail     ( RAWCouplingAvail        ),
        .HardwareLegalizer    ( HardwareLegalizer       ),
        .RejectZeroTransfers  ( RejectZeroTransfers     ),
        .ErrorCap             ( ErrorCap                ),
        .idma_req_t           ( idma_req_t              ),
        .idma_rsp_t           ( idma_rsp_t              ),
        .idma_eh_req_t        ( idma_pkg::idma_eh_req_t ),
        .idma_busy_t          ( idma_pkg::idma_busy_t   ),
        .obi_req_t ( obi_req_t ),
        .obi_rsp_t ( obi_rsp_t ),
        .txrx_req_t ( txrx_req_t ),
        .txrx_rsp_t ( txrx_rsp_t ),
        .write_meta_channel_t ( write_meta_channel_t    ),
        .read_meta_channel_t  ( read_meta_channel_t     )
    ) i_idma_backend (
        .clk_i                ( clk_i          ),
        .rst_ni               ( rst_ni         ),
        .testmode_i           ( test_i         ),
        .idma_req_i           ( idma_req       ),
        .req_valid_i          ( req_valid_i    ),
        .req_ready_o          ( req_ready_o    ),
        .idma_rsp_o           ( idma_rsp       ),
        .rsp_valid_o          ( rsp_valid_o    ),
        .rsp_ready_i          ( rsp_ready_i    ),
        .idma_eh_req_i        ( eh_req_i       ),
        .eh_req_valid_i       ( eh_req_valid_i ),
        .eh_req_ready_o       ( eh_req_ready_o ),
        .obi_read_req_o       ( obi_read_req   ),
        .obi_read_rsp_i       ( obi_read_rsp   ),
        .txrx_read_req_o       ( txrx_read_req   ),
        .txrx_read_rsp_i       ( txrx_read_rsp   ),
        .obi_write_req_o      ( obi_write_req  ),
        .obi_write_rsp_i      ( obi_write_rsp  ),
        .txrx_write_req_o      ( txrx_write_req  ),
        .txrx_write_rsp_i      ( txrx_write_rsp  ),
        .busy_o               ( idma_busy_o    )
    );

    // flatten structs
    assign idma_req.dst_addr               = req_dst_addr_i;
    assign idma_req.src_addr               = req_src_addr_i;
    assign idma_req.length                 = req_length_i;
    assign idma_req.opt.src_protocol       = req_src_protocol_i;
    assign idma_req.opt.dst_protocol       = req_dst_protocol_i;
    assign idma_req.opt.axi_id             = req_axi_id_i;
    assign idma_req.opt.dst.cache          = req_dst_cache_i;
    assign idma_req.opt.dst.burst          = req_dst_burst_i;
    assign idma_req.opt.dst.qos            = req_dst_qos_i;
    assign idma_req.opt.dst.lock           = req_dst_lock_i;
    assign idma_req.opt.dst.prot           = req_dst_prot_i;
    assign idma_req.opt.dst.region         = req_dst_region_i;
    assign idma_req.opt.src.cache          = req_src_cache_i;
    assign idma_req.opt.src.burst          = req_src_burst_i;
    assign idma_req.opt.src.qos            = req_src_qos_i;
    assign idma_req.opt.src.lock           = req_src_lock_i;
    assign idma_req.opt.src.prot           = req_src_prot_i;
    assign idma_req.opt.src.region         = req_src_region_i;
    assign idma_req.opt.beo.dst_reduce_len = req_dst_reduce_len_i;
    assign idma_req.opt.beo.src_reduce_len = req_src_reduce_len_i;
    assign idma_req.opt.beo.dst_max_llen   = req_dst_max_llen_i;
    assign idma_req.opt.beo.src_max_llen   = req_src_max_llen_i;
    assign idma_req.opt.beo.decouple_rw    = req_decouple_rw_i;
    assign idma_req.opt.beo.decouple_aw    = req_decouple_aw_i;
    assign idma_req.opt.last               = req_last_i;

    assign rsp_cause_o      = idma_rsp.pld.cause;
    assign rsp_err_type_o   = idma_rsp.pld.err_type;
    assign rsp_burst_addr_o = idma_rsp.pld.burst_addr;
    assign rsp_error_o      = idma_rsp.error;
    assign rsp_last_o       = idma_rsp.last;


    // OBI Read
    assign obi_read_req_a_req_o   = obi_read_req.req;
    assign obi_read_req_a_addr_o  = obi_read_req.a.addr;
    assign obi_read_req_a_we_o    = obi_read_req.a.we;
    assign obi_read_req_a_be_o    = obi_read_req.a.be;
    assign obi_read_req_a_wdata_o = obi_read_req.a.wdata;
    assign obi_read_req_r_ready_o = obi_read_req.rready;
    
    assign obi_read_rsp.gnt     = obi_read_rsp_a_gnt_i;
    assign obi_read_rsp.rvalid  = obi_read_rsp_r_valid_i;
    assign obi_read_rsp.r.rdata = obi_read_rsp_r_rdata_i;
    assign obi_read_rsp.r.rid   = obi_read_rsp_r_rid_i;
    assign obi_read_rsp.r.err   = obi_read_rsp_r_err_i;
    


    // TXRX Read
    assign txrx_read_req_a_ready_o = txrx_read_req.ready;
    
    assign txrx_read_rsp.r.data = txrx_read_rsp_r_data_i;
    assign txrx_read_rsp.r.datasize = txrx_read_rsp_r_datasize_i;
    assign txrx_read_rsp.r.bytes_left = txrx_read_rsp_r_bytes_left_i;
    assign txrx_read_rsp.valid = txrx_read_rsp_r_valid_i;
    


    // OBI Write
    assign obi_write_req_a_req_o   = obi_write_req.req;
    assign obi_write_req_a_addr_o  = obi_write_req.a.addr;
    assign obi_write_req_a_we_o    = obi_write_req.a.we;
    assign obi_write_req_a_be_o    = obi_write_req.a.be;
    assign obi_write_req_a_wdata_o = obi_write_req.a.wdata;
    assign obi_write_req_a_aid_o   = obi_write_req.a.aid;
    assign obi_write_req_r_ready_o = obi_write_req.rready;
    
    assign obi_write_rsp.gnt     = obi_write_rsp_a_gnt_i;
    assign obi_write_rsp.rvalid  = obi_write_rsp_r_valid_i;
    assign obi_write_rsp.r.rdata = obi_write_rsp_r_rdata_i;
    


    // TXRX Write
    assign txrx_write_req_a_data_o  = txrx_write_req.a.data;
    assign txrx_write_req_a_valid_o = txrx_write_req.valid;
    
    assign txrx_write_rsp.r.datasize    = txrx_write_rsp_r_datasize_i;
    assign txrx_write_rsp.r.bytes_left  = txrx_write_rsp_r_bytes_left_i;
    assign txrx_write_rsp.req           = txrx_write_rsp_r_req_i;
    assign  txrx_write_rsp.ready        = txrx_write_rsp_r_ready_i;
    


endmodule

