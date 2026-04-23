## Generated SDC file "DLX_TOP.out.sdc"

## Copyright (C) 2025  Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus Prime License Agreement,
## the Altera IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Altera and sold by Altera or its authorized distributors.  Please
## refer to the Altera Software License Subscription Agreements 
## on the Quartus Prime software download page.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 24.1std.0 Build 1077 03/04/2025 SC Lite Edition"

## DATE    "Wed Apr 22 18:40:46 2026"

##
## DEVICE  "10M50DAF484C7G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {ADC_CLK_10} -period 100.000 -waveform { 0.000 50.000 } [get_ports {ADC_CLK_10}]
create_clock -name {MAX10_CLK1_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {MAX10_CLK1_50}]
create_clock -name {MAX10_CLK2_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {MAX10_CLK2_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {dlx|pll|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {dlx|pll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 183 -divide_by 476560 -master_clock {MAX10_CLK1_50} [get_pins {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {dlx|pll|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {dlx|pll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 61 -divide_by 19856 -master_clock {MAX10_CLK1_50} [get_pins {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {dlx|pll|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {dlx|pll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 183 -divide_by 176 -master_clock {MAX10_CLK1_50} [get_pins {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAX10_CLK1_50}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {MAX10_CLK1_50}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {MAX10_CLK1_50}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {MAX10_CLK1_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {dlx|pll|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -rise_to [get_clocks {MAX10_CLK1_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {MAX10_CLK1_50}] -fall_to [get_clocks {MAX10_CLK1_50}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_md9:dffpipe9|dffe10a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_ld9:dffpipe6|dffe7a*}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_kd9:dffpipe9|dffe10a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_jd9:dffpipe6|dffe7a*}]
set_false_path -from [get_keepers {DLX:dlx|PrintFIFO:printer|dcfifo:dcfifo_component|dcfifo_15p1:auto_generated|rdptr_g[6]}] -to [get_keepers {DLX:dlx|PrintFIFO:printer|dcfifo:dcfifo_component|dcfifo_15p1:auto_generated|wrfull_eq_comp_msb_mux_reg}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

