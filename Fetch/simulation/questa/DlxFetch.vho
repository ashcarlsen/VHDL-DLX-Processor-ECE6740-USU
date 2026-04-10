-- Copyright (C) 2025  Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Altera and sold by Altera or its authorized distributors.  Please
-- refer to the Altera Software License Subscription Agreements 
-- on the Quartus Prime software download page.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 24.1std.0 Build 1077 03/04/2025 SC Lite Edition"

-- DATE "01/28/2026 11:44:19"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DlxFetch IS
    PORT (
	CLK : IN std_logic;
	RST : IN std_logic;
	JUMP_ADDRESS : IN std_logic_vector(9 DOWNTO 0);
	JUMP_FLAG : IN std_logic;
	NEXT_ADDR : BUFFER std_logic_vector(9 DOWNTO 0);
	INSTRUCTION : BUFFER std_logic_vector(31 DOWNTO 0)
	);
END DlxFetch;

-- Design Ports Information
-- NEXT_ADDR[0]	=>  Location: PIN_AA11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- NEXT_ADDR[1]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- NEXT_ADDR[2]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- NEXT_ADDR[3]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- NEXT_ADDR[4]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- NEXT_ADDR[5]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- NEXT_ADDR[6]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- NEXT_ADDR[7]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- NEXT_ADDR[8]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- NEXT_ADDR[9]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[1]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[2]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[3]	=>  Location: PIN_P13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[4]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[5]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[6]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[7]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[8]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[9]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[10]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[11]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[12]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[13]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[14]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[15]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[16]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[17]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[18]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[19]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[20]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[21]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[22]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[23]	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[24]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[25]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[26]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[27]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[28]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[29]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[30]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INSTRUCTION[31]	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_ADDRESS[0]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_FLAG	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_ADDRESS[1]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_ADDRESS[2]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_ADDRESS[3]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_ADDRESS[4]	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_ADDRESS[5]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_ADDRESS[6]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_ADDRESS[7]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_ADDRESS[8]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JUMP_ADDRESS[9]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DlxFetch IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RST : std_logic;
SIGNAL ww_JUMP_ADDRESS : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_JUMP_FLAG : std_logic;
SIGNAL ww_NEXT_ADDR : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_INSTRUCTION : std_logic_vector(31 DOWNTO 0);
SIGNAL \rom|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \rom|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \rom|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \rom|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \rom|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \RST~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \NEXT_ADDR[0]~output_o\ : std_logic;
SIGNAL \NEXT_ADDR[1]~output_o\ : std_logic;
SIGNAL \NEXT_ADDR[2]~output_o\ : std_logic;
SIGNAL \NEXT_ADDR[3]~output_o\ : std_logic;
SIGNAL \NEXT_ADDR[4]~output_o\ : std_logic;
SIGNAL \NEXT_ADDR[5]~output_o\ : std_logic;
SIGNAL \NEXT_ADDR[6]~output_o\ : std_logic;
SIGNAL \NEXT_ADDR[7]~output_o\ : std_logic;
SIGNAL \NEXT_ADDR[8]~output_o\ : std_logic;
SIGNAL \NEXT_ADDR[9]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[0]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[1]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[2]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[3]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[4]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[5]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[6]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[7]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[8]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[9]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[10]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[11]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[12]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[13]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[14]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[15]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[16]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[17]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[18]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[19]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[20]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[21]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[22]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[23]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[24]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[25]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[26]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[27]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[28]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[29]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[30]~output_o\ : std_logic;
SIGNAL \INSTRUCTION[31]~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \JUMP_ADDRESS[0]~input_o\ : std_logic;
SIGNAL \JUMP_FLAG~input_o\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[0]~0_combout\ : std_logic;
SIGNAL \RST~input_o\ : std_logic;
SIGNAL \RST~inputclkctrl_outclk\ : std_logic;
SIGNAL \inc|Q[0]~0_combout\ : std_logic;
SIGNAL \inc|Add0~0_combout\ : std_logic;
SIGNAL \NEXT_ADDR[0]~reg0_q\ : std_logic;
SIGNAL \JUMP_ADDRESS[1]~input_o\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[1]~1_combout\ : std_logic;
SIGNAL \inc|Q[0]~1\ : std_logic;
SIGNAL \inc|Q[1]~2_combout\ : std_logic;
SIGNAL \inc|Add0~1_combout\ : std_logic;
SIGNAL \NEXT_ADDR[1]~reg0_q\ : std_logic;
SIGNAL \JUMP_ADDRESS[2]~input_o\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[2]~2_combout\ : std_logic;
SIGNAL \inc|Q[1]~3\ : std_logic;
SIGNAL \inc|Q[2]~4_combout\ : std_logic;
SIGNAL \inc|Add0~2_combout\ : std_logic;
SIGNAL \NEXT_ADDR[2]~reg0_q\ : std_logic;
SIGNAL \JUMP_ADDRESS[3]~input_o\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[3]~3_combout\ : std_logic;
SIGNAL \inc|Q[2]~5\ : std_logic;
SIGNAL \inc|Q[3]~6_combout\ : std_logic;
SIGNAL \inc|Add0~3_combout\ : std_logic;
SIGNAL \NEXT_ADDR[3]~reg0_q\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[4]~4_combout\ : std_logic;
SIGNAL \inc|Q[3]~7\ : std_logic;
SIGNAL \inc|Q[4]~8_combout\ : std_logic;
SIGNAL \JUMP_ADDRESS[4]~input_o\ : std_logic;
SIGNAL \inc|Add0~4_combout\ : std_logic;
SIGNAL \NEXT_ADDR[4]~reg0_q\ : std_logic;
SIGNAL \JUMP_ADDRESS[5]~input_o\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[5]~5_combout\ : std_logic;
SIGNAL \inc|Q[4]~9\ : std_logic;
SIGNAL \inc|Q[5]~10_combout\ : std_logic;
SIGNAL \inc|Add0~5_combout\ : std_logic;
SIGNAL \NEXT_ADDR[5]~reg0_q\ : std_logic;
SIGNAL \JUMP_ADDRESS[6]~input_o\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[6]~6_combout\ : std_logic;
SIGNAL \inc|Q[5]~11\ : std_logic;
SIGNAL \inc|Q[6]~12_combout\ : std_logic;
SIGNAL \inc|Add0~6_combout\ : std_logic;
SIGNAL \NEXT_ADDR[6]~reg0_q\ : std_logic;
SIGNAL \JUMP_ADDRESS[7]~input_o\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[7]~7_combout\ : std_logic;
SIGNAL \inc|Q[6]~13\ : std_logic;
SIGNAL \inc|Q[7]~14_combout\ : std_logic;
SIGNAL \inc|Add0~7_combout\ : std_logic;
SIGNAL \NEXT_ADDR[7]~reg0_q\ : std_logic;
SIGNAL \JUMP_ADDRESS[8]~input_o\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[8]~8_combout\ : std_logic;
SIGNAL \inc|Q[7]~15\ : std_logic;
SIGNAL \inc|Q[8]~16_combout\ : std_logic;
SIGNAL \inc|Add0~8_combout\ : std_logic;
SIGNAL \NEXT_ADDR[8]~reg0_q\ : std_logic;
SIGNAL \JUMP_ADDRESS[9]~input_o\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[9]~9_combout\ : std_logic;
SIGNAL \inc|Q[8]~17\ : std_logic;
SIGNAL \inc|Q[9]~18_combout\ : std_logic;
SIGNAL \inc|Add0~9_combout\ : std_logic;
SIGNAL \NEXT_ADDR[9]~reg0_q\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[0]~_wirecell_combout\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[1]~_wirecell_combout\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[2]~_wirecell_combout\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[3]~_wirecell_combout\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[4]~_wirecell_combout\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[5]~_wirecell_combout\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[6]~_wirecell_combout\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[7]~_wirecell_combout\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[8]~_wirecell_combout\ : std_logic;
SIGNAL \pc|OUT_ADDRESS[9]~_wirecell_combout\ : std_logic;
SIGNAL \pc|OUT_ADDRESS\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \rom|altsyncram_component|auto_generated|q_a\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_RST~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLK <= CLK;
ww_RST <= RST;
ww_JUMP_ADDRESS <= JUMP_ADDRESS;
ww_JUMP_FLAG <= JUMP_FLAG;
NEXT_ADDR <= ww_NEXT_ADDR;
INSTRUCTION <= ww_INSTRUCTION;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rom|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\pc|OUT_ADDRESS[9]~_wirecell_combout\ & \pc|OUT_ADDRESS[8]~_wirecell_combout\ & \pc|OUT_ADDRESS[7]~_wirecell_combout\ & \pc|OUT_ADDRESS[6]~_wirecell_combout\ & 
\pc|OUT_ADDRESS[5]~_wirecell_combout\ & \pc|OUT_ADDRESS[4]~_wirecell_combout\ & \pc|OUT_ADDRESS[3]~_wirecell_combout\ & \pc|OUT_ADDRESS[2]~_wirecell_combout\ & \pc|OUT_ADDRESS[1]~_wirecell_combout\ & \pc|OUT_ADDRESS[0]~_wirecell_combout\);

