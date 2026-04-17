library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TimeHandler is
    port (
        CLK         : in  STD_LOGIC;
        RST         : in  STD_LOGIC;
        GO_FLAG   : in  STD_LOGIC;
        STOP_FLAG  : in  STD_LOGIC;
        RST_FLAG   : in  STD_LOGIC;
        TIMER_EN    : out STD_LOGIC;
        TIMER_RST : out STD_LOGIC
    );
end entity;

architecture rtl of TimeHandler is
    signal en_reg : STD_LOGIC := '0';
begin

    process(CLK, RST)
    begin
        if RST = '1' then
            en_reg <= '0';

        elsif rising_edge(CLK) then

            -- Highest priority: reset
            if RST_FLAG = '1' then
                en_reg <= '0';

            -- Next: stop
            elsif STOP_FLAG = '1' then
                en_reg <= '0';

            -- Lowest: go
            elsif GO_FLAG = '1' then
                en_reg <= '1';
            end if;

        end if;
    end process;

    TIMER_EN <= en_reg;
    TIMER_RST <= RST_FLAG;

end architecture;