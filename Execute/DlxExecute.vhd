library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity DlxExecute is
    generic (
        DATA_WIDTH : POSITIVE := 32;
        INS_WIDTH : POSITIVE := 32;
        ADDR_WIDTH : POSITIVE := 10
    );
    port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        ADDR_IN : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        INS_IN : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        RS1 : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        RS2 : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        IMM : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        JUMP_FLAG : out STD_LOGIC;
        ALU_OUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        RS2_OUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        ADDR_OUT : out STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        INS_OUT : out STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0)
    );
end entity DlxExecute;

architecture behavior of DlxExecute is
    signal address_extended : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal op_code : STD_LOGIC_VECTOR(5 downto 0);
    signal upper_sel : STD_LOGIC;
    signal lower_sel : STD_LOGIC;
    signal alu_upper : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal alu_lower : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal alu_result : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal jump : STD_LOGIC;
begin

    -- OP CODE
    op_code <= INS_IN(INS_WIDTH-1 downto INS_WIDTH-6);

    -- Convert 10 bit address into a 32-bit value to pass into Mux
    address_extended(ADDR_WIDTH-1 downto 0) <= ADDR_IN;
    address_extended(DATA_WIDTH-1 downto ADDR_WIDTH) <= (others => '0');

    -- Setup the upper select flag
    -- This is only set on JAL to write R31=PC
    upper_sel <= '1' when upper_select(OP_CODE) else '0';

    -- Setup the lower select flag
    -- This is set on all immediate op codes as well as
    -- non register jumps and branches. The address to jump to
    -- is stored in the lowest bits of the instruction.
    lower_sel <= '1' when lower_select(OP_CODE) else '0';

    upper_mux : entity work.TwoMux
        generic map (
            WIDTH => DATA_WIDTH
        )
        port map (
            DATA_ZERO => RS1,
            DATA_ONE => address_extended,
            SEL => upper_sel,
            Q => alu_upper
        );
    
    lower_mux : entity work.TwoMux
        generic map (
            WIDTH => DATA_WIDTH
        )
        port map (
            DATA_ZERO => RS2,
            DATA_ONE => IMM,
            SEL => lower_sel,
            Q => alu_lower
        );
    
    should_branch : entity work.ShouldBranch
        generic map (
            DATA_WIDTH => DATA_WIDTH
        )
        port map
        (
            OP_CODE => OP_CODE,
            RS1 => RS1,
            JUMP_FLAG => jump
        );
    
    alu : entity work.ALU
        generic map (
            DATA_WIDTH => DATA_WIDTH
        )
        port map (
            OP_CODE => OP_CODE,
            DATA_ZERO => alu_upper,
            DATA_ONE => alu_lower,
            DATA_OUT => alu_result
        );

    update : process (CLK, RST)
    begin
        if RST = '1' then
            JUMP_FLAG <= '0';
            ALU_OUT <= (others => '0');
            RS2_OUT <= (others => '0');
            ADDR_OUT <= (others => '0');
            INS_OUT <= (others => '0');
        elsif rising_edge(CLK) then
            JUMP_FLAG <= jump;
            ALU_OUT <= alu_result;
            RS2_OUT <= RS2;
            ADDR_OUT <= ADDR_IN;
            INS_OUT <= INS_IN;
        end if;
    end process;
end architecture behavior;