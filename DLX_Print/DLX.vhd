library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity DLX is
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        RX_LINE : in STD_LOGIC;
        TX_LINE : out STD_LOGIC
    );
end entity DLX;

architecture behavior of DLX is

    signal dlx_rst : STD_LOGIC := '1';
    
    -- signals for fetch -> decode
    signal f2d_addr : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
    signal f2d_ins : STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);

    -- signals for decode -> execute
    signal d2e_addr : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
    signal d2e_ins : STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
    signal rs1 : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal rs2 : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal imm : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    
    -- signals for execute -> memory
    signal e2m_addr : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
    signal e2m_ins : STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
    signal alu_result : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal jump_flag : STD_LOGIC;
    signal jump_addr : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
    signal store_val : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal m2f_jump : STD_LOGIC;
    signal m2f_jump_addr : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);

    -- signals for memory -> write-back
    signal m2w_addr : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
    signal m2w_ins : STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
    signal mem_out : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal result_out : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal wr_addr : STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
    signal wr_en : STD_LOGIC;
    signal wr_data : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);

    -- forward signals
    signal up_sel : STD_LOGIC_VECTOR(1 downto 0);
    signal low_sel : STD_LOGIC_VECTOR(1 downto 0);

    -- control signals
    signal stall : STD_LOGIC;
    signal flush : STD_LOGIC;

    -- print fifo signals
    signal print_data : STD_LOGIC_VECTOR(DATA_WIDTH+1 downto 0);
    signal print_wr : STD_LOGIC;
    signal print_rd : STD_LOGIC := '0';
    signal print_out : STD_LOGIC_VECTOR(DATA_WIDTH+1 downto 0);
    signal print_empty : STD_LOGIC;
    signal print_full : STD_LOGIC;

    -- uart fifo signals
    signal uart_clk : STD_LOGIC;
    signal fifo_data : STD_LOGIC_VECTOR(7 downto 0);
    signal fifo_wr : STD_LOGIC;
    signal fifo_rd : STD_LOGIC;
    signal fifo_out : STD_LOGIC_VECTOR(7 downto 0);
    signal fifo_empty : STD_LOGIC;
    signal fifo_full : STD_LOGIC;
    signal locked : STD_LOGIC;

    signal rdclk : STD_LOGIC;
begin

    -- Reset processor if not locked
    dlx_rst <= RST or not locked;

    fetch : entity work.DlxFetch
        generic map (
            INS_WIDTH => INS_WIDTH,
            ADDR_WIDTH => ADDR_WIDTH
        )
        port map (
            CLK => CLK,
            RST => dlx_rst,
            STALL => stall,
            FLUSH => flush,
            JUMP_ADDRESS => m2f_jump_addr,
            JUMP_FLAG => m2f_jump,
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
            RST => dlx_rst,
            STALL => stall,
            FLUSH => flush,
            ADDR_IN => f2d_addr,
            INS_IN => f2d_ins,
            WR_EN => wr_en,
            WR_ADDR => wr_addr,
            WR_DATA => wr_data,
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
            RST => dlx_rst,
            FLUSH => flush,
            ADDR_IN => d2e_addr,
            INS_IN => d2e_ins,
            EX_MEM_ALU => alu_result,
            MEM_WB_ALU => result_out,
            MEM_WB_DATA => mem_out,
            SEL_A => up_sel,
            SEL_B => low_sel,
            RS1 => rs1,
            RS2 => rs2,
            IMM => imm,
            JUMP_FLAG => jump_flag,
            ALU_OUT => alu_result,
            RS2_OUT => store_val,
            ADDR_OUT => e2m_addr,
            INS_OUT => e2m_ins,
            PRINT_FULL => print_full,
            PRINT_DATA => print_data,
            PRINT_WR => print_wr
        );

    memory : entity work.DlxMemory
        generic map (
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH,
            INS_WIDTH => INS_WIDTH
        )
        port map (
            CLK => CLK,
            RST => dlx_rst,
            ADDR_IN => e2m_addr,
            INS_IN => e2m_ins,
            JUMP_FLAG => jump_flag,
            ALU_RESULT => alu_result,
            STORE_VAL => store_val,
            JUMP_OUT => m2f_jump,
            JUMP_ADDRESS => m2f_jump_addr,
            ADDR_OUT => m2w_addr,
            INS_OUT => m2w_ins,
            DATA_OUT => mem_out,
            ALU_OUTPUT => result_out
        );
    
    wb : entity work.DlxWriteBack
        generic map (
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH,
            INS_WIDTH => INS_WIDTH,
            REG_ADDR_WIDTH => REG_ADDR_WIDTH    
        )
        port map (
            RST => dlx_rst,
            ADDR_IN => m2w_addr,
            INS_IN => m2w_ins,
            DATA_IN => mem_out,
            ALU_IN => result_out,
            REG_ADDR => wr_addr,
            WR_EN => wr_en,
            WR_DATA => wr_data
        );

    forwarder : entity work.ForwardController
        port map (
            ID_EX_INS => d2e_ins,
            EX_MEM_INS => e2m_ins,
            MEM_WB_INS => m2w_ins,
            UPPER_SEL => up_sel,
            LOWER_SEL => low_sel
        );
    
    staller : entity work.StallController
        port map (
            IF_ID_INS => f2d_ins,
            ID_EX_INS => d2e_ins,
            PRINT_FIFO_FULL => print_full,
            STALL => stall
        );
    
    flusher : entity work.FlushController
        port map (
            JUMP => m2f_jump,
            FLUSH => flush   
        );

    printer : entity work.PrintFIFO
        port map (
            aclr => dlx_rst,
            data => print_data,
            rdclk => CLK,
            rdreq => print_rd,
            wrclk => CLK,
            wrreq => print_wr,
            q => print_out,
            rdempty => print_empty,
            wrfull => print_full
        );
    
    converter : entity work.PrintHandler
        port map (
            CLK => CLK,
            RST => dlx_rst,
            DATA => print_out,
            EMPTY => print_empty,
            RD_REQ => print_rd,
            CHAR_OUT => fifo_data,
            WR_EN => fifo_wr,
            FULL => fifo_full
        );

    pll : entity work.UartPll
        port map (
            areset => '0',
            inclk0 => CLK,
            c0 => uart_clk,
            locked => locked
        );

    fifo : entity work.UART_FIFO
        port map (
            aclr => dlx_rst,
            data => fifo_data,
            rdclk => uart_clk,
            rdreq => fifo_rd,
            wrclk => CLK,
            wrreq => fifo_wr,
            q => fifo_out,
            rdempty => fifo_empty,
            wrfull => fifo_full
        );

    tx : entity work.UART_TX
        port map (
            txclk => uart_clk,
            rst => dlx_rst,
            data => fifo_out,
            empty => fifo_empty,
            rdclk => rdclk,
            rdreq => fifo_rd,
            tx_line => TX_LINE
        );
end architecture behavior;