library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity ShouldBranch is
    generic(
        DATA_WIDTH : POSITIVE := 32
    );
    port(
        OP_CODE : in STD_LOGIC_VECTOR(5 downto 0);
        RS1 : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        JUMP_FLAG : out STD_LOGIC
    );
end entity ShouldBranch;

architecture behavior of ShouldBranch is
begin

    update : process (RS1, OP_CODE)
    begin
        if OP_CODE = BEQZ then
            if RS1 = (RS1'range => '0') then
                JUMP_FLAG <= '1';
            else
                JUMP_FLAG <= '0';
            end if;
            
        elsif OP_CODE = BNEZ then
            if RS1 /= (RS1'range => '0') then
                JUMP_FLAG <= '1';
            else
                JUMP_FLAG <= '0';
            end if;
            
        elsif is_dlx_jump(OP_CODE) then
            JUMP_FLAG <= '1';
        
        else
            JUMP_FLAG <= '0';
        end if;
    end process;
end architecture behavior;