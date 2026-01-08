library ieee;
use ieee.std_logic_1164.all;

entity myDFlipFlop is
  port (
    clk : in std_logic;
    rst_l : in std_logic;
    d : in std_logic;
    q : out std_logic
  );
end myDFlipFlop;

architecture Behavioral of myDFlipFlop is
begin

  process (clk, rst_l)
  begin
    if rst_l = '0' then
      q <= '0';
    elsif rising_edge(clk) then
      q <= d;
    end if;
  end process;

end Behavioral;