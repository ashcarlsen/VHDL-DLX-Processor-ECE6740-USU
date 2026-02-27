library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FourMux is
    generic (
        WIDTH : POSITIVE := 32
    );
    port (
        DATA_ZERO : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        DATA_ONE : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        DATA_TWO : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        DATA_THREE : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        SEL : in STD_LOGIC_VECTOR(1 downto 0);
        Q : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
    );
end entity FourMux;

architecture behavior of FourMux is
begin
    update : process (SEL, DATA_ZERO, DATA_ONE, DATA_TWO, DATA_THREE)
    begin
        case SEL is
            when "00" =>
                Q <= DATA_ZERO;
            when "01" =>
                Q <= DATA_ONE;
            when "10" =>
                Q <= DATA_TWO;
            when "11" =>
                Q <= DATA_THREE;
            when others =>
                Q <= (others => '0');
        end case;
    end process;
end architecture behavior;