\rom|altsyncram_component|auto_generated|q_a\(0) <= \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\rom|altsyncram_component|auto_generated|q_a\(1) <= \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\rom|altsyncram_component|auto_generated|q_a\(2) <= \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\rom|altsyncram_component|auto_generated|q_a\(3) <= \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\rom|altsyncram_component|auto_generated|q_a\(4) <= \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\rom|altsyncram_component|auto_generated|q_a\(5) <= \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\rom|altsyncram_component|auto_generated|q_a\(6) <= \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\rom|altsyncram_component|auto_generated|q_a\(7) <= \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\rom|altsyncram_component|auto_generated|q_a\(8) <= \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);

\rom|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\pc|OUT_ADDRESS[9]~_wirecell_combout\ & \pc|OUT_ADDRESS[8]~_wirecell_combout\ & \pc|OUT_ADDRESS[7]~_wirecell_combout\ & \pc|OUT_ADDRESS[6]~_wirecell_combout\ & 
\pc|OUT_ADDRESS[5]~_wirecell_combout\ & \pc|OUT_ADDRESS[4]~_wirecell_combout\ & \pc|OUT_ADDRESS[3]~_wirecell_combout\ & \pc|OUT_ADDRESS[2]~_wirecell_combout\ & \pc|OUT_ADDRESS[1]~_wirecell_combout\ & \pc|OUT_ADDRESS[0]~_wirecell_combout\);

\rom|altsyncram_component|auto_generated|q_a\(9) <= \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(0);
\rom|altsyncram_component|auto_generated|q_a\(10) <= \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(1);
\rom|altsyncram_component|auto_generated|q_a\(11) <= \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(2);
\rom|altsyncram_component|auto_generated|q_a\(12) <= \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(3);
\rom|altsyncram_component|auto_generated|q_a\(13) <= \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(4);
\rom|altsyncram_component|auto_generated|q_a\(14) <= \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(5);
\rom|altsyncram_component|auto_generated|q_a\(15) <= \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(6);
\rom|altsyncram_component|auto_generated|q_a\(16) <= \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(7);
\rom|altsyncram_component|auto_generated|q_a\(17) <= \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(8);

\rom|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ <= (\pc|OUT_ADDRESS[9]~_wirecell_combout\ & \pc|OUT_ADDRESS[8]~_wirecell_combout\ & \pc|OUT_ADDRESS[7]~_wirecell_combout\ & \pc|OUT_ADDRESS[6]~_wirecell_combout\ & 
\pc|OUT_ADDRESS[5]~_wirecell_combout\ & \pc|OUT_ADDRESS[4]~_wirecell_combout\ & \pc|OUT_ADDRESS[3]~_wirecell_combout\ & \pc|OUT_ADDRESS[2]~_wirecell_combout\ & \pc|OUT_ADDRESS[1]~_wirecell_combout\ & \pc|OUT_ADDRESS[0]~_wirecell_combout\);

