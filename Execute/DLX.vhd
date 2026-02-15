library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity DLX is
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        WR_EN : in STD_LOGIC;
        WR_ADDR : in STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
        WR_DATA : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        ADDR_OUT : out STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        INS_OUT : out STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        RS2_OUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        ALU_OUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
    );
end entity DLX;

architecture behavior of DLX is
    -- signals for fetch -> decode
    signal f2d_addr : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
    signal f2d_ins : STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);

    -- signals for decode -> execute
    signal d2e_addr : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
    signal d2e_ins : STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
    signal rs1 : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal rs2 : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal imm : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal jump_flag : STD_LOGIC;
    signal alu_result : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal jump_addr : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);

begin

    jump_addr <= alu_result(ADDR_WIDTH-1 downto 0);
    ALU_OUT <= alu_result;

    fetch : entity work.DlxFetch
        generic map (
            INS_WIDTH => INS_WIDTH,
            ADDR_WIDTH => ADDR_WIDTH
        )
        port map (
            CLK => CLK,
            RST => RST,
            JUMP_ADDRESS => jump_addr,
            JUMP_FLAG => jump_flag,
            NEXT_ADDR => f2d_addr,
            INSTRUCTION => f2d_ins
        );
    decode : entity work.DlxDecode
        generic map (
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH,
            INS_WIDTH => INS_WIDTH,
            REG_ADDR_WIDTH => REG_ADDR_WIDTH
        )
        port map (
            CLK => CLK,
            RST => RST,
            ADDR_IN => f2d_addr,
            INS_IN => f2d_ins,
            WR_EN => WR_EN,
            WR_ADDR => WR_ADDR,
            WR_DATA => WR_DATA,
            ADDR_OUT => d2e_addr,
            INS_OUT => d2e_ins,
            RS1 => rs1,
            RS2 => rs2,
            IMM => imm
        );

    execute : entity work.DlxExecute
        generic map (
            DATA_WIDTH => DATA_WIDTH,
            INS_WIDTH => INS_WIDTH,
            ADDR_WIDTH => ADDR_WIDTH
        )
        port map (
            CLK => CLK,
            RST => RST,
            ADDR_IN => d2e_addr,
            INS_IN => d2e_ins,
            RS1 => rs1,
            RS2 => rs2,
            IMM => imm,
            JUMP_FLAG => jump_flag,
            ALU_OUT => alu_result,
            RS2_OUT => RS2_OUT,
            ADDR_OUT => ADDR_OUT,
            INS_OUT => INS_OUT
        );
end architecture behavior;