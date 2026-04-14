library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity TimeHandler is
    port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        EX_MEM_INS : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        TIMER_EN : out STD_LOGIC;
        TIMER_RST : out STD_LOGIC
    );
end entity TimeHandler;

architecture behavior of TimeHandler is
    signal reset : STD_LOGIC := '1';
    signal next_rst : STD_LOGIC := '1';
    signal en : STD_LOGIC := '0';
    signal next_en : STD_LOGIC := '0';
begin

    ins : process(EX_MEM_INS, reset, en)
    begin
        if EX_MEM_INS(INS_WIDTH-1 downto INS_WIDTH-6) = TR then
            next_rst <= '1';
            next_en <= '0';
        elsif EX_MEM_INS(INS_WIDTH-1 downto INS_WIDTH-6) = TGO then
            next_rst <= '0';
            next_en <= '1';
        elsif EX_MEM_INS(INS_WIDTH-1 downto INS_WIDTH-6) = TSP then
            next_rst <= '0';
            next_en <= '0';
        else
            next_rst <= reset;
            next_en <= en;
        end if; 
    end process;

    update : process (CLK, RST)
    begin
        if RST = '1' then
            reset <= '1';
            en <= '0';
        elsif rising_edge(CLK) then
            reset <= next_rst;
            en <= next_en;
        end if;
    end process;

    TIMER_RST <= reset;
    TIMER_EN <= en;

end architecture behavior;