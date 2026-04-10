transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/ash/USU/Spring2026/ECE6740/Projects/Testing/db {/home/ash/USU/Spring2026/ECE6740/Projects/Testing/db/pll_altpll.v}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Testing/UART_TX.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Testing/UART_RX.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Testing/pll.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Testing/fifo.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Testing/ASCII_CONVERTER.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Testing/UART.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Testing/UART_TOP.vhd}

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Testing/UART_TOP_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  UART_TOP_TB

add wave *
view structure
view signals
run 2 ms
