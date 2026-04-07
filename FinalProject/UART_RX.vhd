library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART_RX is
	port(
		rxclk : in STD_LOGIC;
		rst: in STD_LOGIC;
		rx_line: in STD_LOGIC;
		full: in STD_LOGIC;
		wrclk: out STD_LOGIC;
		data: out STD_LOGIC_VECTOR(7 downto 0);
		wrreq: out STD_LOGIC
	);
end entity UART_RX;

architecture behavior of UART_RX is
	type rx_state is (idle, start_bit, sample, update);
	signal state : rx_state := idle;
	signal idx : INTEGER range 0 to 8 := 0;
	signal counter : INTEGER range 0 to 8 := 0;
	signal zero_count : INTEGER := 0;
	signal one_count : INTEGER := 0;
begin
	wrclk <= rxclk;
	fsm : process(rxclk, rst)
	begin
		if rst = '1' then
			-- reset everything to 0s when reset, or our FIFO is full
			state <= idle;
			idx <= 0;
			counter <= 0;
			zero_count <= 0;
			one_count <= 0;
			wrreq <= '0';
			data <= (others => '0');
		elsif rising_edge(rxclk) then
			case state is
				when idle =>
					idx <= 0;
					counter <= 0;
					zero_count <= 0;
					one_count <= 0;
					wrreq <= '0';
					if rx_line = '0' then
						state <= start_bit;
					else
						state <= idle;
					end if;
				when start_bit => -- this state basically skips the 8 samples of the start bit
					if counter < 6 then
						counter <= counter + 1;
					else
						state <= sample;
						counter <= 0;
						idx <= 0;
						data <= (others => '0');
					end if;
				when sample =>
					if counter < 7 and idx < 8 then -- sample the current bit
						counter <= counter + 1;
						if counter >=2 and counter <= 6 then
							if rx_line = '1' then
								one_count <= one_count + 1;
							else
								zero_count <= zero_count + 1;
							end if;
						end if;
					elsif counter >= 7 and idx < 8 then -- got enough samples for this bit
						counter <= 0;
						idx <= idx + 1;
						-- set register value to majority winner of sampling
						if one_count > zero_count then
							data(idx) <= '1';
						else
							data(idx) <= '0';
						end if;
						one_count <= 0;
						zero_count <= 0;
					else -- all 8 bits have been received
						state <= update;
						wrreq <= '1';
					end if;
				when update => -- send the write request
					state <= idle;
					wrreq <= '0';
			end case;
		end if;
	end process;
end architecture behavior;