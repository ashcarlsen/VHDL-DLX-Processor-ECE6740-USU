library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Factorial_TB is
end entity Factorial_TB;

architecture sim of Factorial_TB is
    constant CLK_PERIOD : time := 20 ns;
    constant RX_CLK_PERIOD : time := 6.51 us;  -- 153.6 kHz
    signal CLOCK : STD_LOGIC := '0';
    signal RST : STD_LOGIC := '1';
    signal rx_sig : STD_LOGIC := '1';
    signal tx_sig : STD_LOGIC := '1';

    procedure send_byte (
        constant byte_data : in std_logic_vector(7 downto 0);
        signal   rx_line   : out std_logic
    ) is
    begin
        -- Start bit
        rx_line <= '0';
        wait for 8 * RX_CLK_PERIOD;

        -- 8 data bits
        for i in 0 to 7 loop
            rx_line <= byte_data(i);
            wait for 8 * RX_CLK_PERIOD;
        end loop;

        -- Stop bit
        rx_line <= '1';
        wait for 8 * RX_CLK_PERIOD;

        -- Some idle time between bytes
        wait for 16 * RX_CLK_PERIOD;
    end procedure;

begin

    UUT : entity work.DLX
        port map(
            CLK => CLOCK,
            RST => RST,
            RX_LINE => rx_sig,
            TX_LINE => tx_sig
        );
    
    CLOCK <= not CLOCK after CLK_PERIOD / 2;
    stim_proc: process
    begin
        -- Init everything to 0 while reset
        RST <= '1';
        wait for 2*CLK_PERIOD;
        RST <= '0';
        wait for 2*CLK_PERIOD;
        send_byte(X"36", rx_sig);
        wait for 1*CLK_PERIOD;
        send_byte(X"0A", rx_sig);
        wait for 1000000*CLK_PERIOD;
    end process;
end architecture sim;