/// Implementing the TXRX write task in the iDMA transport layer.
// Writes data to the TX channel of peripheral.
module idma_txrx_write #(
    /// Stobe width
    parameter int unsigned StrbWidth = 32'd16,
    /// Mask invalid data on the manager interface
    parameter bit MaskInvalidData = 1'b1,

    /// Byte type
    parameter type byte_t = logic,
    /// Data type
    parameter type data_t = logic,
    /// Offset type
    parameter type strb_t = logic,

    /// TXRX Request channel type
    parameter type write_req_t = logic,
    /// TXRX Response channel type
    parameter type write_rsp_t = logic,

    /// `w_dp_req_t` type:
    parameter type w_dp_req_t = logic,
    /// `w_dp_rsp_t` type:
    parameter type w_dp_rsp_t = logic,
    /// AXI 4 `AW` channel type
    parameter type write_meta_channel_t = logic
) (
    /// Write datapath request
    input  w_dp_req_t w_dp_req_i,
    /// Write datapath request valid
    input  logic w_dp_valid_i,
    /// Write datapath request ready
    output logic w_dp_ready_o,

    /// Datapath poison signal
    input  logic dp_poison_i,

    /// Write datapath response
    output w_dp_rsp_t w_dp_rsp_o,
    /// Write datapath response valid
    output logic w_dp_valid_o,
    /// Write datapath response valid
    input  logic w_dp_ready_i,

    /// Write meta request
    input  write_meta_channel_t aw_req_i,
    /// Write meta request valid
    input  logic aw_valid_i,
    /// Write meta request ready
    output logic aw_ready_o,

    /// TX write manager port request
    output write_req_t write_req_o,         // data, valid
    /// TX write manager port response
    // TODO: datasize and bytes_left are not used
    input  write_rsp_t write_rsp_i,         // req, ready, datasize, bytes_left

    /// Data from buffer
    input  byte_t [StrbWidth-1:0] buffer_out_i,
    /// Valid from buffer
    input  strb_t buffer_out_valid_i,
    /// Ready to buffer
    output strb_t buffer_out_ready_o
);
    // corresponds to the strobe: the write aligned data that is currently valid in the buffer
    strb_t mask_out;

    // buffer is ready to write the requested data
    logic ready_to_write;
    // buffer is completely empty
    logic buffer_clean;
    // write happens
    logic write_happening;

    // A temporary signal required to write the output of the buffer to before assigning it to
    // TX output. This is required to be compatible with some of the Questasim Versions and some
    // of the parametrizations (e.g. DataWidth = 16)
    data_t buffer_data_masked;
    
    // A peripheral with a TX channel is ready for transmission
    logic ready_to_accept;

    //--------------------------------------
    // Out mask generation -> (be mask)
    //--------------------------------------
    // only pop the data actually needed for write from the buffer,
    // determine valid data to pop by calculation the be

    assign mask_out = ('1 << w_dp_req_i.offset) &
        ((w_dp_req_i.tailer != '0) ? ('1 >> (StrbWidth - w_dp_req_i.tailer))
        : '1);

    //--------------------------------------
    // Write control
    //--------------------------------------

    // Peripheral raises ready and request informing iDMA: it is ready to accept new data
    assign ready_to_accept = write_rsp_i.req && write_rsp_i.ready;

    // all elements needed (defined by the mask) are in the buffer and the buffer is non-empty
    assign ready_to_write = aw_valid_i & w_dp_valid_i
        & ((buffer_out_valid_i & mask_out) == mask_out) & (buffer_out_valid_i != '0);

    // the buffer is completely empty and idle
    assign buffer_clean = &(~buffer_out_valid_i);

    // write happening: both the bus (w_ready) and the buffer (ready_to_write) is high
    assign write_happening = ready_to_write & ready_to_accept;

    // the main buffer is conditionally to the write mask popped
    assign buffer_out_ready_o = write_happening ? mask_out : '0;

    // signal the bus that we are ready
    // assign write_req_o.req = ready_to_write;

    assign write_req_o.a.we = '1;

    // connect data and strobe either directly or mask invalid data
    if (MaskInvalidData) begin : gen_mask_invalid_data

        // always_comb process implements masking of invalid data
        always_comb begin : proc_mask
            // defaults
            write_req_o.a.data = '0;
            write_req_o.valid = '0;
            // control the write to the bus apply data to the bus only if data should be written
            if (ready_to_write == 1'b1 & !dp_poison_i & ready_to_accept) begin
                // assign data from buffers, mask non valid entries
                for (int i = 0; i < StrbWidth; i++) begin
                    buffer_data_masked[i*8 +: 8] = mask_out[i] ? buffer_out_i[i] : 8'b0;
                end
                // assign the output
                write_req_o.a.data = buffer_data_masked;
                // raise the valid signal
                write_req_o.valid = '1;
            end
        end

    end else begin : gen_direct_connect
        always_comb begin
            // defaults
            write_req_o.a.data = '0;
            write_req_o.valid = '0;
            // Directly connect the data to output
            if (ready_to_write & ready_to_accept) begin
                // assign the output
                write_req_o.a.data = buffer_out_i;
                // raise the valid signal
                write_req_o.valid = '1;
            end
            // not used signal
            assign buffer_data_masked  = '0;
        end
    end

    // we are ready for the next transfer internally, once the w last signal is applied
    assign w_dp_ready_o = write_happening;
    assign aw_ready_o   = write_happening;

    //--------------------------------------
    // Write response
    //--------------------------------------
    // connect w_dp response payload
    assign w_dp_rsp_o = '0;

    // FIXME: peripherals do not give write answers
    // w_dp_valid_o is triggered once the write answer is here
    assign w_dp_valid_o = write_req_o.valid;

endmodule
