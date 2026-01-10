library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART_RX_TB is
end entity UART_RX_TB;

architecture sim of UART_RX_TB is

    constant CLK_PERIOD : time := 6.51 us;  -- 153.6 kHz

    signal rxclk   : std_logic := '0';
    signal rst     : std_logic := '1';
    signal rx_line : std_logic := '1';  -- idle high
    signal full    : std_logic := '0';  -- assume FIFO never full

    signal wrclk   : std_logic;
    signal data    : std_logic_vector(7 downto 0);
    signal wrreq   : std_logic;

    procedure send_byte (
        constant byte_data : in std_logic_vector(7 downto 0);
        signal   rx_line   : out std_logic
    ) is
    begin
        -- Start bit
        rx_line <= '0';
        wait for 8 * CLK_PERIOD;

        -- 8 data bits
        for i in 0 to 7 loop
            rx_line <= byte_data(i);
            wait for 8 * CLK_PERIOD;
        end loop;

        -- Stop bit
        rx_line <= '1';
        wait for 8 * CLK_PERIOD;

        -- Some idle time between bytes
        wait for 16 * CLK_PERIOD;
    end procedure;

begin

    UUT: entity work.UART_RX
        port map (
            rxclk  => rxclk,
            rst    => rst,
            rx_line=> rx_line,
            full   => full,
            wrclk  => wrclk,
            data   => data,
            wrreq  => wrreq
        );

    -- Clock generation
    rxclk <= not rxclk after CLK_PERIOD / 2;

    stim_proc: process
    begin
        -- Initial reset
        rst <= '1';
        wait for 5 * CLK_PERIOD;
        rst <= '0';
        wait for 5 * CLK_PERIOD;

        send_byte(X"47", rx_line);

        wait for 100 * CLK_PERIOD;
        wait;
    end process;
end architecture sim;