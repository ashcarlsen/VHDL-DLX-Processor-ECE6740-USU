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
    type state_type is (IDLE, REQUEST_FROM_PRINT, GET_FROM_PRINT, CHECK_TYPE, CHAR, INT, WRITE_TO_UART);
    signal state : state_type := IDLE;
    signal next_state : state_type := IDLE;
begin

    state_update : process(RST, DATA, EMPTY, FULL, state)
    begin
        case state is
            when IDLE =>
                RD_REQ <= '0';
                WR_EN <= '0';
                CHAR_OUT <= (others => '0');
                if (EMPTY = '1') or (FULL = '1') then
                    next_state <= IDLE;
                else
                    next_state <= REQUEST_FROM_PRINT;
                end if;
            when REQUEST_FROM_PRINT =>
                CHAR_OUT <= (others => '0');
                WR_EN <= '0';
                RD_REQ <= '1';
                next_state <= GET_FROM_PRINT;
            when GET_FROM_PRINT =>
                CHAR_OUT <= (others => '0');
                RD_REQ <= '0';
                WR_EN <= '0';
                next_state <= CHECK_TYPE;
            when CHECK_TYPE =>
                CHAR_OUT <= (others => '0');
                RD_REQ <= '0';
                WR_EN <= '0';
                if (DATA(33) = '1') then
                    next_state <= CHAR;
                else
                    next_state <= INT;
                end if;
            when CHAR =>
                CHAR_OUT <= DATA(7 downto 0);
                RD_REQ <= '0';
                WR_EN <= '1';
                next_state <= IDLE;
            when INT => 
                CHAR_OUT <= (others => '0');
                RD_REQ <= '0';
                WR_EN <= '0';
                next_state <= IDLE;
            when WRITE_TO_UART =>
                CHAR_OUT <= (others => '0');
                RD_REQ <= '0';
                WR_EN <= '0';
                next_state <= IDLE;
            when others =>
                CHAR_OUT <= (others => '0');
                RD_REQ <= '0';
                WR_EN <= '0';
                next_state <= IDLE;
        end case;
    end process;

    upate : process(CLK, RST)
    begin
        if RST = '1' then
            state <= IDLE;
        elsif rising_edge(CLK) then
            state <= next_state;
        end if;
    end process;
end architecture behavior;