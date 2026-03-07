library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dlx_constants.all;

entity DlxMemory is
    generic (
        ADDR_WIDTH : POSITIVE := 10;
        DATA_WIDTH : POSITIVE := 32;
        INS_WIDTH : POSITIVE := 32
    );
    port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        -- From Execute stage
        ADDR_IN : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        INS_IN : in STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        JUMP_FLAG : in STD_LOGIC;
        ALU_RESULT : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        STORE_VAL : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        -- No register outputs
        JUMP_OUT : out STD_LOGIC;
        JUMP_ADDRESS : out STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        -- Registered outputs
        ADDR_OUT : out STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
        INS_OUT : out STD_LOGIC_VECTOR(INS_WIDTH-1 downto 0);
        DATA_OUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        ALU_OUTPUT : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
    );
end entity DlxMemory;

architecture behavior of DlxMemory is
    signal wr_en : STD_LOGIC;
    signal op_code : STD_LOGIC_VECTOR(5 downto 0);
    signal alu_addr : STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
begin
    first : process (ALU_RESULT, JUMP_FLAG, INS_IN)
    begin
        -- Get the lowest 10 bits from the ALU output and store in a signal
        alu_addr <= ALU_RESULT(ADDR_WIDTH-1 downto 0);

        -- Init 0 delay ouputs to fetch stage
        JUMP_OUT <= JUMP_FLAG;

        -- Init the op code value from the instruction 
        op_code <= INS_IN(INS_WIDTH-1 downto INS_WIDTH-6);
    end process;

    second : process(op_code, alu_addr)
    begin
        JUMP_ADDRESS <= alu_addr;
        if (op_code = SW) then
            wr_en <= '1';
        else
            wr_en <= '0';
        end if;
    end process;

    ram : entity work.DataMemory
        port map(
            address => alu_addr,
            clock => CLK,
            data => STORE_VAL,
            wren => wr_en,
            q => DATA_OUT
        );
    
    update : process(CLK, RST)
    begin
        if RST = '1' then
            ADDR_OUT <= (others => '0');
            INS_OUT <= (others => '0');
            ALU_OUTPUT <= (others => '0');
        elsif rising_edge(CLK) then
            ADDR_OUT <= ADDR_IN;
            INS_OUT <= INS_IN;
            ALU_OUTPUT <= ALU_RESULT;
        end if;
    end process;

end architecture behavior;
