library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity StallController is
    port(
        IF_ID_INS : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        ID_EX_INS : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        PRINT_FIFO_FULL : in STD_LOGIC;
        STALL : out STD_LOGIC
    );
end entity StallController;

architecture behavior of StallController is
    signal IF_ID_RS1 : STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
    signal IF_ID_RS2 : STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
    signal IF_ID_OP : STD_LOGIC_VECTOR(5 downto 0);

    signal ID_EX_OP : STD_LOGIC_VECTOR(5 downto 0);
    signal ID_EX_RD : STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
    signal LOAD_STALL : STD_LOGIC;
begin

    update : process(IF_ID_INS, ID_EX_INS)
    begin
        IF_ID_RS1 <= get_rs1(IF_ID_INS);
        IF_ID_RS2 <= get_rs2(IF_ID_INS);
        IF_ID_OP <= IF_ID_INS(31 downto 26);

        ID_EX_OP <= ID_EX_INS(31 downto 26);
        ID_EX_RD <= get_rd(ID_EX_INS);
    end process;

    stall_update : process(IF_ID_RS1, IF_ID_RS2, IF_ID_OP, ID_EX_OP, ID_EX_RD)
    begin
        if ((ID_EX_OP = LW) and (is_alu_op(IF_ID_OP) or IF_ID_OP = LW) and ((ID_EX_RD = IF_ID_RS1) or (ID_EX_RD = IF_ID_RS2))) then
            LOAD_STALL <= '1';
        else
            LOAD_STALL <= '0';
        end if;

    end process;

    -- stall when load hazard or print fifo full
    STALL <= LOAD_STALL or PRINT_FIFO_FULL;
end architecture behavior;