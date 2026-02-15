library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity DlxWriteBack is
    generic(
        ADDR_WIDTH : POSITIVE := 10;
        DATA_WIDTH : POSITIVE := 32;
        INS_WIDTH : POSITIVE := 32;
        REG_ADDR_WIDTH : POSITIVE := 5
    );
    port (
        RST : in STD_LOGIC;
        ADDR_IN : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        INS_IN : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        DATA_IN : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        ALU_IN : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);

        -- non registered outputs
        REG_ADDR : out STD_LOGIC_VECTOR(REG_ADDR_WIDTH-1 downto 0);
        WR_EN : out STD_LOGIC;
        WR_DATA : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
    );
end entity DlxWriteBack;

architecture behavior of DlxWriteBack is
    signal op_code : STD_LOGIC_VECTOR(5 downto 0);
    signal addr_extended : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal sel : STD_LOGIC_VECTOR(1 downto 0);
begin
    first : process (ADDR_IN, INS_IN, DATA_IN, ALU_IN, RST)
    begin
        -- extend the address to 32 bits from 10
        addr_extended(DATA_WIDTH-1 downto ADDR_WIDTH) <= (others => '0');
        addr_extended(ADDR_WIDTH-1 downto 0) <= ADDR_IN;

        -- Init the op code value from the instruction 
        op_code <= INS_IN(INS_WIDTH-1 downto INS_WIDTH-6);

        -- JAL or JALR we store the address in R31
        if (op_code = JAL or op_code = JALR) then
            REG_ADDR <= (others => '1');
        -- 25 to 21 is where LW reg and RD is stored
        else
            REG_ADDR <= INS_IN(25 downto 21);
        end if;
    end process;
    
    second : process (op_code, RST)
    begin
        -- Set the select line for the mux
        -- JAL or JALR need to write the jump address to reg
        if (op_code = JAL or op_code = JALR) then
            sel <= "00";
        -- If it was a load word, then the DATA_IN from memory is needed to be written
        elsif (op_code = LW) then
            sel <= "01";
        -- Otherwise, write whatever was in the alu output
        else
            sel <= "10";
        end if;

        -- If reset, don't do anything
        if(RST = '1') then
            WR_EN <= '0';
        elsif should_write(op_code) then
            WR_EN <= '1';
        else
            WR_EN <= '0';
        end if;
    end process;

    mux : entity work.ThreeMux
        generic map (
            DATA_WIDTH => DATA_WIDTH
        )
        port map (
            DATA_ZERO => addr_extended,
            DATA_ONE => DATA_IN,
            DATA_TWO => ALU_IN,
            SEL => sel,
            DATA_OUT => WR_DATA
        );

end architecture behavior;