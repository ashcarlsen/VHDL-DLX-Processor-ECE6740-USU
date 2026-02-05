library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Factorial_TB is
end entity Factorial_TB;

architecture sim of Factorial_TB is
    constant CLK_PERIOD : time := 1 ms;
    signal JUMP_FLAG : STD_LOGIC := '0';
    signal JUMP_ADDRESS : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal RST : STD_LOGIC := '1';
    signal CLOCK : STD_LOGIC := '0';
    signal NEXT_ADDRESS : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal INSTRUCTION : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

    function addr_lut(i : std_logic_vector(9 downto 0))
    return std_logic_vector is
    begin
    case i is
        when "0000000110" => return "0000001011";
        when "0000001000" => return "0000000011";
        when "0000001010" => return "0000001010";
        when "0000001100" => return "0000010000";
        when "0000010000" => return "0000000111";
        when others       => return "0000000000";
        end case;
    end function;

    function jump_lut(i : std_logic_vector(9 downto 0))
    return std_logic is
    begin
    case i is
        when "0000000110" => return '1';
        when "0000001000" => return '1';
        when "0000001010" => return '1';
        when "0000001100" => return '1';
        when "0000010000" => return '1';
        when others       => return '0';
        end case;
    end function;

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
        wait for 1 * CLK_PERIOD;
        for i in 0 to 20 loop
            JUMP_ADDRESS <= addr_lut(NEXT_ADDRESS);
            JUMP_FLAG <= jump_lut(NEXT_ADDRESS);
            wait for 1 * clk_period;
        end loop;
        JUMP_FLAG <= '0';
        RST <= '1';
        wait for 1 * CLK_PERIOD;
    end process;
end architecture sim;