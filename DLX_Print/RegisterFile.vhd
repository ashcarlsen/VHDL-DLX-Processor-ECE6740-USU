library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterFile is
    generic(
        ADDR_WIDTH : POSITIVE := 5;
        DATA_WIDTH : POSITIVE := 32;
        NUM_REG : POSITIVE := 32
    );
    port(
        CLK : in STD_LOGIC;
        DATA_IN : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        WR_ADDR : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        WR_EN : in STD_LOGIC;
        READ_ADDR : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        READ_ADDR2 : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        DATA_OUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        DATA_OUT2 : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
    );
end entity RegisterFile;

architecture rtl of RegisterFile is
    type MEMORY is array(0 to NUM_REG-1) of STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    constant ZERO : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0) := (others => '0');
begin
    update : process (CLK)
    VARIABLE ram_block : MEMORY;
    begin
        if rising_edge(CLK) then
            -- Block writes to R0
            if (WR_EN = '1') and (WR_ADDR /= ZERO) then
                ram_block(to_integer(unsigned(WR_ADDR))) := DATA_IN;
            end if;
            -- if reading from 0
            if (READ_ADDR = ZERO) then
                -- set data to 0
                DATA_OUT <= (others => '0');
            else
                DATA_OUT <= ram_block(to_integer(unsigned(READ_ADDR))); 
            end if;
            -- if reading from 0
            if (READ_ADDR2 = ZERO) then
                -- set data to 0
                DATA_OUT2 <= (others => '0');
            else
                DATA_OUT2 <= ram_block(to_integer(unsigned(READ_ADDR2))); 
            end if;
        end if;
    end process;
end architecture rtl;