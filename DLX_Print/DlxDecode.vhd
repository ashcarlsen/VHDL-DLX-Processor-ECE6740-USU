library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity DlxDecode is
    generic(
        ADDR_WIDTH : POSITIVE := 10;
        DATA_WIDTH : POSITIVE := 32;
        INS_WIDTH : POSITIVE := 32;
        REG_ADDR_WIDTH : POSITIVE := 5
    );
    port(
        -- Standard inputs
		CLK : in STD_LOGIC;
		RST : in STD_LOGIC;
        -- Inputs from controllers
        STALL : in STD_LOGIC;
        FLUSH : in STD_LOGIC;
        -- inputs from fetch
        ADDR_IN : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        INS_IN : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        -- inputs from write-back
        WR_EN : in STD_LOGIC;
        WR_ADDR : in STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
        WR_DATA : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        -- outputs to execute
        ADDR_OUT : out STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        INS_OUT : out STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        RS1 : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        RS2 : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        IMM : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
    );
end entity DlxDecode;

architecture behavior of DlxDecode is
    signal se_out : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal read1 : STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
    signal read2 : STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);

    signal mux_out : STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
    signal nop : STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0) := (others => '0');

    signal sel : STD_LOGIC;

begin

    sel <= STALL or FLUSH;

    ins_mux : entity work.TwoMux
        generic map (
            WIDTH => INS_WIDTH
        )
        port map (
            DATA_ZERO => INS_IN,
            DATA_ONE => nop,
            SEL => sel,
            Q => mux_out
        );

    vals : process (mux_out)
    begin
        read1 <= get_rs1(mux_out);
        read2 <= get_rs2(mux_out);
    end process;

    reg_file : entity work.RegisterFile
        generic map (
            ADDR_WIDTH => REG_ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH,
            NUM_REG => 32
        )
        port map (
            CLK => CLK,
            DATA_IN => WR_DATA,
            WR_ADDR => WR_ADDR,
            WR_EN => WR_EN,
            READ_ADDR => read1,
            READ_ADDR2 => read2,
            DATA_OUT => RS1,
            DATA_OUT2 => RS2
        );

    sign_exten : entity work.SignExtender
        generic map(
            IMM_WIDTH => 16,
            DATA_WIDTH => DATA_WIDTH
        )
        port map (
            OP_CODE => INS_IN(INS_WIDTH-1 downto INS_WIDTH-6),
            VALUE => INS_IN(15 downto 0),
            EXTENDED => se_out
        );



    update : process (CLK, RST)
    begin
        if RST = '1' then
            ADDR_OUT <= (others => '0');
            INS_OUT <= (others => '0');
            IMM <= (others => '0');
        elsif rising_edge(CLK) then
            ADDR_OUT <= ADDR_IN;
            INS_OUT <= mux_out;
            IMM <= se_out;
        end if;
    end process;
end architecture behavior;