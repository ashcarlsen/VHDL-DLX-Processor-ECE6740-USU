library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ASCII_CONVERTER is
	port(
		aclr : in STD_LOGIC;
		wrclk : in STD_LOGIC;
		data : in STD_LOGIC_VECTOR(7 downto 0);
		wrreq : in STD_LOGIC;
		rdclk : in STD_LOGIC;
		rdreq : in STD_LOGIC;
		wrfull : out STD_LOGIC;
		rdempty : out STD_LOGIC;
		q_conv : out STD_LOGIC_VECTOR(7 downto 0)
	);
end entity ASCII_CONVERTER;

architecture behavior of ASCII_CONVERTER is
	signal fifo_out : STD_LOGIC_VECTOR(7 downto 0);
begin

	-- instanstiate a fifo component inside the converter
	fifo : entity work.fifo
		port map(
			aclr => aclr,
			wrclk => wrclk,
			data => data,
			wrreq => wrreq,
			rdclk => rdclk,
			rdreq => rdreq,
			wrfull => wrfull,
			rdempty => rdempty,
			q => fifo_out
		);

	-- convert from upper to lower or lower to upper if a-zA-Z else "E"
	q_conv <= (fifo_out xor "00100000") when 
		((fifo_out >= x"41" and fifo_out <= x"5A") or (fifo_out >= x"61" and fifo_out <= x"7A"))
		else x"45";

	--q_conv <= (test_data xor "00100000") when 
		--((test_data >= x"41" and test_data <= x"5A") or (test_data >= x"61" and test_data <= x"7A"))
		--else x"45";
end architecture behavior;