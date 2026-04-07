library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DLX_TOP is
	port(
		ADC_CLK_10 : in STD_LOGIC;
		MAX10_CLK1_50 : in STD_LOGIC;
		MAX10_CLK2_50 : in STD_LOGIC;
        KEY           : in STD_LOGIC_VECTOR(1 downto 0);
		GPIO 		  : inout STD_LOGIC_VECTOR(35 downto 0);
        HEX0          : out STD_LOGIC_VECTOR(7 downto 0);
        HEX1          : out STD_LOGIC_VECTOR(7 downto 0);
        HEX2          : out STD_LOGIC_VECTOR(7 downto 0);
        HEX3          : out STD_LOGIC_VECTOR(7 downto 0);
        HEX4          : out STD_LOGIC_VECTOR(7 downto 0);
        HEX5          : out STD_LOGIC_VECTOR(7 downto 0)
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
                RX_LINE => GPIO(35),
                TX_LINE => GPIO(34),
                HEX0 => HEX0,
                HEX1 => HEX1,
                HEX2 => HEX2,
                HEX3 => HEX3,
                HEX4 => HEX4,
                HEX5 => HEX5
            );
end architecture behavior;