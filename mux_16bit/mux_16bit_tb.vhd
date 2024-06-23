
-- Arquivo de testes (testbench) para o Tri-State Buffer

--| Libraries |------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |-------------------------------------------

entity mux_16bit_tb is
end entity mux_16bit_tb;

--| Lógica - Testbench |---------------------------------

architecture teste of mux_16bit_tb is
  
  signal data_in_1 : std_logic_vector(15 downto 0);
  signal data_in_2 : std_logic_vector(15 downto 0);
  signal data_out  : std_logic_vector(15 downto 0);
  signal sel       : std_logic;

  component mux_16bit is
    port (
        data_in_1 : in  std_logic_vector(15 downto 0);  -- Dados de entrada 1
        data_in_2 : in  std_logic_vector(15 downto 0);  -- Dados de entrada 2
        sel       : in  std_logic;                      -- Sinal de habilitação
        data_out  : out std_logic_vector(15 downto 0)   -- Dados de saída
    );
  end component mux_16bit;

begin

    TRI: mux_16bit port map (
        data_in_1, data_in_2, sel, data_out
    );
  
    process 
    begin

        data_in_1 <= x"FFFF";
        data_in_2 <= x"0000";
        sel <= '0';
        wait for 1 ns;
        sel <= '1';
        wait for 1 ns;

        data_in_1 <= x"0042";
        data_in_2 <= x"4200";
        sel <= '0';
        wait for 1 ns;
        sel <= '1';
        wait for 1 ns;

        wait;

    end process;

end architecture teste;
