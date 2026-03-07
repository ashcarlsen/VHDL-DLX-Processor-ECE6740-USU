library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TwoMux is
    generic(
        WIDTH : POSITIVE := 10
    );
    port(
        DATA_ZERO : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        DATA_ONE : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        SEL : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
    );
end entity TwoMux;

architecture behavior of TwoMux is
begin
	 Q <= DATA_ONE when SEL = '1' else DATA_ZERO;
end architecture behavior;