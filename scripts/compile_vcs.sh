#!/usr/bin/env bash
# This script was generated automatically by bender.
ROOT="."

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/src/clk_rst_gen.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/src/rand_id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/src/rand_stream_mst.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/src/rand_synch_holdable_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/src/rand_verif_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/src/signal_highlighter.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/src/sim_timeout.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/src/stream_watchdog.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/src/rand_synch_driver.sv" \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/src/rand_stream_slv.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "$ROOT/.bender/git/checkouts/common_verification-3ebb66cef84ab947/test/tb_clk_rst_gen.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/rtl/tc_sram.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/rtl/tc_clk.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/deprecated/cluster_pwr_cells.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/deprecated/generic_memory.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/deprecated/generic_rom.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/deprecated/pad_functional.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/deprecated/pulp_buffer.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/deprecated/pulp_pwr_cells.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/tc_pwr.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/test/tb_tc_sram.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/deprecated/pulp_clock_gating_async.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/deprecated/cluster_clk_cells.sv" \
    "$ROOT/.bender/git/checkouts/tech_cells_generic-8af63a2e07919a79/src/deprecated/pulp_clk_cells.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/binary_to_gray.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cb_filter_pkg.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cc_onehot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cf_math_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/clk_int_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/delta_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/ecc_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/edge_propagator_tx.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/exp_backoff.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/fifo_v3.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/gray_to_binary.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/isochronous_4phase_handshake.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/isochronous_spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/lfsr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/lfsr_16bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/lfsr_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/mv_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/onehot_to_bin.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/plru_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/popcount.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/rr_arb_tree.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/rstgen_bypass.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/serial_deglitch.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/shift_reg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/spill_register_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_demux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_filter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_fork.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_intf.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_join.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_mux.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_throttle.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/sub_per_hash.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/unread.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cdc_reset_ctrlr_pkg.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/addr_decode_napot.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cdc_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cdc_4phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/addr_decode.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cb_filter.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cdc_fifo_2phase.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/ecc_decode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/ecc_encode.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/edge_detect.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/lzc.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/max_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/rstgen.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/spill_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_delay.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_fork_dynamic.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cdc_reset_ctrlr.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cdc_fifo_gray.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/fall_through_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/id_queue.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_arbiter_flushable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_fifo_optimal_wrap.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_register.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_xbar.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cdc_fifo_gray_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/cdc_2phase_clearable.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_arbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/stream_omega_net.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/sram.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/addr_decode_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/cb_filter_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/cdc_2phase_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/cdc_2phase_clearable_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/cdc_fifo_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/cdc_fifo_clearable_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/fifo_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/graycode_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/id_queue_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/popcount_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/rr_arb_tree_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/stream_test.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/stream_register_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/stream_to_mem_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/sub_per_hash_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/isochronous_crossing_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/stream_omega_net_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/stream_xbar_tb.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/test/clk_int_div_tb.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/clock_divider_counter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/clk_div.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/find_first_one.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/generic_LFSR_8bit.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/generic_fifo.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/prioarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/pulp_sync.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/pulp_sync_wedge.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/rrarbiter.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/clock_divider.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/fifo_v2.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/deprecated/fifo_v1.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/edge_propagator_ack.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/edge_propagator.sv" \
    "$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/src/edge_propagator_rx.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_intf.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_burst_splitter.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_bus_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_cdc_dst.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_cdc_src.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_cut.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_fifo.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_id_remap.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_id_prepend.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lite_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lite_from_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lite_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lite_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lite_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_rw_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_rw_split.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_slave_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_throttle.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_from_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_id_serialize.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_multicut.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_to_mem_banked.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_to_mem_interleaved.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_to_mem_split.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_xp.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_chan_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_dumper.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_sim_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/src/axi_test.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_dw_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_xbar_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_addr_test.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_bus_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_fifo.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_sim_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_slave_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_to_mem_banked.sv" \
    "$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/test/tb_axi_xbar.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/include" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/reg_intf.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/vendor/lowrisc_opentitan/src/prim_subreg_arb.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/vendor/lowrisc_opentitan/src/prim_subreg_ext.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/apb_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/axi_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/periph_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/reg_cdc.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/reg_demux.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/reg_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/reg_mux.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/reg_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/reg_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/reg_uniform.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/reg_to_tlul.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/vendor/lowrisc_opentitan/src/prim_subreg_shadow.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/vendor/lowrisc_opentitan/src/prim_subreg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/axi_lite_to_reg.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/include" \
    "$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/src/reg_test.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/include" \
    "+incdir+$ROOT/src/include" \
    "$ROOT/src/frontends/idma_transfer_id_gen.sv" \
    "$ROOT/src/idma_pkg.sv" \
    "$ROOT/src/idma_stream_fifo.sv" \
    "$ROOT/src/idma_buffer.sv" \
    "$ROOT/src/idma_error_handler.sv" \
    "$ROOT/src/idma_channel_coupler.sv" \
    "$ROOT/src/idma_axi_transport_layer.sv" \
    "$ROOT/src/idma_axi_lite_transport_layer.sv" \
    "$ROOT/src/idma_obi_transport_layer.sv" \
    "$ROOT/src/idma_legalizer.sv" \
    "$ROOT/src/idma_backend.sv" \
    "$ROOT/src/legacy/axi_dma_backend.sv" \
    "$ROOT/src/legacy/midends/idma_2D_midend.sv" \
    "$ROOT/src/midends/idma_nd_midend.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/include" \
    "+incdir+$ROOT/src/include" \
    "$ROOT/src/frontends/register_32bit_2d/idma_reg32_2d_frontend_reg_pkg.sv" \
    "$ROOT/src/frontends/register_32bit_2d/idma_reg32_2d_frontend_reg_top.sv" \
    "$ROOT/src/frontends/register_32bit_2d/idma_reg32_2d_frontend.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/include" \
    "+incdir+$ROOT/src/include" \
    "$ROOT/src/frontends/register_64bit/idma_reg64_frontend_reg_pkg.sv" \
    "$ROOT/src/frontends/register_64bit/idma_reg64_frontend_reg_top.sv" \
    "$ROOT/src/frontends/register_64bit/idma_reg64_frontend.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/include" \
    "+incdir+$ROOT/src/include" \
    "$ROOT/src/frontends/register_64bit_2d/idma_reg64_2d_frontend_reg_pkg.sv" \
    "$ROOT/src/frontends/register_64bit_2d/idma_reg64_2d_frontend_reg_top.sv" \
    "$ROOT/src/frontends/register_64bit_2d/idma_reg64_2d_frontend.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/include" \
    "+incdir+$ROOT/src/include" \
    "$ROOT/src/frontends/desc64/idma_desc64_reg_pkg.sv" \
    "$ROOT/src/frontends/desc64/idma_desc64_reg_top.sv" \
    "$ROOT/src/frontends/desc64/idma_desc64_shared_counter.sv" \
    "$ROOT/src/frontends/desc64/idma_desc64_reg_wrapper.sv" \
    "$ROOT/src/frontends/desc64/idma_desc64_top.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_SIMULATION \
    +define+TARGET_RTL \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/include" \
    "+incdir+$ROOT/src/include" \
    "+incdir+$ROOT/test" \
    "$ROOT/test/idma_intf.sv" \
    "$ROOT/test/idma_tb_per2axi.sv" \
    "$ROOT/test/idma_obi_asserter.sv" \
    "$ROOT/test/idma_test.sv" \
    "$ROOT/test/idma_obi2axi_bridge.sv" \
    "$ROOT/test/tb_idma_backend.sv" \
    "$ROOT/test/tb_idma_lite_backend.sv" \
    "$ROOT/test/tb_idma_obi_backend.sv" \
    "$ROOT/test/tb_idma_nd_backend.sv" 

vlogan -sverilog \
    -full64 \
    \-assert svaext -assert disable_cover -full64 -sysc=q -nc -q -timescale=1ns/1ns \
    +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_TEST \
    +define+TARGET_VCS \
    "+incdir+$ROOT/.bender/git/checkouts/axi-abdc7650ff8952ec/include" \
    "+incdir+$ROOT/.bender/git/checkouts/common_cells-b5ef1d9e9e7e3ce8/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-b8f5b6eab31564be/include" \
    "+incdir+$ROOT/src/include" \
    "$ROOT/test/frontends/tb_idma_desc64_top.sv" 


