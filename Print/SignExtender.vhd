library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity SignExtender is
    generic(
        IMM_WIDTH : POSITIVE := 16;
        DATA_WIDTH : POSITIVE := 32
    );
    port(
        OP_CODE : in STD_LOGIC_VECTOR(5 downto 0); -- 6 bit op code
        VALUE : in STD_LOGIC_VECTOR(IMM_WIDTH-1 downto 0); -- 16bit immediate
        EXTENDED : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
    );
end entity SignExtender;

architecture behavior of SignExtender is
begin
    update: process(OP_CODE, VALUE)
        begin
        -- Set lower bit values to the input
        EXTENDED(IMM_WIDTH-1 downto 0) <= VALUE;
        -- If the OP Code is an immediate, then set the upper bits to sign extended
        if is_dlx_signed(OP_CODE) -- Function defined in dlx_constants package
        then
            EXTENDED(DATA_WIDTH-1 downto IMM_WIDTH) <= (others => VALUE(IMM_WIDTH-1));
        -- else assume unsigned and fill with 0
        else
            EXTENDED(DATA_WIDTH-1 downto IMM_WIDTH) <= (others => '0');
        end if;
    end process;
end architecture behavior;
