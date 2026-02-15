library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Incrementer is
    generic(
        WIDTH : POSITIVE := 10
    );
    port(
        D : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        Q : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
    );
end entity Incrementer;

architecture behavior of Incrementer is
begin
    Q <= STD_LOGIC_VECTOR(unsigned(D) + 1); 
end architecture behavior;