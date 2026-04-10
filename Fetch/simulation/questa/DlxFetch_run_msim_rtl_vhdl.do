transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Fetch/TwoMux.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Fetch/ProgramCounter.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Fetch/Incrementer.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Fetch/FactorialROM.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Fetch/DlxFetch.vhd}

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Fetch/Factorial_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Factorial_TB

add wave *
view structure
view signals
run 30 ms
