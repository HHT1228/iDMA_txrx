`ifndef TXRX_TYPEDEF_SVH
`define TXRX_TYPEDEF_SVH

`define TXRX_TYPEDEF_TYPE_R_CHAN_T(r_chan_t, data_t, tf_len_t) \
  typedef struct packed {                                                               \
    data_t        data;                                                                 \
    tf_len_t      datasize;                                                             \
    tf_len_t      bytes_left;                                                           \
  } r_chan_t;

`define TXRX_TYPEDEF_TYPE_A_CHAN_T(a_chan_t, data_t) \
  typedef struct packed {                                              \
    data_t       data;                                                 \
    logic        we;                                                   \
  } a_chan_t;

`define TXRX_TYPEDEF_RSP_T(rsp_t, r_chan_t) \
  typedef struct packed {                         \
    r_chan_t      r;                              \
    logic         req;                            \
    logic         valid;                          \
    logic         ready;                          \
  } rsp_t;

`define TXRX_TYPEDEF_REQ_T(req_t, a_chan_t) \
  typedef struct packed {                         \
    a_chan_t      a;                              \
    logic         ready;                          \
    logic         valid;                          \
  } req_t;

`endif // TXRX_TYPEDEF_SVH