library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Factorial_TB is
end entity Factorial_TB;

architecture sim of Factorial_TB is
    constant CLK_PERIOD : time := 1 ms;
    signal CLOCK : STD_LOGIC := '0';
    signal RST : STD_LOGIC := '1';
begin

    UUT : entity work.DLX
        port map(
            CLK => CLOCK,
            RST => RST
        );
    
    CLOCK <= not CLOCK after CLK_PERIOD / 2;
    stim_proc: process
    begin
        -- Init everything to 0 while reset
        RST <= '1';
        wait for 2*CLK_PERIOD;
        RST <= '0';
        wait for 1500*CLK_PERIOD;
    end process;
end architecture sim;