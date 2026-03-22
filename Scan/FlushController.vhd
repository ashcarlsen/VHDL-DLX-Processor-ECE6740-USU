library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity FlushController is
    port (
        JUMP : in STD_LOGIC;
        FLUSH : out STD_LOGIC
    );
end entity FlushController;

architecture behavior of FlushController is
begin
    FLUSH <= JUMP;
end architecture behavior;