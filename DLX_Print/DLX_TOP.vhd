library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DLX_TOP is
	port(
		ADC_CLK_10 : in STD_LOGIC;
		MAX10_CLK1_50 : in STD_LOGIC;
		MAX10_CLK2_50 : in STD_LOGIC;
        KEY           : in STD_LOGIC_VECTOR(1 downto 0);
		GPIO 		  : inout STD_LOGIC_VECTOR(35 downto 0)
	);
end entity DLX_TOP;

architecture behavior of DLX_TOP is
	signal rst : STD_LOGIC;
begin
	
	rst <= not KEY(0);
    dlx : entity work.DLX
            port map (
                CLK => MAX10_CLK1_50,
                RST => rst,
                UART_TX => GPIO(34),
                UART_RX => GPIO(35)
            );
end architecture behavior;