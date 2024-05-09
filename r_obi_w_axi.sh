#!/bin/bash
make idma_sim_all
cd target/sim/vsim
$VSIM -c -do "source compile.tcl; quit"
$VSIM -t 1ps -voptargs=+acc \
     +job_file=jobs/idma_backend_r_obi_w_axi/simple.txt \
     -logfile idma_backend_r_obi_w_axi.log \
     -wlf idma_backend_r_obi_w_axi.wlf \
     tb_idma_backend_r_obi_w_axi \
     -do "source start.tcl; source wave/idma_backend_r_obi_w_axi.do; run -all"