\rom|altsyncram_component|auto_generated|q_a\(18) <= \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(0);
\rom|altsyncram_component|auto_generated|q_a\(19) <= \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(1);
\rom|altsyncram_component|auto_generated|q_a\(20) <= \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(2);
\rom|altsyncram_component|auto_generated|q_a\(21) <= \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(3);
\rom|altsyncram_component|auto_generated|q_a\(22) <= \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(4);
\rom|altsyncram_component|auto_generated|q_a\(23) <= \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(5);
\rom|altsyncram_component|auto_generated|q_a\(24) <= \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(6);
\rom|altsyncram_component|auto_generated|q_a\(25) <= \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(7);
\rom|altsyncram_component|auto_generated|q_a\(26) <= \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(8);

\rom|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\ <= (\pc|OUT_ADDRESS[9]~_wirecell_combout\ & \pc|OUT_ADDRESS[8]~_wirecell_combout\ & \pc|OUT_ADDRESS[7]~_wirecell_combout\ & \pc|OUT_ADDRESS[6]~_wirecell_combout\ & 
\pc|OUT_ADDRESS[5]~_wirecell_combout\ & \pc|OUT_ADDRESS[4]~_wirecell_combout\ & \pc|OUT_ADDRESS[3]~_wirecell_combout\ & \pc|OUT_ADDRESS[2]~_wirecell_combout\ & \pc|OUT_ADDRESS[1]~_wirecell_combout\ & \pc|OUT_ADDRESS[0]~_wirecell_combout\);

\rom|altsyncram_component|auto_generated|q_a\(27) <= \rom|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\(0);
\rom|altsyncram_component|auto_generated|q_a\(28) <= \rom|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\(1);
\rom|altsyncram_component|auto_generated|q_a\(29) <= \rom|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\(2);
\rom|altsyncram_component|auto_generated|q_a\(30) <= \rom|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\(3);
\rom|altsyncram_component|auto_generated|q_a\(31) <= \rom|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\(4);

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\RST~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \RST~input_o\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
\ALT_INV_RST~inputclkctrl_outclk\ <= NOT \RST~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y42_N12
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X40_Y0_N9
\NEXT_ADDR[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NEXT_ADDR[0]~reg0_q\,
	devoe => ww_devoe,
	o => \NEXT_ADDR[0]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\NEXT_ADDR[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NEXT_ADDR[1]~reg0_q\,
	devoe => ww_devoe,
	o => \NEXT_ADDR[1]~output_o\);

-- Location: IOOBUF_X38_Y0_N16
\NEXT_ADDR[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NEXT_ADDR[2]~reg0_q\,
	devoe => ww_devoe,
	o => \NEXT_ADDR[2]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\NEXT_ADDR[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NEXT_ADDR[3]~reg0_q\,
	devoe => ww_devoe,
	o => \NEXT_ADDR[3]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\NEXT_ADDR[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NEXT_ADDR[4]~reg0_q\,
	devoe => ww_devoe,
	o => \NEXT_ADDR[4]~output_o\);

-- Location: IOOBUF_X34_Y0_N9
\NEXT_ADDR[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NEXT_ADDR[5]~reg0_q\,
	devoe => ww_devoe,
	o => \NEXT_ADDR[5]~output_o\);

-- Location: IOOBUF_X36_Y0_N2
\NEXT_ADDR[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NEXT_ADDR[6]~reg0_q\,
	devoe => ww_devoe,
	o => \NEXT_ADDR[6]~output_o\);

-- Location: IOOBUF_X34_Y0_N16
\NEXT_ADDR[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NEXT_ADDR[7]~reg0_q\,
	devoe => ww_devoe,
	o => \NEXT_ADDR[7]~output_o\);

-- Location: IOOBUF_X40_Y0_N23
\NEXT_ADDR[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NEXT_ADDR[8]~reg0_q\,
	devoe => ww_devoe,
	o => \NEXT_ADDR[8]~output_o\);

-- Location: IOOBUF_X34_Y0_N2
\NEXT_ADDR[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \NEXT_ADDR[9]~reg0_q\,
	devoe => ww_devoe,
	o => \NEXT_ADDR[9]~output_o\);

-- Location: IOOBUF_X56_Y0_N16
\INSTRUCTION[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(0),
	devoe => ww_devoe,
	o => \INSTRUCTION[0]~output_o\);

-- Location: IOOBUF_X51_Y0_N23
\INSTRUCTION[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(1),
	devoe => ww_devoe,
	o => \INSTRUCTION[1]~output_o\);

-- Location: IOOBUF_X51_Y0_N16
\INSTRUCTION[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(2),
	devoe => ww_devoe,
	o => \INSTRUCTION[2]~output_o\);

-- Location: IOOBUF_X51_Y0_N30
\INSTRUCTION[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(3),
	devoe => ww_devoe,
	o => \INSTRUCTION[3]~output_o\);

-- Location: IOOBUF_X49_Y0_N2
\INSTRUCTION[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(4),
	devoe => ww_devoe,
	o => \INSTRUCTION[4]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\INSTRUCTION[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(5),
	devoe => ww_devoe,
	o => \INSTRUCTION[5]~output_o\);

-- Location: IOOBUF_X49_Y0_N16
\INSTRUCTION[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(6),
	devoe => ww_devoe,
	o => \INSTRUCTION[6]~output_o\);

-- Location: IOOBUF_X51_Y0_N9
\INSTRUCTION[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(7),
	devoe => ww_devoe,
	o => \INSTRUCTION[7]~output_o\);

-- Location: IOOBUF_X54_Y0_N30
\INSTRUCTION[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(8),
	devoe => ww_devoe,
	o => \INSTRUCTION[8]~output_o\);

-- Location: IOOBUF_X56_Y0_N30
\INSTRUCTION[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(9),
	devoe => ww_devoe,
	o => \INSTRUCTION[9]~output_o\);

-- Location: IOOBUF_X56_Y0_N2
\INSTRUCTION[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(10),
	devoe => ww_devoe,
	o => \INSTRUCTION[10]~output_o\);

-- Location: IOOBUF_X54_Y0_N16
\INSTRUCTION[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(11),
	devoe => ww_devoe,
	o => \INSTRUCTION[11]~output_o\);

-- Location: IOOBUF_X56_Y0_N9
\INSTRUCTION[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(12),
	devoe => ww_devoe,
	o => \INSTRUCTION[12]~output_o\);

-- Location: IOOBUF_X56_Y0_N23
\INSTRUCTION[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(13),
	devoe => ww_devoe,
	o => \INSTRUCTION[13]~output_o\);

-- Location: IOOBUF_X54_Y0_N2
\INSTRUCTION[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(14),
	devoe => ww_devoe,
	o => \INSTRUCTION[14]~output_o\);

-- Location: IOOBUF_X54_Y0_N9
\INSTRUCTION[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(15),
	devoe => ww_devoe,
	o => \INSTRUCTION[15]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\INSTRUCTION[16]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(16),
	devoe => ww_devoe,
	o => \INSTRUCTION[16]~output_o\);

-- Location: IOOBUF_X51_Y0_N2
\INSTRUCTION[17]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(17),
	devoe => ww_devoe,
	o => \INSTRUCTION[17]~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\INSTRUCTION[18]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(18),
	devoe => ww_devoe,
	o => \INSTRUCTION[18]~output_o\);

-- Location: IOOBUF_X26_Y0_N23
\INSTRUCTION[19]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(19),
	devoe => ww_devoe,
	o => \INSTRUCTION[19]~output_o\);

-- Location: IOOBUF_X29_Y0_N16
\INSTRUCTION[20]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(20),
	devoe => ww_devoe,
	o => \INSTRUCTION[20]~output_o\);

-- Location: IOOBUF_X24_Y0_N30
\INSTRUCTION[21]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(21),
	devoe => ww_devoe,
	o => \INSTRUCTION[21]~output_o\);

