make idma_sim_all
cd target/sim/vsim
$VSIM -c -do "source compile.tcl; quit"
$VSIM -t 1ps -voptargs=+acc \
     +job_file=jobs/backend_rw_axi/simple.txt \
     -logfile rw_axi_simple.log \
     -wlf rw_axi_simple.wlf \
     tb_idma_backend_rw_axi \
     -do "source start.tcl; source wave/backend_rw_axi.do; run -all"