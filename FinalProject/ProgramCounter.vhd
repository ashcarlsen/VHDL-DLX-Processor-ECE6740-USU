library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ProgramCounter is
    generic(
        WIDTH : POSITIVE := 10
    );
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        EN : in STD_LOGIC;
        NEXT_ADDRESS : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        OUT_ADDRESS : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
    );
end entity ProgramCounter;

architecture rtl of ProgramCounter is
    signal ins_reg : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
begin
    update : process(CLK, RST, EN)
    begin
        if RST = '1' then
            OUT_ADDRESS <= (others => '1');
        elsif rising_edge(CLK) and (EN = '1') then
            OUT_ADDRESS <= NEXT_ADDRESS;
        end if;
    end process;
end architecture rtl;