transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/dlx_constants.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/Incrementer.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/ProgramCounter.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/RegisterFile.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/TwoMux.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/FactorialROM.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/ALU.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/DlxFetch.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/ShouldBranch.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/SignExtender.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/DlxDecode.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/DlxExecute.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/DLX.vhd}

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Execute/Factorial_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Factorial_TB

add wave *
view structure
view signals
run 30 ms