-- Location: IOOBUF_X29_Y0_N23
\INSTRUCTION[22]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(22),
	devoe => ww_devoe,
	o => \INSTRUCTION[22]~output_o\);

-- Location: IOOBUF_X26_Y0_N30
\INSTRUCTION[23]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(23),
	devoe => ww_devoe,
	o => \INSTRUCTION[23]~output_o\);

-- Location: IOOBUF_X31_Y0_N16
\INSTRUCTION[24]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(24),
	devoe => ww_devoe,
	o => \INSTRUCTION[24]~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\INSTRUCTION[25]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(25),
	devoe => ww_devoe,
	o => \INSTRUCTION[25]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\INSTRUCTION[26]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(26),
	devoe => ww_devoe,
	o => \INSTRUCTION[26]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\INSTRUCTION[27]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(27),
	devoe => ww_devoe,
	o => \INSTRUCTION[27]~output_o\);

-- Location: IOOBUF_X29_Y0_N30
\INSTRUCTION[28]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(28),
	devoe => ww_devoe,
	o => \INSTRUCTION[28]~output_o\);

-- Location: IOOBUF_X26_Y0_N16
\INSTRUCTION[29]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(29),
	devoe => ww_devoe,
	o => \INSTRUCTION[29]~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\INSTRUCTION[30]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(30),
	devoe => ww_devoe,
	o => \INSTRUCTION[30]~output_o\);

-- Location: IOOBUF_X26_Y0_N2
\INSTRUCTION[31]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rom|altsyncram_component|auto_generated|q_a\(31),
	devoe => ww_devoe,
	o => \INSTRUCTION[31]~output_o\);

-- Location: IOIBUF_X0_Y18_N15
\CLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G3
\CLK~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X40_Y0_N1
\JUMP_ADDRESS[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_ADDRESS(0),
	o => \JUMP_ADDRESS[0]~input_o\);

-- Location: IOIBUF_X40_Y0_N29
\JUMP_FLAG~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_FLAG,
	o => \JUMP_FLAG~input_o\);

-- Location: LCCOMB_X40_Y2_N20
\pc|OUT_ADDRESS[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[0]~0_combout\ = !\inc|Add0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inc|Add0~0_combout\,
	combout => \pc|OUT_ADDRESS[0]~0_combout\);

-- Location: IOIBUF_X0_Y18_N22
\RST~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST,
	o => \RST~input_o\);

-- Location: CLKCTRL_G4
\RST~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \RST~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \RST~inputclkctrl_outclk\);

-- Location: FF_X40_Y2_N21
\pc|OUT_ADDRESS[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \pc|OUT_ADDRESS[0]~0_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc|OUT_ADDRESS\(0));

-- Location: LCCOMB_X39_Y2_N6
\inc|Q[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Q[0]~0_combout\ = \pc|OUT_ADDRESS\(0) $ (GND)
-- \inc|Q[0]~1\ = CARRY(!\pc|OUT_ADDRESS\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc|OUT_ADDRESS\(0),
	datad => VCC,
	combout => \inc|Q[0]~0_combout\,
	cout => \inc|Q[0]~1\);

-- Location: LCCOMB_X40_Y2_N28
\inc|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Add0~0_combout\ = (\JUMP_FLAG~input_o\ & (\JUMP_ADDRESS[0]~input_o\)) # (!\JUMP_FLAG~input_o\ & ((\inc|Q[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \JUMP_ADDRESS[0]~input_o\,
	datab => \JUMP_FLAG~input_o\,
	datac => \inc|Q[0]~0_combout\,
	combout => \inc|Add0~0_combout\);

-- Location: FF_X40_Y2_N29
\NEXT_ADDR[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inc|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_ADDR[0]~reg0_q\);

-- Location: IOIBUF_X34_Y0_N22
\JUMP_ADDRESS[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_ADDRESS(1),
	o => \JUMP_ADDRESS[1]~input_o\);

-- Location: LCCOMB_X38_Y2_N6
\pc|OUT_ADDRESS[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[1]~1_combout\ = !\inc|Add0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inc|Add0~1_combout\,
	combout => \pc|OUT_ADDRESS[1]~1_combout\);

-- Location: FF_X38_Y2_N7
\pc|OUT_ADDRESS[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \pc|OUT_ADDRESS[1]~1_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc|OUT_ADDRESS\(1));

