transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/FourMux.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/TwoMux.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/ThreeMux.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/RegisterFile.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/ProgramCounter.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/Incrementer.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/dlx_constants.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/DataMemory.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/InstructionMemory.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/FlushController.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/StallController.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/ForwardController.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/SignExtender.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/ShouldBranch.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/DlxWriteBack.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/DlxMemory.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/DlxFetch.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/ALU.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/DlxExecute.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/DlxDecode.vhd}
vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/DLX.vhd}

vcom -93 -work work {/home/ash/USU/Spring2026/ECE6740/Projects/Hazards/Factorial_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Factorial_TB

add wave *
view structure
view signals
run 200 ms
