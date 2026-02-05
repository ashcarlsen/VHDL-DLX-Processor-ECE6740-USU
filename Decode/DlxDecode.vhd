library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
begin
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
            READ_ADDR => INS_IN(20 downto 16),
            READ_ADDR2 => INS_IN(15 downto 11),
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
    update : process (CLK)
    begin
        if rising_edge(CLK) then
            if RST = '0' then
                ADDR_OUT <= ADDR_IN;
                INS_OUT <= INS_IN;
            else
                ADDR_OUT <= (others => '0');
                INS_OUT <= (others => '0');
            end if;
            IMM <= se_out;
        end if;
    end process;
end architecture behavior;