-- Location: LCCOMB_X39_Y2_N8
\inc|Q[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Q[1]~2_combout\ = (\pc|OUT_ADDRESS\(1) & ((\inc|Q[0]~1\) # (GND))) # (!\pc|OUT_ADDRESS\(1) & (!\inc|Q[0]~1\))
-- \inc|Q[1]~3\ = CARRY((\pc|OUT_ADDRESS\(1)) # (!\inc|Q[0]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pc|OUT_ADDRESS\(1),
	datad => VCC,
	cin => \inc|Q[0]~1\,
	combout => \inc|Q[1]~2_combout\,
	cout => \inc|Q[1]~3\);

-- Location: LCCOMB_X38_Y2_N20
\inc|Add0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Add0~1_combout\ = (\JUMP_FLAG~input_o\ & (\JUMP_ADDRESS[1]~input_o\)) # (!\JUMP_FLAG~input_o\ & ((\inc|Q[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \JUMP_ADDRESS[1]~input_o\,
	datac => \inc|Q[1]~2_combout\,
	datad => \JUMP_FLAG~input_o\,
	combout => \inc|Add0~1_combout\);

-- Location: FF_X38_Y2_N21
\NEXT_ADDR[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inc|Add0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_ADDR[1]~reg0_q\);

-- Location: IOIBUF_X46_Y0_N8
\JUMP_ADDRESS[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_ADDRESS(2),
	o => \JUMP_ADDRESS[2]~input_o\);

-- Location: LCCOMB_X39_Y2_N30
\pc|OUT_ADDRESS[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[2]~2_combout\ = !\inc|Add0~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inc|Add0~2_combout\,
	combout => \pc|OUT_ADDRESS[2]~2_combout\);

-- Location: FF_X39_Y2_N31
\pc|OUT_ADDRESS[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \pc|OUT_ADDRESS[2]~2_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc|OUT_ADDRESS\(2));

-- Location: LCCOMB_X39_Y2_N10
\inc|Q[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Q[2]~4_combout\ = (\pc|OUT_ADDRESS\(2) & (!\inc|Q[1]~3\ & VCC)) # (!\pc|OUT_ADDRESS\(2) & (\inc|Q[1]~3\ $ (GND)))
-- \inc|Q[2]~5\ = CARRY((!\pc|OUT_ADDRESS\(2) & !\inc|Q[1]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pc|OUT_ADDRESS\(2),
	datad => VCC,
	cin => \inc|Q[1]~3\,
	combout => \inc|Q[2]~4_combout\,
	cout => \inc|Q[2]~5\);

-- Location: LCCOMB_X39_Y2_N28
\inc|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Add0~2_combout\ = (\JUMP_FLAG~input_o\ & (\JUMP_ADDRESS[2]~input_o\)) # (!\JUMP_FLAG~input_o\ & ((\inc|Q[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \JUMP_FLAG~input_o\,
	datab => \JUMP_ADDRESS[2]~input_o\,
	datad => \inc|Q[2]~4_combout\,
	combout => \inc|Add0~2_combout\);

-- Location: FF_X39_Y2_N29
\NEXT_ADDR[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inc|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_ADDR[2]~reg0_q\);

-- Location: IOIBUF_X31_Y0_N22
\JUMP_ADDRESS[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_ADDRESS(3),
	o => \JUMP_ADDRESS[3]~input_o\);

-- Location: LCCOMB_X39_Y2_N4
\pc|OUT_ADDRESS[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[3]~3_combout\ = !\inc|Add0~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inc|Add0~3_combout\,
	combout => \pc|OUT_ADDRESS[3]~3_combout\);

-- Location: FF_X39_Y2_N5
\pc|OUT_ADDRESS[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \pc|OUT_ADDRESS[3]~3_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc|OUT_ADDRESS\(3));

-- Location: LCCOMB_X39_Y2_N12
\inc|Q[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Q[3]~6_combout\ = (\pc|OUT_ADDRESS\(3) & ((\inc|Q[2]~5\) # (GND))) # (!\pc|OUT_ADDRESS\(3) & (!\inc|Q[2]~5\))
-- \inc|Q[3]~7\ = CARRY((\pc|OUT_ADDRESS\(3)) # (!\inc|Q[2]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pc|OUT_ADDRESS\(3),
	datad => VCC,
	cin => \inc|Q[2]~5\,
	combout => \inc|Q[3]~6_combout\,
	cout => \inc|Q[3]~7\);

-- Location: LCCOMB_X39_Y2_N2
\inc|Add0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Add0~3_combout\ = (\JUMP_FLAG~input_o\ & (\JUMP_ADDRESS[3]~input_o\)) # (!\JUMP_FLAG~input_o\ & ((\inc|Q[3]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \JUMP_FLAG~input_o\,
	datac => \JUMP_ADDRESS[3]~input_o\,
	datad => \inc|Q[3]~6_combout\,
	combout => \inc|Add0~3_combout\);

-- Location: FF_X39_Y2_N3
\NEXT_ADDR[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inc|Add0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_ADDR[3]~reg0_q\);

-- Location: LCCOMB_X39_Y2_N26
\pc|OUT_ADDRESS[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[4]~4_combout\ = !\inc|Add0~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inc|Add0~4_combout\,
	combout => \pc|OUT_ADDRESS[4]~4_combout\);

-- Location: FF_X39_Y2_N27
\pc|OUT_ADDRESS[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \pc|OUT_ADDRESS[4]~4_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc|OUT_ADDRESS\(4));

-- Location: LCCOMB_X39_Y2_N14
\inc|Q[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Q[4]~8_combout\ = (\pc|OUT_ADDRESS\(4) & (!\inc|Q[3]~7\ & VCC)) # (!\pc|OUT_ADDRESS\(4) & (\inc|Q[3]~7\ $ (GND)))
-- \inc|Q[4]~9\ = CARRY((!\pc|OUT_ADDRESS\(4) & !\inc|Q[3]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pc|OUT_ADDRESS\(4),
	datad => VCC,
	cin => \inc|Q[3]~7\,
	combout => \inc|Q[4]~8_combout\,
	cout => \inc|Q[4]~9\);

-- Location: IOIBUF_X46_Y0_N1
\JUMP_ADDRESS[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_ADDRESS(4),
	o => \JUMP_ADDRESS[4]~input_o\);

-- Location: LCCOMB_X39_Y2_N0
\inc|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Add0~4_combout\ = (\JUMP_FLAG~input_o\ & ((\JUMP_ADDRESS[4]~input_o\))) # (!\JUMP_FLAG~input_o\ & (\inc|Q[4]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \JUMP_FLAG~input_o\,
	datac => \inc|Q[4]~8_combout\,
	datad => \JUMP_ADDRESS[4]~input_o\,
	combout => \inc|Add0~4_combout\);

-- Location: FF_X39_Y2_N1
\NEXT_ADDR[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inc|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_ADDR[4]~reg0_q\);

-- Location: IOIBUF_X31_Y0_N29
\JUMP_ADDRESS[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_ADDRESS(5),
	o => \JUMP_ADDRESS[5]~input_o\);

-- Location: LCCOMB_X38_Y2_N8
\pc|OUT_ADDRESS[5]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[5]~5_combout\ = !\inc|Add0~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inc|Add0~5_combout\,
	combout => \pc|OUT_ADDRESS[5]~5_combout\);

-- Location: FF_X38_Y2_N9
\pc|OUT_ADDRESS[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \pc|OUT_ADDRESS[5]~5_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc|OUT_ADDRESS\(5));

-- Location: LCCOMB_X39_Y2_N16
\inc|Q[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Q[5]~10_combout\ = (\pc|OUT_ADDRESS\(5) & ((\inc|Q[4]~9\) # (GND))) # (!\pc|OUT_ADDRESS\(5) & (!\inc|Q[4]~9\))
-- \inc|Q[5]~11\ = CARRY((\pc|OUT_ADDRESS\(5)) # (!\inc|Q[4]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pc|OUT_ADDRESS\(5),
	datad => VCC,
	cin => \inc|Q[4]~9\,
	combout => \inc|Q[5]~10_combout\,
	cout => \inc|Q[5]~11\);

-- Location: LCCOMB_X38_Y2_N2
\inc|Add0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Add0~5_combout\ = (\JUMP_FLAG~input_o\ & (\JUMP_ADDRESS[5]~input_o\)) # (!\JUMP_FLAG~input_o\ & ((\inc|Q[5]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \JUMP_FLAG~input_o\,
	datac => \JUMP_ADDRESS[5]~input_o\,
	datad => \inc|Q[5]~10_combout\,
	combout => \inc|Add0~5_combout\);

-- Location: FF_X38_Y2_N3
\NEXT_ADDR[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inc|Add0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_ADDR[5]~reg0_q\);

-- Location: IOIBUF_X38_Y0_N22
\JUMP_ADDRESS[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_ADDRESS(6),
	o => \JUMP_ADDRESS[6]~input_o\);

-- Location: LCCOMB_X38_Y2_N26
\pc|OUT_ADDRESS[6]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[6]~6_combout\ = !\inc|Add0~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inc|Add0~6_combout\,
	combout => \pc|OUT_ADDRESS[6]~6_combout\);

-- Location: FF_X38_Y2_N27
\pc|OUT_ADDRESS[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \pc|OUT_ADDRESS[6]~6_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc|OUT_ADDRESS\(6));

-- Location: LCCOMB_X39_Y2_N18
\inc|Q[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Q[6]~12_combout\ = (\pc|OUT_ADDRESS\(6) & (!\inc|Q[5]~11\ & VCC)) # (!\pc|OUT_ADDRESS\(6) & (\inc|Q[5]~11\ $ (GND)))
-- \inc|Q[6]~13\ = CARRY((!\pc|OUT_ADDRESS\(6) & !\inc|Q[5]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pc|OUT_ADDRESS\(6),
	datad => VCC,
	cin => \inc|Q[5]~11\,
	combout => \inc|Q[6]~12_combout\,
	cout => \inc|Q[6]~13\);

-- Location: LCCOMB_X38_Y2_N0
\inc|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Add0~6_combout\ = (\JUMP_FLAG~input_o\ & (\JUMP_ADDRESS[6]~input_o\)) # (!\JUMP_FLAG~input_o\ & ((\inc|Q[6]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \JUMP_FLAG~input_o\,
	datac => \JUMP_ADDRESS[6]~input_o\,
	datad => \inc|Q[6]~12_combout\,
	combout => \inc|Add0~6_combout\);

-- Location: FF_X38_Y2_N1
\NEXT_ADDR[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inc|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_ADDR[6]~reg0_q\);

-- Location: IOIBUF_X38_Y0_N29
\JUMP_ADDRESS[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_ADDRESS(7),
	o => \JUMP_ADDRESS[7]~input_o\);

-- Location: LCCOMB_X38_Y2_N12
\pc|OUT_ADDRESS[7]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[7]~7_combout\ = !\inc|Add0~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inc|Add0~7_combout\,
	combout => \pc|OUT_ADDRESS[7]~7_combout\);

-- Location: FF_X38_Y2_N13
\pc|OUT_ADDRESS[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \pc|OUT_ADDRESS[7]~7_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc|OUT_ADDRESS\(7));

-- Location: LCCOMB_X39_Y2_N20
\inc|Q[7]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Q[7]~14_combout\ = (\pc|OUT_ADDRESS\(7) & ((\inc|Q[6]~13\) # (GND))) # (!\pc|OUT_ADDRESS\(7) & (!\inc|Q[6]~13\))
-- \inc|Q[7]~15\ = CARRY((\pc|OUT_ADDRESS\(7)) # (!\inc|Q[6]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pc|OUT_ADDRESS\(7),
	datad => VCC,
	cin => \inc|Q[6]~13\,
	combout => \inc|Q[7]~14_combout\,
	cout => \inc|Q[7]~15\);

-- Location: LCCOMB_X38_Y2_N18
\inc|Add0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Add0~7_combout\ = (\JUMP_FLAG~input_o\ & (\JUMP_ADDRESS[7]~input_o\)) # (!\JUMP_FLAG~input_o\ & ((\inc|Q[7]~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \JUMP_ADDRESS[7]~input_o\,
	datac => \inc|Q[7]~14_combout\,
	datad => \JUMP_FLAG~input_o\,
	combout => \inc|Add0~7_combout\);

-- Location: FF_X38_Y2_N19
\NEXT_ADDR[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inc|Add0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_ADDR[7]~reg0_q\);

-- Location: IOIBUF_X40_Y0_N15
\JUMP_ADDRESS[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_ADDRESS(8),
	o => \JUMP_ADDRESS[8]~input_o\);

-- Location: LCCOMB_X40_Y2_N26
\pc|OUT_ADDRESS[8]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[8]~8_combout\ = !\inc|Add0~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inc|Add0~8_combout\,
	combout => \pc|OUT_ADDRESS[8]~8_combout\);

-- Location: FF_X40_Y2_N27
\pc|OUT_ADDRESS[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \pc|OUT_ADDRESS[8]~8_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc|OUT_ADDRESS\(8));

-- Location: LCCOMB_X39_Y2_N22
\inc|Q[8]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Q[8]~16_combout\ = (\pc|OUT_ADDRESS\(8) & (!\inc|Q[7]~15\ & VCC)) # (!\pc|OUT_ADDRESS\(8) & (\inc|Q[7]~15\ $ (GND)))
-- \inc|Q[8]~17\ = CARRY((!\pc|OUT_ADDRESS\(8) & !\inc|Q[7]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pc|OUT_ADDRESS\(8),
	datad => VCC,
	cin => \inc|Q[7]~15\,
	combout => \inc|Q[8]~16_combout\,
	cout => \inc|Q[8]~17\);

-- Location: LCCOMB_X40_Y2_N2
\inc|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Add0~8_combout\ = (\JUMP_FLAG~input_o\ & (\JUMP_ADDRESS[8]~input_o\)) # (!\JUMP_FLAG~input_o\ & ((\inc|Q[8]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \JUMP_FLAG~input_o\,
	datac => \JUMP_ADDRESS[8]~input_o\,
	datad => \inc|Q[8]~16_combout\,
	combout => \inc|Add0~8_combout\);

-- Location: FF_X40_Y2_N3
\NEXT_ADDR[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inc|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_ADDR[8]~reg0_q\);

-- Location: IOIBUF_X34_Y0_N29
\JUMP_ADDRESS[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JUMP_ADDRESS(9),
	o => \JUMP_ADDRESS[9]~input_o\);

-- Location: LCCOMB_X38_Y2_N10
\pc|OUT_ADDRESS[9]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[9]~9_combout\ = !\inc|Add0~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inc|Add0~9_combout\,
	combout => \pc|OUT_ADDRESS[9]~9_combout\);

-- Location: FF_X38_Y2_N11
\pc|OUT_ADDRESS[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \pc|OUT_ADDRESS[9]~9_combout\,
	clrn => \ALT_INV_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc|OUT_ADDRESS\(9));

-- Location: LCCOMB_X39_Y2_N24
\inc|Q[9]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Q[9]~18_combout\ = \inc|Q[8]~17\ $ (!\pc|OUT_ADDRESS\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \pc|OUT_ADDRESS\(9),
	cin => \inc|Q[8]~17\,
	combout => \inc|Q[9]~18_combout\);

-- Location: LCCOMB_X38_Y2_N28
\inc|Add0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inc|Add0~9_combout\ = (\JUMP_FLAG~input_o\ & (\JUMP_ADDRESS[9]~input_o\)) # (!\JUMP_FLAG~input_o\ & ((\inc|Q[9]~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \JUMP_FLAG~input_o\,
	datac => \JUMP_ADDRESS[9]~input_o\,
	datad => \inc|Q[9]~18_combout\,
	combout => \inc|Add0~9_combout\);

-- Location: FF_X38_Y2_N29
\NEXT_ADDR[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \inc|Add0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \NEXT_ADDR[9]~reg0_q\);

-- Location: LCCOMB_X40_Y2_N8
\pc|OUT_ADDRESS[0]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[0]~_wirecell_combout\ = !\pc|OUT_ADDRESS\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pc|OUT_ADDRESS\(0),
	combout => \pc|OUT_ADDRESS[0]~_wirecell_combout\);

-- Location: LCCOMB_X38_Y2_N24
\pc|OUT_ADDRESS[1]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[1]~_wirecell_combout\ = !\pc|OUT_ADDRESS\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pc|OUT_ADDRESS\(1),
	combout => \pc|OUT_ADDRESS[1]~_wirecell_combout\);

-- Location: LCCOMB_X40_Y2_N10
\pc|OUT_ADDRESS[2]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[2]~_wirecell_combout\ = !\pc|OUT_ADDRESS\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pc|OUT_ADDRESS\(2),
	combout => \pc|OUT_ADDRESS[2]~_wirecell_combout\);

-- Location: LCCOMB_X40_Y2_N0
\pc|OUT_ADDRESS[3]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[3]~_wirecell_combout\ = !\pc|OUT_ADDRESS\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pc|OUT_ADDRESS\(3),
	combout => \pc|OUT_ADDRESS[3]~_wirecell_combout\);

