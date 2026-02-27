library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity ForwardController is
    port (
        ID_EX_INS : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        EX_MEM_INS : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        MEM_WB_INS : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        UPPER_SEL : out STD_LOGIC_VECTOR(1 downto 0);
        LOWER_SEL : out STD_LOGIC_VECTOR(1 downto 0)
    );
end entity ForwardController;

architecture behavior of ForwardController is
    -- Decode/Execute source registers from instruction
    signal ID_EX_RS1 : STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
    signal ID_EX_RS2 : STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
    signal ID_EX_OP : STD_LOGIC_VECTOR(5 downto 0);

    -- Destination registers from execute/memory and memory/wb stages
    signal EX_MEM_RD : STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
    signal EX_MEM_OP : STD_LOGIC_VECTOR(5 downto 0);
    signal MEM_WB_RD : STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
    signal MEM_WB_OP : STD_LOGIC_VECTOR(5 downto 0);
begin

    update : process (ID_EX_INS, EX_MEM_INS, MEM_WB_INS)
    begin
        -- Get RS1, RS2, and OP Code for ID/EX
        ID_EX_OP <= ID_EX_INS(31 downto 26);
        ID_EX_RS1 <= get_rs1(ID_EX_INS);
        ID_EX_RS2 <= get_rs2(ID_EX_INS);

        -- Get RD and OP Code for EX/MEM
        EX_MEM_OP <= EX_MEM_INS(31 downto 26);
        EX_MEM_RD <= get_rd(EX_MEM_INS);

        -- Get RD and OP Code for MEM/WB
        MEM_WB_OP <= MEM_WB_INS(31 downto 26);
        MEM_WB_RD <= get_rd(MEM_WB_INS);
    end process;

    sel_update : process (ID_EX_RS1, ID_EX_RS2, ID_EX_OP, EX_MEM_RD, EX_MEM_OP, MEM_WB_RD, MEM_WB_OP)
    begin
        if (is_alu_op(EX_MEM_OP) and (EX_MEM_RD = ID_EX_RS1) and ID_EX_RS1 /= "00000") then
            UPPER_SEL <= "11";
        elsif (is_alu_op(MEM_WB_OP) and (MEM_WB_RD = ID_EX_RS1) and ID_EX_RS1 /= "00000") then 
            UPPER_SEL <= "10";
        elsif (MEM_WB_OP = LW and (MEM_WB_RD = ID_EX_RS1) and ID_EX_RS1 /= "00000") then
            UPPER_SEL <= "01";
        else
            UPPER_SEL <= "00";
        end if;

        if (is_alu_op(EX_MEM_OP) and (EX_MEM_RD = ID_EX_RS2) and ID_EX_RS2 /= "00000") then
            LOWER_SEL <= "11";
        elsif (is_alu_op(MEM_WB_OP) and (MEM_WB_RD = ID_EX_RS2) and ID_EX_RS2 /= "00000") then 
            LOWER_SEL <= "10";
        elsif (MEM_WB_OP = LW and (MEM_WB_RD = ID_EX_RS2) and ID_EX_RS2 /= "00000") then
            LOWER_SEL <= "01";
        else
            LOWER_SEL <= "00";
        end if;
    end process;

end architecture behavior;