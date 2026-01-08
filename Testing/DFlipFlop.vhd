library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlop is
	port (
		MAX10_CLK1_50 : in std_logic;
		KEY : in STD_LOGIC_VECTOR(1 downto 0);
		SW : in STD_LOGIC_VECTOR(9 downto 0);
		LEDR : out STD_LOGIC_VECTOR(9 downto 0)
	);
end DFlipFlop;

architecture rtl of DFlipFlop is
	component myDFlipFlop is
		port (
			clk : in std_logic := 'X';
			rst_l : in std_logic := 'X';
			d : in std_logic := 'X';
			q : out std_logic := 'X'
		);
	end component myDFlipFlop;
	
	begin
	
	the_dflipflop : myDFlipFlop
	port map(
		clk => MAX10_CLK1_50,
		rst_l => KEY(0),
		d => SW(0),
		q => LEDR(0)
	);
	
	LEDR(9 downto 1) <= (others => '0');
end architecture rtl;