-- Location: LCCOMB_X40_Y2_N18
\pc|OUT_ADDRESS[4]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[4]~_wirecell_combout\ = !\pc|OUT_ADDRESS\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pc|OUT_ADDRESS\(4),
	combout => \pc|OUT_ADDRESS[4]~_wirecell_combout\);

-- Location: LCCOMB_X38_Y2_N14
\pc|OUT_ADDRESS[5]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[5]~_wirecell_combout\ = !\pc|OUT_ADDRESS\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pc|OUT_ADDRESS\(5),
	combout => \pc|OUT_ADDRESS[5]~_wirecell_combout\);

-- Location: LCCOMB_X38_Y2_N4
\pc|OUT_ADDRESS[6]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[6]~_wirecell_combout\ = !\pc|OUT_ADDRESS\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pc|OUT_ADDRESS\(6),
	combout => \pc|OUT_ADDRESS[6]~_wirecell_combout\);

-- Location: LCCOMB_X38_Y2_N30
\pc|OUT_ADDRESS[7]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[7]~_wirecell_combout\ = !\pc|OUT_ADDRESS\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pc|OUT_ADDRESS\(7),
	combout => \pc|OUT_ADDRESS[7]~_wirecell_combout\);

-- Location: LCCOMB_X40_Y2_N16
\pc|OUT_ADDRESS[8]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[8]~_wirecell_combout\ = !\pc|OUT_ADDRESS\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pc|OUT_ADDRESS\(8),
	combout => \pc|OUT_ADDRESS[8]~_wirecell_combout\);

