library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Stopwatch is
generic(
-- Number of clock cycles for 1/100th second, freq/100. For 10 MHz, N = 100000. For 100 MHz, N = 1000000
N : integer := 500000
);
port (
CLK : in std_logic;
RST : in std_logic;
EN : in std_logic;
HEX0 : out std_logic_vector(7 downto 0);
HEX1 : out std_logic_vector(7 downto 0);
HEX2 : out std_logic_vector(7 downto 0);
HEX3 : out std_logic_vector(7 downto 0);
HEX4 : out std_logic_vector(7 downto 0);
HEX5 : out std_logic_vector(7 downto 0)
);

end entity Stopwatch;

architecture behavior of Stopwatch is
    type DIGITS is array (0 to 9) of std_logic_vector(7 downto 0);
    constant table : DIGITS := ("11000000", "11111001", "10100100", "10110000", "10011001", "10010010", "10000010", "11111000","10000000","10011000");
    signal clk_count : unsigned(22 downto 0) := (others => '0');
    type SSDS is array (5 downto 0) of integer range 0 to 10;
    signal outs : SSDS := (0,0,0,0,0,0);
begin
    process (CLK, RST, EN)
        variable counts : SSDS := (0,0,0,0,0,0);
    begin
        if RST = '1' then
            for i in 0 to 5 loop
                counts(i) := 0;
            end loop;
            clk_count <= (others => '0');
        elsif rising_edge(CLK) and EN = '1' then
            if clk_count = N-1 then
                clk_count <= (others => '0');
                counts(0) := counts(0) + 1;
                if counts(0) = 10 then
                    counts(0) := 0;
                    counts(1) := counts(1) + 1;
                end if;
            else
                clk_count <= clk_count + 1;
            end if;

            if counts(1)=10 then
                counts(1) := 0;
                counts(2) := counts(2) + 1;
            end if;
            if counts(2)=10 then
                counts(2) := 0;
                counts(3) := counts(3) + 1;
            end if;
            if counts(3)=6 then
                counts(3) := 0;
                counts(4) := counts(4) + 1;
            end if;
            if counts(4)=10 then
                counts(4) := 0;
                counts(5) := counts(5) + 1;
            end if;
            if counts(5)=6 then
                counts(5) := 0;
            end if;
        end if;
        outs <= counts;
    end process;

HEX0 <= table(outs(0));
HEX1 <= table(outs(1));
HEX2 <= table(outs(2)) and "01111111";
HEX3 <= table(outs(3));
HEX4 <= table(outs(4)) and "01111111";
HEX5 <= table(outs(5));

end architecture behavior;