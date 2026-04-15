transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/db {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/db/UartPll_altpll.v}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/UART_TX.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/UART_RX.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/TwoMux.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/ThreeMux.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/Stopwatch.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/RegisterFile.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/ProgramCounter.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/Incrementer.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/FourMux.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/dlx_constants.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/PrintFIFO.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/UartFIFO.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/UartPll.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/Divider.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/Stack.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/ScanFIFO.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/Multiplier.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/InstructionMemory.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/DataMemory.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/TimeHandler.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/StallController.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/SignExtender.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/ShouldBranch.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/ScanHandler.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/PrintHandler.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/ForwardController.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/FlushController.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/DlxWriteBack.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/DlxMemory.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/DlxFetch.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/ALU.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/DlxExecute.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/DlxDecode.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/DLX.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/DLX_TOP.vhd}

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/FinalProject/Factorial_TB.vhd}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  Factorial_TB

add wave *
view structure
view signals
run 3 ms