-- Location: LCCOMB_X38_Y2_N16
\pc|OUT_ADDRESS[9]~_wirecell\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc|OUT_ADDRESS[9]~_wirecell_combout\ = !\pc|OUT_ADDRESS\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pc|OUT_ADDRESS\(9),
	combout => \pc|OUT_ADDRESS[9]~_wirecell_combout\);

-- Location: M9K_X53_Y2_N0
\rom|altsyncram_component|auto_generated|ram_block1a0\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001F0580400100002802030082C0009008000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "/home/ash/USU/Spring2026/ECE6740/Projects/DLX_Assembler/assembly/instruct_factorial.mif",
	init_file_layout => "port_a",
	logical_ram_name => "FactorialROM:rom|altsyncram:altsyncram_component|altsyncram_1g24:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 9,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK~inputclkctrl_outclk\,
	portaaddr => \rom|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y3_N0
\rom|altsyncram_component|auto_generated|ram_block1a9\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006030800C00000000800020000800020000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "/home/ash/USU/Spring2026/ECE6740/Projects/DLX_Assembler/assembly/instruct_factorial.mif",
	init_file_layout => "port_a",
	logical_ram_name => "FactorialROM:rom|altsyncram:altsyncram_component|altsyncram_1g24:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 9,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK~inputclkctrl_outclk\,
	portaaddr => \rom|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y2_N0
