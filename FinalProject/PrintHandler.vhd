library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity PrintHandler is
    port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        -- signals for print FIFO
        DATA : in STD_LOGIC_VECTOR(DATA_WIDTH+1 downto 0);
        EMPTY : in STD_LOGIC;
        RD_REQ : out STD_LOGIC;
        -- signals for UART FIFO
        CHAR_OUT : out STD_LOGIC_VECTOR(7 downto 0);
        WR_EN : out STD_LOGIC;
        FULL : in STD_LOGIC
    );
end entity PrintHandler;

architecture behavior of PrintHandler is
    -- state tracking signals
    type state_type is (IDLE, REQUEST_FROM_PRINT, GET_FROM_PRINT, CHECK_TYPE, CHAR, INT, ONE, START, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, ADD_STACK, ADD_SIGN, POP, LOAD, WR);
    signal state : state_type := IDLE;
    signal next_state : state_type := IDLE;

    -- stack stuff
    signal stack_wr : STD_LOGIC;
    signal stack_val : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal stack_addr : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal next_addr : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal stack_out : STD_LOGIC_VECTOR(7 downto 0);
    
    -- divider stuff
    signal numer : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0) := (others => '0');
    signal next_numer : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0) := (others => '0');
    signal quot : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal remain : STD_LOGIC_VECTOR(7 downto 0);
begin

    state_update : process(RST, DATA, EMPTY, FULL, state, numer, stack_addr, quot, remain, stack_out)
    begin
        stack_wr <= '0';
        stack_val <= (others => '0');
        case state is
            when IDLE =>
                RD_REQ <= '0';
                WR_EN <= '0';
                CHAR_OUT <= (others => '0');
                next_addr <= (others => '0');
                next_numer <= (others => '0');
                if (EMPTY = '1') or (FULL = '1') then
                    next_state <= IDLE;
                else
                    next_state <= REQUEST_FROM_PRINT;
                end if;
            when REQUEST_FROM_PRINT =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '1';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= GET_FROM_PRINT;
            when GET_FROM_PRINT =>
                CHAR_OUT <= (others => '0');
                RD_REQ <= '0';
                WR_EN <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= CHECK_TYPE;
            when CHECK_TYPE =>
                if (DATA(33) = '1') then
                    next_state <= CHAR;
                else
                    next_state <= INT;
                end if;
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
            when CHAR =>
                CHAR_OUT <= DATA(7 downto 0);
                WR_EN <= '1';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= IDLE;
            when INT => 
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= START;
            when START =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                -- If signed value
                if DATA(32) = '1' and DATA(31) = '1' then
                    next_numer <= STD_LOGIC_VECTOR(unsigned(DATA(DATA_WIDTH-1 downto 0) xor "11111111111111111111111111111111") + 1);
                else
                    next_numer <= DATA(DATA_WIDTH-1 downto 0);
                end if;
                next_addr <= stack_addr;
                next_state <= ONE;
            when ONE =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= TWO;
            when TWO =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= THREE;
            when THREE =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= FOUR;
            when FOUR =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= FIVE;
            when FIVE =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= SIX;
            when SIX =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= SEVEN;
            when SEVEN =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= EIGHT;
            when EIGHT =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= ADD_STACK;
            when ADD_STACK =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                if unsigned(quot) = 0 then
                    next_state <= ADD_SIGN;
                    next_numer <= numer;
                else
                    next_state <= ONE;
                    next_numer <= quot;
                end if;
                next_addr <= STD_LOGIC_VECTOR(unsigned(stack_addr) + 1);
                stack_val <= remain;
                stack_wr <= '1';
            when ADD_SIGN => 
                if DATA(32) = '1' and DATA(31) = '1' then
                    -- write out the '-' character
                    CHAR_OUT <= "00101101";
                    WR_EN <= '1';
                    RD_REQ <= '0';
                else
                    CHAR_OUT <= (others => '0');
                    WR_EN <= '0';
                    RD_REQ <= '0';
                end if;
                next_addr <= stack_addr;
                next_numer <= numer;
                next_state <= POP;
            when POP =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_numer <= numer;
                next_addr <= STD_LOGIC_VECTOR(unsigned(stack_addr) - 1);
                next_state <= LOAD;
            when LOAD =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '0';
                next_numer <= numer;
                next_addr <= stack_addr;
                next_state <= WR;
            when WR =>
                CHAR_OUT <= STD_LOGIC_VECTOR(unsigned(stack_out) + 48);
                WR_EN <= '1';
                RD_REQ <= '0';
                next_addr <= stack_addr;
                next_numer <= numer;
                if unsigned(stack_addr) <= 0 then
                    next_state <= IDLE;
                else
                    next_state <= POP;
                end if;
            when others =>
                CHAR_OUT <= (others => '0');
                RD_REQ <= '0';
                WR_EN <= '0';
                next_addr <= (others => '0');
                next_numer <= (others => '0');
                next_state <= IDLE;
        end case;
    end process;

    divider : entity work.Divider
        port map (
            aclr => RST,
            clock => CLK,
            denom => "00001010",
            numer => numer,
            quotient => quot,
            remain => remain
        );

    stack : entity work.Stack
        port map (
            aclr => RST,
            address => stack_addr,
            clock => CLK,
            data => stack_val,
            wren => stack_wr,
            q => stack_out
        );

    upate : process(CLK, RST)
    begin
        if RST = '1' then
            state <= IDLE;
        elsif rising_edge(CLK) then
            state <= next_state;
            numer <= next_numer;
            stack_addr <= next_addr;
        end if;
    end process;
end architecture behavior;