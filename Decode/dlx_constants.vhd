library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package dlx_constants is
    -- Define useful widths
    constant ADDR_WIDTH : INTEGER := 10;
    constant DATA_WIDTH : INTEGER := 32;
    constant INS_WIDTH : INTEGER := 32;
    constant REG_ADDR_WIDTH : INTEGER := 5;

    -- Define all OP codes for DLX
    constant NOP : STD_LOGIC_VECTOR(5 downto 0) := "000000";
    -- Memory
    constant LW : STD_LOGIC_VECTOR(5 downto 0) := "000001";
    constant SW : STD_LOGIC_VECTOR(5 downto 0) := "000010";
    -- arithmetic
    constant ADD : STD_LOGIC_VECTOR(5 downto 0) := "000011";
    constant ADDI : STD_LOGIC_VECTOR(5 downto 0) := "000100";
    constant ADDU : STD_LOGIC_VECTOR(5 downto 0) := "000101";
    constant ADDUI : STD_LOGIC_VECTOR(5 downto 0) := "000110";
    constant SUB : STD_LOGIC_VECTOR(5 downto 0) := "000111";
    constant SUBI : STD_LOGIC_VECTOR(5 downto 0) := "001000";
    constant SUBU : STD_LOGIC_VECTOR(5 downto 0) := "001001";
    constant SUBUI : STD_LOGIC_VECTOR(5 downto 0) := "001010";
    -- bitwise
    constant AND_OP : STD_LOGIC_VECTOR(5 downto 0) := "001011";
    constant ANDI : STD_LOGIC_VECTOR(5 downto 0) := "001100";
    constant OR_OP : STD_LOGIC_VECTOR(5 downto 0) := "001101";
    constant ORI : STD_LOGIC_VECTOR(5 downto 0) := "001110";
    constant XOR_OP : STD_LOGIC_VECTOR(5 downto 0) := "001111";
    constant XORI : STD_LOGIC_VECTOR(5 downto 0) := "010000";
    -- shifts
    constant SLL_OP : STD_LOGIC_VECTOR(5 downto 0) := "010001";
    constant SLLI : STD_LOGIC_VECTOR(5 downto 0) := "010010";
    constant SRL_OP : STD_LOGIC_VECTOR(5 downto 0) := "010011";
    constant SRLI : STD_LOGIC_VECTOR(5 downto 0) := "010100";
    constant SRA_OP : STD_LOGIC_VECTOR(5 downto 0) := "010101";
    constant SRAI : STD_LOGIC_VECTOR(5 downto 0) := "010110";
    -- comparison operators
    constant SLT : STD_LOGIC_VECTOR(5 downto 0) := "010111";
    constant SLTI : STD_LOGIC_VECTOR(5 downto 0) := "011000";
    constant SLTU : STD_LOGIC_VECTOR(5 downto 0) := "011001";
    constant SLTUI : STD_LOGIC_VECTOR(5 downto 0) := "011010";
    constant SGT : STD_LOGIC_VECTOR(5 downto 0) := "011011";
    constant SGTI : STD_LOGIC_VECTOR(5 downto 0) := "011100";
    constant SGTU : STD_LOGIC_VECTOR(5 downto 0) := "011101";
    constant SGTUI : STD_LOGIC_VECTOR(5 downto 0) := "011110";
    constant SLE : STD_LOGIC_VECTOR(5 downto 0) := "011111";
    constant SLEI : STD_LOGIC_VECTOR(5 downto 0) := "100000";
    constant SLEU : STD_LOGIC_VECTOR(5 downto 0) := "100001";
    constant SLEUI : STD_LOGIC_VECTOR(5 downto 0) := "100010";
    constant SGE : STD_LOGIC_VECTOR(5 downto 0) := "100011";
    constant SGEI : STD_LOGIC_VECTOR(5 downto 0) := "100100";
    constant SGEU : STD_LOGIC_VECTOR(5 downto 0) := "100101";
    constant SGEUI : STD_LOGIC_VECTOR(5 downto 0) := "100110";
    constant SEQ : STD_LOGIC_VECTOR(5 downto 0) := "100111";
    constant SEQI : STD_LOGIC_VECTOR(5 downto 0) := "101000";
    constant SNE : STD_LOGIC_VECTOR(5 downto 0) := "101001";
    constant SNEI : STD_LOGIC_VECTOR(5 downto 0) := "101010";
    -- branches
    constant BEQZ : STD_LOGIC_VECTOR(5 downto 0) := "101011";
    constant BNEZ : STD_LOGIC_VECTOR(5 downto 0) := "101100";
    -- jumps
    constant JUMP : STD_LOGIC_VECTOR(5 downto 0) := "101101";
    constant JR : STD_LOGIC_VECTOR(5 downto 0) := "101110";
    constant JAL : STD_LOGIC_VECTOR(5 downto 0) := "101111";
    constant JALR : STD_LOGIC_VECTOR(5 downto 0) := "110000";

    -- useful functions
    function is_dlx_signed(
        op : std_logic_vector(5 downto 0)
    ) return boolean;
end package dlx_constants;


package body dlx_constants is
    function is_dlx_signed(
        op : std_logic_vector(5 downto 0)
    ) return boolean
    is
    begin
        return
            op = ADDI or
            op = SUBI or
            op = ANDI or
            op = ORI  or
            op = XORI or
            op = SLTI or
            op = SGTI or
            op = SLEI or
            op = SGEI or
            op = SEQI or
            op = SNEI;
    end function;
end package body dlx_constants;