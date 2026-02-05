library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Example1_TB is
end entity Example1_TB;

architecture sim of Example1_TB is
    constant CLK_PERIOD : time := 1 ms;
    signal JUMP_FLAG : STD_LOGIC := '0';
    signal JUMP_ADDRESS : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal RST : STD_LOGIC := '1';
    signal CLOCK : STD_LOGIC := '0';
    signal NEXT_ADDRESS : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal INSTRUCTION : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

    type addr_array_t is array (natural range <>) of std_logic_vector(9 downto 0);
    type flag_array_t is array (natural range <>) of std_logic;

    constant addrs : addr_array_t := (
    "0000000000",
    "0000000000",
    "0000000000",
    "0000000000",
    "0000000000",
    "0000000000",
    "0000000000",
    "0000000000",
    "0000000000",
    "0000000011",
    "0000000000",
    "0000001011"
    );

    constant flags : flag_array_t := (
        '0',
        '0',
        '0',
        '0',
        '0',
        '0',
        '0',
        '0',
        '0',
        '1',
        '0',
        '1'
    );
begin

    UUT : entity work.DlxFetch
        generic map(
            INS_WIDTH => 32,
            ADDR_WIDTH => 10
        )
        port map(
            CLK => CLOCK,
            RST => RST,
            JUMP_ADDRESS => JUMP_ADDRESS,
            JUMP_FLAG => JUMP_FLAG,
            NEXT_ADDR => NEXT_ADDRESS,
            INSTRUCTION => INSTRUCTION
        );
    
    CLOCK <= not CLOCK after CLK_PERIOD / 2;
    stim_proc: process
    begin
        RST <= '1';
        wait for 1 * CLK_PERIOD;
        RST <= '0';
        wait for 4 * CLK_PERIOD;
        for i in 0 to 3 loop
            for j in 3 to 9 loop
                JUMP_ADDRESS <= addrs(j);
                if i = 3 then
                    JUMP_FLAG <= '0';
                else
                    JUMP_FLAG <= flags(j);
                end if;
                wait for 1 * CLK_PERIOD;
            end loop;
        end loop;
        JUMP_ADDRESS <= addrs(10);
        JUMP_FLAG <= flags(10);
        wait for 1 * CLK_PERIOD;
        JUMP_ADDRESS <= addrs(11);
        JUMP_FLAG <= flags(11);
        wait for 10 * CLK_PERIOD;
        JUMP_FLAG <= '0';
        RST <= '1';
    end process;
end architecture sim;