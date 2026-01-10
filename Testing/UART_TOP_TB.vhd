library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART_TOP_TB is
end entity UART_TOP_TB;

architecture sim of UART_TOP_TB is

    constant CLK_PERIOD : time := 20 ns;  -- 50 Mhz clock
	 constant BAUD_CLK_PERIOD : time := 52.083 us; -- 19200 baud rate
	 signal clk : std_logic := '0';
	 signal baud_clk : std_logic := '0';
    signal rst     : std_logic := '1';
    signal rx_line : std_logic := '1'; 
	 signal tx_line : std_logic := '0';
	 signal rst_l : std_logic := '0';
    procedure send_byte (
        constant byte_data : in std_logic_vector(7 downto 0);
        signal   rx_line   : out std_logic
    ) is
    begin
        -- Start bit
        rx_line <= '0';
        wait for 1 * BAUD_CLK_PERIOD;

        -- 8 data bits
        for i in 0 to 7 loop
            rx_line <= byte_data(i);
            wait for 1 * BAUD_CLK_PERIOD;
        end loop;

        -- Stop bit
        rx_line <= '1';
        wait for 1 * BAUD_CLK_PERIOD;

        wait for 8 * BAUD_CLK_PERIOD;
    end procedure;

begin

    -- Clock generation
    clk <= not clk after CLK_PERIOD / 2;
	 baud_clk <= not baud_clk after BAUD_CLK_PERIOD / 2;
	 rst_l <= not rst;
	 
    UUT: entity work.UART
        port map (
          clk => clk,
			 rst_l => rst_l,
			 rx_line => rx_line,
			 tx_line => tx_line
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset
        rst <= '1';
        wait for 5 * BAUD_CLK_PERIOD;
        rst <= '0';
        wait for 5 * BAUD_CLK_PERIOD;

        send_byte(X"47", rx_line);

        wait for 100 * BAUD_CLK_PERIOD;
		  
        wait;
    end process;
end architecture sim;