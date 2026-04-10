transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/TwoMux.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/RegisterFile.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/ProgramCounter.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/Incrementer.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/dlx_constants.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/FactorialROM.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/SignExtender.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/DlxFetch.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/DlxDecode.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/DLX.vhd}

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Decode/Factorial_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Factorial_TB

add wave *
view structure
view signals
run 20 ms
