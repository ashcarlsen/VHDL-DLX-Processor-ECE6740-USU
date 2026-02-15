library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ThreeMux is
    generic (
        DATA_WIDTH : POSITIVE := 32
    );
    port (
        DATA_ZERO : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        DATA_ONE : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        DATA_TWO : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        SEL : in STD_LOGIC_VECTOR(1 downto 0);
        DATA_OUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
    );
end entity ThreeMux;

architecture behavior of ThreeMux is
begin
    update : process (SEL, DATA_ZERO, DATA_ONE, DATA_TWO)
    begin
        case SEL is
            when "00" =>
                DATA_OUT <= DATA_ZERO;
            when "01" =>
                DATA_OUT <= DATA_ONE;
            when "10" =>
                DATA_OUT <= DATA_TWO;
            when "11" =>
                DATA_OUT <= (others => '0');
            when others =>
                DATA_OUT <= (others => '0');
        end case;
    end process;
end architecture behavior;