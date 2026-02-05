library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Factorial_TB is
end entity Factorial_TB;

architecture sim of Factorial_TB is
    constant CLK_PERIOD : time := 1 ms;
    signal CLOCK : STD_LOGIC := '0';
    signal RST : STD_LOGIC := '1';
    signal JUMP_ADDRESS : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal JUMP_FLAG : STD_LOGIC := '0';
    signal WR_EN : STD_LOGIC := '0';
    signal WR_ADDR : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal WR_DATA : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal ADDR_OUT : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal INS_OUT : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal RS1_OUT : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal RS2_OUT : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal IMM_OUT : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin

    UUT : entity work.DLX
        port map(
            CLK => CLOCK,
            RST => RST,
            JUMP_ADDR => JUMP_ADDRESS,
            JUMP_FLAG => JUMP_FLAG,
            WR_EN => WR_EN,
            WR_ADDR => WR_ADDR,
            WR_DATA => WR_DATA,
            ADDR_OUT => ADDR_OUT,
            INS_OUT => INS_OUT,
            RS1_OUT => RS1_OUT,
            RS2_OUT => RS2_OUT,
            IMM_OUT => IMM_OUT
        );
    
    CLOCK <= not CLOCK after CLK_PERIOD / 2;
    stim_proc: process
    begin
        -- Init everything to 0 while reset
        RST <= '1';
        JUMP_FLAG <= '0';
        JUMP_ADDRESS <= (others => '0');
        WR_EN <= '0';
        WR_ADDR <= (others => '0');
        WR_DATA <= (others => '0');
        wait for 1 * CLK_PERIOD;
        RST <= '0';
        wait for 2 * CLK_PERIOD;
        -- LW R10 n(R0)
        WR_EN <= '1';
        WR_ADDR <= "01010";
        WR_DATA <= x"00000003";
        wait for 1 * CLK_PERIOD;
        -- ADDI R1 R10 0
        WR_EN <= '1';
        WR_ADDR <= "00001";
        WR_DATA <= x"00000003";
        wait for 1 * CLK_PERIOD;
        -- ADDI R3 R0 0
        WR_EN <= '1';
        WR_ADDR <= "00011";
        WR_DATA <= x"00000000";
        wait for 1 * CLK_PERIOD;
        -- SLEI R20 R10 2
        WR_EN <= '1';
        WR_ADDR <= "10100";
        WR_DATA <= x"00000000";
        wait for 1 * CLK_PERIOD;
        -- BNEZ R20 exit
        WR_EN <= '0';
        WR_ADDR <= "00000";
        WR_DATA <= x"00000000";
        wait for 1 * CLK_PERIOD;
        -- SUBI R15 R10 1
        WR_EN <= '1';
        WR_ADDR <= "01111";
        WR_DATA <= x"00000002";
        wait for 1 * CLK_PERIOD;
        -- JAL factorial
        WR_EN <= '1';
        WR_ADDR <= "11111";
        WR_DATA <= x"00000007";
        JUMP_ADDRESS <= "0000001011";
        JUMP_FLAG <= '1';
        wait for 1 * CLK_PERIOD;
        -- SLEI R30 R15 0
        JUMP_ADDRESS <= "0000000000";
        JUMP_FLAG <= '0';
        WR_EN <= '1';
        WR_ADDR <= "11110";
        WR_DATA <= x"00000000";
        wait for 1 * CLK_PERIOD;
        -- BNEZ R30
        WR_EN <= '0';
        wait for 1 * CLK_PERIOD;
        -- ADD R3 R3 R1
        WR_EN <= '1';
        WR_ADDR <= "00011";
        WR_DATA <= x"00000003";
        wait for 1 * CLK_PERIOD;
        -- SUBI R15 R15 1
        WR_EN <= '1';
        WR_ADDR <= "01111";
        WR_DATA <= x"00000001";
        wait for 1 * CLK_PERIOD;
        -- J factorial
        WR_EN <= '0';
        JUMP_FLAG <= '1';
        JUMP_ADDRESS <= "0000001011";
        wait for 1 * CLK_PERIOD;
        -- SLEI R30 R15 0
        JUMP_FLAG <= '0';
        WR_EN <= '1';
        WR_ADDR <= "11110";
        WR_DATA <= x"00000000";
        wait for 1 * CLK_PERIOD;
        -- BNEZ R30
        WR_EN <= '0';
        wait for 1 * CLK_PERIOD;
        -- ADD R3 R3 R1
        WR_EN <= '1';
        WR_ADDR <= "00011";
        WR_DATA <= x"00000006";
        wait for 1 * CLK_PERIOD;
        -- SUBI R15 R15 1
        WR_EN <= '1';
        WR_ADDR <= "01111";
        WR_DATA <= x"00000000";
        wait for 1 * CLK_PERIOD;
        -- J factorial
        WR_EN <= '0';
        JUMP_FLAG <= '1';
        JUMP_ADDRESS <= "0000001011";
        wait for 1 * CLK_PERIOD;
        -- SLEI R30 R15 0
        JUMP_ADDRESS <= "0000000000";
        JUMP_FLAG <= '0';
        WR_EN <= '1';
        WR_ADDR <= "11110";
        WR_DATA <= x"00000001";
        wait for 1 * CLK_PERIOD;
        -- BNEZ R30
        WR_EN <= '0';
        JUMP_ADDRESS <= "0000010000";
        JUMP_FLAG <= '1';
        wait for 1 * CLK_PERIOD;
        -- ADDI R1 R3 0
        JUMP_ADDRESS <= "0000000000";
        JUMP_FLAG <= '0';
        WR_EN <= '1';
        WR_ADDR <= "00001";
        WR_DATA<= x"00000006";
        wait for 1 * CLK_PERIOD;
        -- J R31
        WR_EN <= '0';
        JUMP_FLAG <= '1';
        JUMP_ADDRESS <= "0000000111";
        wait for 1 * CLK_PERIOD;
        -- SUBI R10 R10 1
        WR_EN <= '1';
        WR_ADDR <= "01010";
        WR_DATA <= x"00000002";
        wait for 1 * CLK_PERIOD;
        -- J top
        WR_EN <= '0';
        JUMP_FLAG <= '1';
        JUMP_ADDRESS <= "0000000011";
        wait for 1 * CLK_PERIOD;
        -- SLEI R20 R10 2
        WR_EN <= '1';
        WR_ADDR <= "10100";
        WR_DATA <= x"00000001";
        wait for 1 * CLK_PERIOD;
        -- BNEZ R20 exit
        WR_EN <= '0';
        JUMP_ADDRESS <= "0000001001";
        JUMP_FLAG <= '1';
        wait for 1 * CLK_PERIOD;
        -- SW f(R0) R1
        JUMP_FLAG <= '0';
        wait for 1 * CLK_PERIOD;
        -- J done
        JUMP_FLAG <= '1';
        JUMP_ADDRESS <= "0000001010";
        wait for 10 * CLK_PERIOD;
    end process;
end architecture sim;