\rom|altsyncram_component|auto_generated|ram_block1a18\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100801EE30F079C00310029400F4A0510601550",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "/home/ash/USU/Spring2026/ECE6740/Projects/DLX_Assembler/assembly/instruct_factorial.mif",
	init_file_layout => "port_a",
	logical_ram_name => "FactorialROM:rom|altsyncram:altsyncram_component|altsyncram_1g24:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 18,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 9,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK~inputclkctrl_outclk\,
	portaaddr => \rom|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y3_N0
\rom|altsyncram_component|auto_generated|ram_block1a27\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160B01002160805802160205C0416080080400",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "/home/ash/USU/Spring2026/ECE6740/Projects/DLX_Assembler/assembly/instruct_factorial.mif",
	init_file_layout => "port_a",
	logical_ram_name => "FactorialROM:rom|altsyncram:altsyncram_component|altsyncram_1g24:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 27,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 9,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK~inputclkctrl_outclk\,
	portaaddr => \rom|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_NEXT_ADDR(0) <= \NEXT_ADDR[0]~output_o\;

ww_NEXT_ADDR(1) <= \NEXT_ADDR[1]~output_o\;

ww_NEXT_ADDR(2) <= \NEXT_ADDR[2]~output_o\;

ww_NEXT_ADDR(3) <= \NEXT_ADDR[3]~output_o\;

ww_NEXT_ADDR(4) <= \NEXT_ADDR[4]~output_o\;

ww_NEXT_ADDR(5) <= \NEXT_ADDR[5]~output_o\;

ww_NEXT_ADDR(6) <= \NEXT_ADDR[6]~output_o\;

ww_NEXT_ADDR(7) <= \NEXT_ADDR[7]~output_o\;

ww_NEXT_ADDR(8) <= \NEXT_ADDR[8]~output_o\;

ww_NEXT_ADDR(9) <= \NEXT_ADDR[9]~output_o\;

ww_INSTRUCTION(0) <= \INSTRUCTION[0]~output_o\;

ww_INSTRUCTION(1) <= \INSTRUCTION[1]~output_o\;

ww_INSTRUCTION(2) <= \INSTRUCTION[2]~output_o\;

ww_INSTRUCTION(3) <= \INSTRUCTION[3]~output_o\;

ww_INSTRUCTION(4) <= \INSTRUCTION[4]~output_o\;

ww_INSTRUCTION(5) <= \INSTRUCTION[5]~output_o\;

ww_INSTRUCTION(6) <= \INSTRUCTION[6]~output_o\;

ww_INSTRUCTION(7) <= \INSTRUCTION[7]~output_o\;

ww_INSTRUCTION(8) <= \INSTRUCTION[8]~output_o\;

ww_INSTRUCTION(9) <= \INSTRUCTION[9]~output_o\;

ww_INSTRUCTION(10) <= \INSTRUCTION[10]~output_o\;

ww_INSTRUCTION(11) <= \INSTRUCTION[11]~output_o\;

ww_INSTRUCTION(12) <= \INSTRUCTION[12]~output_o\;

ww_INSTRUCTION(13) <= \INSTRUCTION[13]~output_o\;

ww_INSTRUCTION(14) <= \INSTRUCTION[14]~output_o\;

ww_INSTRUCTION(15) <= \INSTRUCTION[15]~output_o\;

ww_INSTRUCTION(16) <= \INSTRUCTION[16]~output_o\;

ww_INSTRUCTION(17) <= \INSTRUCTION[17]~output_o\;

ww_INSTRUCTION(18) <= \INSTRUCTION[18]~output_o\;

ww_INSTRUCTION(19) <= \INSTRUCTION[19]~output_o\;

ww_INSTRUCTION(20) <= \INSTRUCTION[20]~output_o\;

ww_INSTRUCTION(21) <= \INSTRUCTION[21]~output_o\;

ww_INSTRUCTION(22) <= \INSTRUCTION[22]~output_o\;

ww_INSTRUCTION(23) <= \INSTRUCTION[23]~output_o\;

ww_INSTRUCTION(24) <= \INSTRUCTION[24]~output_o\;

ww_INSTRUCTION(25) <= \INSTRUCTION[25]~output_o\;

ww_INSTRUCTION(26) <= \INSTRUCTION[26]~output_o\;

ww_INSTRUCTION(27) <= \INSTRUCTION[27]~output_o\;

ww_INSTRUCTION(28) <= \INSTRUCTION[28]~output_o\;

ww_INSTRUCTION(29) <= \INSTRUCTION[29]~output_o\;

ww_INSTRUCTION(30) <= \INSTRUCTION[30]~output_o\;

ww_INSTRUCTION(31) <= \INSTRUCTION[31]~output_o\;
END structure;


