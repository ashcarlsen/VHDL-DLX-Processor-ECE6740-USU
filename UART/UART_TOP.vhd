library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART_TOP is
	port(
		ADC_CLK_10 : in STD_LOGIC;
		MAX10_CLK1_50 : in STD_LOGIC;
		MAX10_CLK2_50 : in STD_LOGIC;
      KEY           : in STD_LOGIC_VECTOR(1 downto 0);
		GPIO 			  : inout STD_LOGIC_VECTOR(35 downto 0)
	);
end entity UART_TOP;

architecture behavior of UART_TOP is
	signal rst_l : STD_LOGIC;
begin
	
	rst_l <= KEY(0);
      uart_module : entity work.uart
            port map(
					clk => MAX10_CLK1_50,
					rst_l => rst_l,
					rx_line => GPIO(35),
					tx_line => GPIO(34)
            );
end architecture behavior;