transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {DLX.vho}

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/Factorial_TB.vhd}

vsim -t 1ps -L altera -L altera_lnsim -L fiftyfivenm -L gate_work -L work -voptargs="+acc"  Factorial_TB

add wave *
view structure
view signals
run 200 ms
