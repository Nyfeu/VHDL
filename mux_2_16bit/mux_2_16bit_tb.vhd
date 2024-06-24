
-- Arquivo de testes (testbench) para o Tri-State Buffer

--| Libraries |------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |-------------------------------------------

entity mux_2_16bit_tb is
end entity mux_2_16bit_tb;

--| Lógica - Testbench |---------------------------------

architecture teste of mux_2_16bit_tb is
  
  signal data_in_1 : std_logic_vector(15 downto 0);
  signal data_in_2 : std_logic_vector(15 downto 0);
  signal data_in_3 : std_logic_vector(15 downto 0);
  signal data_in_4 : std_logic_vector(15 downto 0);
  signal sel_1     : std_logic;
  signal sel_0     : std_logic;
  signal data_out  : std_logic_vector(15 downto 0);

  component mux_2_16bit is
    port (
        data_in_1   : in  std_logic_vector(15 downto 0);  -- Dados de entrada 1
        data_in_2   : in  std_logic_vector(15 downto 0);  -- Dados de entrada 2
        data_in_3   : in  std_logic_vector(15 downto 0);  -- Dados de entrada 3
        data_in_4   : in  std_logic_vector(15 downto 0);  -- Dados de entrada 4
        sel_1       : in  std_logic;                      -- Sinal de seleção 1
        sel_0       : in  std_logic;                      -- Sinal de seleção 2
        data_out    : out std_logic_vector(15 downto 0)   -- Dados de saída
    );
  end component mux_2_16bit;

begin

    TRI: mux_2_16bit port map (
        data_in_1, data_in_2, data_in_3, data_in_4, sel_1, sel_0, data_out
    );
  
    process 
    begin

        data_in_1 <= x"AAAA";
        data_in_2 <= x"BBBB";
        data_in_3 <= x"CCCC";
        data_in_4 <= x"DDDD";
        sel_1 <= '0';
        sel_0 <= '0';
        wait for 1 ns;
        
        sel_1 <= '0';
        sel_0 <= '1';
        wait for 1 ns;

        sel_1 <= '1';
        sel_0 <= '0';
        wait for 1 ns;

        sel_1 <= '1';
        sel_0 <= '1';
        wait for 1 ns;

        wait;

    end process;

end architecture teste;
