library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity ScanHandler is
    port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        -- signals for scan FIFO
        FULL : in STD_LOGIC;
        DATA : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        WR_REQ : out STD_LOGIC;
        -- signals for UART RX FIFO
        CHAR_IN : in STD_LOGIC_VECTOR(7 downto 0);
        EMPTY : in STD_LOGIC;
        RD_REQ : out STD_LOGIC
    );
end entity ScanHandler;

architecture behavior of ScanHandler is
    type state_type is (START, IDLE, READ_CHAR, ACCUM, ONE, TWO, THREE, FOUR, CONVERT, WR);
    signal state : state_type := IDLE;
    signal next_state : state_type := IDLE;


    -- multiplier stuff
    signal number : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0) := (others => '0');
    signal next_number : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0) := (others => '0');
    signal result : STD_LOGIC_VECTOR(39 downto 0);
    signal result_trunc : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);

    -- state stuff
    signal started : STD_LOGIC := '0';
    signal next_started : STD_LOGIC := '0';

    signal neg : STD_LOGIC := '0';
    signal next_neg : STD_LOGIC := '0';
begin

    result_trunc <= result(DATA_WIDTH-1 downto 0);

    -- This multiplies dataa by 10 and outputs in result
    -- There is a 4 clock cycle delay for the output
    mult : entity work.Multiplier
        port map (
            aclr => RST,
            clock => CLK,
            dataa => number,
            result => result
        );

    state_update : process (RST, FULL, CHAR_IN, EMPTY, state, number, result, result_trunc, neg, started)
    begin
        case state is
            when START =>
                RD_REQ <= '0';
                WR_REQ <= '0';
                DATA <= (others => '0');
                next_number <= (others => '0');
                next_started <= '0';
                next_neg <= '0';
                next_state <= IDLE;
            when IDLE =>
                RD_REQ <= '0';
                WR_REQ <= '0';
                DATA <= (others => '0');
                next_started <= started;
                next_number <= number;
                next_neg <= neg;
                if (EMPTY = '1') or (FULL = '1') then
                    next_state <= IDLE;
                else
                    next_state <= READ_CHAR;
                end if;
            when READ_CHAR =>
                RD_REQ <= '1';
                WR_REQ <= '0';
                DATA <= (others => '0');
                next_started <= started;
                next_neg <= neg;
                next_number <= number;
                next_state <= ACCUM;
            when ACCUM =>
                RD_REQ <= '0';
                WR_REQ <= '0';
                DATA <= (others => '0');
                next_number <= number;
                if ((unsigned(CHAR_IN) >= 48) and (unsigned(CHAR_IN) <= 57)) then
                    next_started <= '1';
                    next_neg <= neg;
                    next_state <= ONE;
                elsif (unsigned(CHAR_IN) = 10 or unsigned(CHAR_IN) = 13) then
                    next_started <= '1';
                    next_neg <= neg;
                    next_state <= CONVERT;
                elsif (unsigned(CHAR_IN) = 45 and started <= '0') then
                    next_started <= '1';
                    next_neg <= '1';
                    next_state <= IDLE;
                else
                    next_started <= started;
                    next_neg <= neg;
                    next_state <= IDLE;
                end if;
            when ONE =>
                RD_REQ <= '0';
                WR_REQ <= '0';
                DATA <= (others => '0');
                next_started <= started;
                next_neg <= neg;
                next_number <= number;
                next_state <= TWO;
            when TWO =>
                RD_REQ <= '0';
                WR_REQ <= '0';
                DATA <= (others => '0');
                next_started <= started;
                next_neg <= neg;
                next_state <= THREE;
                next_number <= number;
            when THREE =>
                RD_REQ <= '0';
                WR_REQ <= '0';
                DATA <= (others => '0');
                next_started <= started;
                next_neg <= neg;
                next_state <= FOUR;
                next_number <= number;
            when FOUR =>
                RD_REQ <= '0';
                WR_REQ <= '0';
                DATA <= (others => '0');
                next_started <= started;
                next_neg <= neg;
                next_state <= IDLE;
                next_number <= STD_LOGIC_VECTOR(unsigned(result_trunc) + (unsigned(CHAR_IN)-48));
            when CONVERT =>
                RD_REQ <= '0';
                WR_REQ <= '0';
                DATA <= (others => '0');
                next_started <= started;
                next_neg <= neg;
                next_state <= WR;
                -- convert two's compliment if negative flag is true
                if (neg = '1') then
                    next_number <= STD_LOGIC_VECTOR(unsigned(number xor "11111111111111111111111111111111") + 1);
                else
                    next_number <= number;
                end if;
            when WR =>
                RD_REQ <= '0';
                if (started <= '1') then
                    WR_REQ <= '1';
                else
                    WR_REQ <= '0';
                end if;
                DATA <= number;
                next_started <= started;
                next_neg <= neg;
                next_number <= number;
                next_state <= START;
        end case;
    end process;

    update : process (CLK, RST)
    begin
        if RST = '1' then
            state <= START;
            number <= (others => '0');
        elsif rising_edge(CLK) then
            state <= next_state;
            number <= next_number;
            started <= next_started;
            neg <= next_neg;
        end if;
    end process;
end architecture behavior;