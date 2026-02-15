library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity ALU is
    generic (
        DATA_WIDTH : POSITIVE := 32
    );
    port (
        OP_CODE : in STD_LOGIC_VECTOR(5 downto 0);
        DATA_ZERO : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        DATA_ONE : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        DATA_OUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0) 
    );
end entity ALU;

architecture behavior of ALU is
begin
    update : process (OP_CODE, DATA_ZERO, DATA_ONE)
    begin
        case OP_CODE is
            when ADD_OP =>
                DATA_OUT <= STD_LOGIC_VECTOR(signed(DATA_ZERO) + signed(DATA_ONE));
            when ADDI =>
                DATA_OUT <= STD_LOGIC_VECTOR(signed(DATA_ZERO) + signed(DATA_ONE));
            when ADDU =>
                DATA_OUT <= STD_LOGIC_VECTOR(unsigned(DATA_ZERO) + unsigned(DATA_ONE));
            when ADDUI =>
                DATA_OUT <= STD_LOGIC_VECTOR(unsigned(DATA_ZERO) + unsigned(DATA_ONE));
            when SUB_OP =>
                DATA_OUT <= STD_LOGIC_VECTOR(signed(DATA_ZERO) - signed(DATA_ONE));
            when SUBI =>
                DATA_OUT <= STD_LOGIC_VECTOR(signed(DATA_ZERO) - signed(DATA_ONE));
            when SUBU =>
                DATA_OUT <= STD_LOGIC_VECTOR(unsigned(DATA_ZERO) - unsigned(DATA_ONE));
            when SUBUI =>
                DATA_OUT <= STD_LOGIC_VECTOR(unsigned(DATA_ZERO) - unsigned(DATA_ONE));
            when AND_OP =>
                DATA_OUT <= DATA_ZERO AND DATA_ONE;
            when ANDI =>
                DATA_OUT <= DATA_ZERO AND DATA_ONE;
            when OR_OP =>
                DATA_OUT <= DATA_ZERO OR DATA_ONE;
            when ORI =>
                DATA_OUT <= DATA_ZERO OR DATA_ONE;
            when XOR_OP =>
                DATA_OUT <= DATA_ZERO XOR DATA_ONE;
            when XORI =>
                DATA_OUT <= DATA_ZERO XOR DATA_ONE;
            when SLL_OP =>
                DATA_OUT <= STD_LOGIC_VECTOR(shift_left(unsigned(DATA_ZERO), to_integer(unsigned(DATA_ONE))));
            when SLLI =>
                DATA_OUT <= STD_LOGIC_VECTOR(shift_left(unsigned(DATA_ZERO), to_integer(unsigned(DATA_ONE))));
            when SRL_OP =>
                DATA_OUT <= STD_LOGIC_VECTOR(shift_right(unsigned(DATA_ZERO), to_integer(unsigned(DATA_ONE))));
            when SRLI =>
                DATA_OUT <= STD_LOGIC_VECTOR(shift_right(unsigned(DATA_ZERO), to_integer(unsigned(DATA_ONE))));
            when SRA_OP =>
                DATA_OUT <= STD_LOGIC_VECTOR(shift_right(signed(DATA_ZERO), to_integer(unsigned(DATA_ONE))));
            when SRAI =>
                DATA_OUT <= STD_LOGIC_VECTOR(shift_right(signed(DATA_ZERO), to_integer(unsigned(DATA_ONE))));
            when SLT =>
                if(signed(DATA_ZERO) < signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SLTI =>
                if(signed(DATA_ZERO) < signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SLTU =>
                if(unsigned(DATA_ZERO) < unsigned(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SLTUI =>
                if(unsigned(DATA_ZERO) < unsigned(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SGT =>
                if(signed(DATA_ZERO) > signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SGTI =>
                if(signed(DATA_ZERO) > signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SGTU =>
                if(unsigned(DATA_ZERO) > unsigned(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SGTUI =>
                if(unsigned(DATA_ZERO) > unsigned(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SLE =>
                if(signed(DATA_ZERO) <= signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SLEI =>
                if(signed(DATA_ZERO) <= signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SLEU =>
                if(unsigned(DATA_ZERO) <= unsigned(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SLEUI =>
                if(unsigned(DATA_ZERO) <= unsigned(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SGE =>
                if(signed(DATA_ZERO) >= signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SGEI =>
                if(signed(DATA_ZERO) >= signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SGEU =>
                if(unsigned(DATA_ZERO) >= unsigned(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SGEUI =>
                if(unsigned(DATA_ZERO) >= unsigned(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SEQ =>
                if(signed(DATA_ZERO) = signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SEQI =>
                if(signed(DATA_ZERO) = signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SNE =>
                if(signed(DATA_ZERO) /= signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when SNEI =>
                if(signed(DATA_ZERO) /= signed(DATA_ONE)) then
                    DATA_OUT <= (0 => '1', others => '0');
                else
                    DATA_OUT <= (others => '0');
                end if;
            when LW =>
                DATA_OUT <= STD_LOGIC_VECTOR(unsigned(DATA_ZERO) + unsigned(DATA_ONE));
            when SW =>
                DATA_OUT <= STD_LOGIC_VECTOR(unsigned(DATA_ZERO) + unsigned(DATA_ONE));
            when BEQZ =>
                DATA_OUT <= DATA_ONE;
            when BNEZ =>
                DATA_OUT <= DATA_ONE;
            when JUMP =>
                DATA_OUT <= DATA_ONE;
            when JR =>
                DATA_OUT <= DATA_ZERO;
            when JAL =>
                DATA_OUT <= DATA_ONE;
            when JALR =>
                DATA_OUT <= DATA_ZERO;
            when others =>
                DATA_OUT <= (others => '0');
        end case;
    end process;
end architecture behavior;