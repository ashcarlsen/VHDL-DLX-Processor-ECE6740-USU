library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART_TX is
	port(
		txclk : in STD_LOGIC;
		rst : in STD_LOGIC;
		data : in STD_LOGIC_VECTOR(7 downto 0);
		empty : in STD_LOGIC;
		rdclk : out STD_LOGIC;
		rdreq: out STD_LOGIC;
		tx_line : out STD_LOGIC
	);
end entity UART_TX;

architecture behavior of UART_TX is
	type tx_state is (idle, accept, send);
	signal state : tx_state := idle;
	signal tx_reg : STD_LOGIC_VECTOR(7 downto 0);
	signal idx : INTEGER range 0 to 8 := 0;
begin
	rdclk <= txclk;
	fsm : process(txclk, rst)
	begin
		if rst = '1' or empty = '1' then
			state <= idle;
			tx_line <= '1';
			tx_reg <= (others => '0');
			idx <= 0;
			rdreq <= '0';
		elsif rising_edge(txclk) then
			case state is
				when idle =>
					tx_line <= '1';
					idx <= 0;
					tx_reg <= (others => '0');
					-- If the FIFO signal has a value
					if empty = '0' then
						-- Request the data
						rdreq <= '1';
						state <= accept;
					else
						-- FIFO is still empty, so no need to do anything else
						rdreq <= '0';
						state <= idle;
					end if;
				when accept =>
					-- end the read request signal; data should be loaded with correct data, so load our register
					rdreq <= '0';
					tx_reg <= data;
					idx <= 0;
					-- send the start bit for a single clock cycle
					tx_line <= '0';
					state <= send;
				when send =>
					if idx >= 8 then
						state <= idle;
						tx_reg <= (others => '0');
						idx <= 0;
						tx_line <= '1';
					else
						state <= send;
						tx_line <= tx_reg(idx);
						idx <= idx+1;
					end if;
			end case;
		end if;
	end process;
end architecture behavior;