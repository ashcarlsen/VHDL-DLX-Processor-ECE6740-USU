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
        FLUSH : in STD_LOGIC;
        ADDR_IN : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        INS_IN : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        EX_MEM_ALU : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        MEM_WB_ALU : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        MEM_WB_DATA : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        SEL_A : in STD_LOGIC_VECTOR(1 downto 0);
        SEL_B : in STD_LOGIC_VECTOR(1 downto 0);
        RS1 : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        RS2 : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        IMM : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        JUMP_FLAG : out STD_LOGIC;
        ALU_OUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        RS2_OUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        ADDR_OUT : out STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        INS_OUT : out STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        -- print FIFO signals
        PRINT_FULL : in STD_LOGIC;
        PRINT_DATA : out STD_LOGIC_VECTOR(DATA_WIDTH+1 downto 0);
        PRINT_WR : out STD_LOGIC;
        -- scan FIFO signals
        SCAN_DATA : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        -- timer signals
        TIMER_RST : out STD_LOGIC := '0';
        TIMER_GO : out STD_LOGIC := '0';
        TIMER_STOP : out STD_LOGIC := '0'
    );
end entity DlxExecute;

architecture behavior of DlxExecute is
    signal op_code : STD_LOGIC_VECTOR(5 downto 0);
    signal lower_sel : STD_LOGIC;
    signal lower_data : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal upper_data : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal alu_upper : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal alu_lower : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal alu_result : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal jump : STD_LOGIC;

    signal ins : STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);

    signal print_en : STD_LOGIC;
    signal scan_sel : STD_LOGIC;

begin

    ins_mux : entity work.TwoMux
        generic map (
            WIDTH => INS_WIDTH
        )
        port map (
            DATA_ZERO => INS_IN,
            DATA_ONE => NOP_INS,
            SEL => FLUSH,
            Q => ins
        );

    -- OP CODE
    op_code <= ins(INS_WIDTH-1 downto INS_WIDTH-6);

    -- Setup the lower select flag
    -- This is set on all immediate op codes as well as
    -- non register jumps and branches. The address to jump to
    -- is stored in the lowest bits of the instruction.
    lower_sel <= '1' when lower_select(OP_CODE) else '0';

    -- setup the scan select flag based on the op code of the instruction
    -- set the scan sel to '1' when we get a scan instruction
    scan_sel <= '1' when is_scan(ins(INS_WIDTH-1 downto INS_WIDTH-6)) else '0';

    upper_mux : entity work.FourMux
        generic map (
            WIDTH => DATA_WIDTH
        )
        port map (
            DATA_ZERO => RS1,
            DATA_ONE => MEM_WB_DATA,
            DATA_TWO => MEM_WB_ALU,
            DATA_THREE => EX_MEM_ALU,
            SEL => SEL_A,
            Q => upper_data
        );

    scan_mux : entity work.TwoMux
        generic map (
            WIDTH => DATA_WIDTH
        )
        port map (
            DATA_ZERO => upper_data,
            DATA_ONE => SCAN_DATA,
            SEL => scan_sel,
            Q => alu_upper
        );
    
    rs1_imm_mux : entity work.TwoMux
        generic map (
            WIDTH => DATA_WIDTH
        )
        port map (
            DATA_ZERO => lower_data,
            DATA_ONE => IMM,
            SEL => lower_sel,
            Q => alu_lower
        );

    lower_mux : entity work.FourMux
        generic map (
            WIDTH => DATA_WIDTH
        )
        port map (
            DATA_ZERO => RS2,
            DATA_ONE => MEM_WB_DATA,
            DATA_TWO => MEM_WB_ALU,
            DATA_THREE => EX_MEM_ALU,
            SEL => SEL_B,
            Q => lower_data
        );
    
    should_branch : entity work.ShouldBranch
        generic map (
            DATA_WIDTH => DATA_WIDTH
        )
        port map
        (
            OP_CODE => OP_CODE,
            RS1 => alu_upper,
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
        
        -- Reset new registered signals
        PRINT_WR <= '0';
        PRINT_DATA <= (others => '0');
        TIMER_RST <= '0';
        TIMER_GO <= '0';
        TIMER_STOP <= '0';
        
    elsif rising_edge(CLK) then
        JUMP_FLAG <= jump;
        ALU_OUT <= alu_result;
        RS2_OUT <= lower_data;
        ADDR_OUT <= ADDR_IN;
        INS_OUT <= ins;

        -- Register the Print Logic
        -- Note: We use 'ins' here, which is the output of the NOP mux
        if is_print(ins(31 downto 26)) and (PRINT_FULL = '0') then
            PRINT_WR <= '1';
        else
            PRINT_WR <= '0';
        end if;

        -- Register the Data and Type flags
        PRINT_DATA(DATA_WIDTH-1 downto 0) <= alu_result; 
        
        if (ins(31 downto 26) = PD) then
            PRINT_DATA(DATA_WIDTH) <= '1';
        else
            PRINT_DATA(DATA_WIDTH) <= '0';
        end if;

        if (ins(31 downto 26) = PCH) then
            PRINT_DATA(DATA_WIDTH+1) <= '1';
        else
            PRINT_DATA(DATA_WIDTH+1) <= '0';
        end if;

        -- Register Timer signals
        if (ins(31 downto 26) = TR) then
            TIMER_RST <= '1';
            TIMER_GO <= '0';
            TIMER_STOP <= '0';
        elsif (ins(31 downto 26) = TGO) then
            TIMER_RST <= '0';
            TIMER_GO <= '1';
            TIMER_STOP <= '0';
        elsif (ins(31 downto 26) = TSP) then
            TIMER_RST <= '0';
            TIMER_GO <= '0';
            TIMER_STOP <= '1';
        else
            TIMER_RST <= '0';
            TIMER_GO <= '0';
            TIMER_STOP <= '0';
        end if;
    end if;
end process;
end architecture behavior;