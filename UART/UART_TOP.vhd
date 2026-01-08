library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART_TOP is
	port(
		MAX10_CLK1_50 : in STD_LOGIC;
      KEY           : in STD_LOGIC_VECTOR(1 downto 0);
      RX            : in STD_LOGIC;
      TX            : out STD_LOGIC
	);
end entity UART_TOP;

architecture behavior of UART_TOP is
	signal rst : STD_LOGIC := '0';
      signal txclk : STD_LOGIC;
      signal rxclk : STD_LOGIC;
      signal locked : STD_LOGIC;
      signal rst_locked : STD_LOGIC;

      signal fifo_in : STD_LOGIC_VECTOR(7 downto 0);
      signal fifo_out : STD_LOGIC_VECTOR(7 downto 0);
      signal wrreq : STD_LOGIC;
      signal rdreq : STD_LOGIC;
      signal wrfull : STD_LOGIC;
      signal rdempty :STD_LOGIC;
begin
	rst <= not KEY(0);
      pll : entity work.pll
            port map(
                areset => rst,
                inclk0 => MAX10_CLK1_50,
                c0 => txclk, -- 19.2kHz 19,200 Baud
                c1 => rxclk, -- 153.6kHz oversample by 8
                locked => locked
            );
      rst_locked <= rst or not locked;

      converter : entity work.ASCII_CONVERTER
            port map(
                  aclr => rst_locked,
                  wrclk => rxclk,
                  data => fifo_in,
                  wrreq => wrreq,
                  rdclk => txclk,
                  rdreq => rdreq,
                  wrfull => wrfull,
                  rdempty => rdempty,
                  q_conv => fifo_out
            );

      rx_module : entity work.UART_RX
            port map(
                  rxclk => rxclk,
                  rst => rst_locked,
                  rx_line => RX,
                  full => wrfull,
                  wrclk => open,
                  data => fifo_in,
                  wrreq => wrreq
            );
      
      tx_module : entity work.UART_TX
            port map(
                  txclk => txclk,
                  rst => rst_locked,
                  data => fifo_out,
                  empty => rdempty,
                  rdclk => open,
                  rdreq => rdreq,
                  tx_line => TX
            );

end architecture behavior;