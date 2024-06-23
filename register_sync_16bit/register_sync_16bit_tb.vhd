
-- Arquivo de testes (testbench) para o Registrador 16 bits

--| Libraries |------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |-------------------------------------------

entity register_sync_16bit_tb is
end entity register_sync_16bit_tb;

--| Lógica - Testbench |---------------------------------

architecture teste of register_sync_16bit_tb is
  
  signal data_in  : std_logic_vector(15 downto 0);
  signal enable   : std_logic;
  signal MR       : std_logic;
  signal CLK      : std_logic := '0';
  signal data_out : std_logic_vector(15 downto 0);

  component register_sync_16bit is
    port (
        data_in   : in  std_logic_vector(15 downto 0);  -- Dados de entrada
        enable    : in  std_logic;                      -- Sinal de habilitação
        MR        : in  std_logic;                      -- Sinal de master-reset
        CLK       : in  std_logic;                      -- Sinal de clock
        data_out  : out std_logic_vector(15 downto 0)   -- Dados de saída
    );
  end component register_sync_16bit;

begin

    REG: register_sync_16bit port map (
        data_in, enable, MR, CLK, data_out
    );
  
    -- Gerador de clock
    clk_process: process
    begin
        while now < 20 ns loop
            clk <= '0';
            wait for 2 ns;
            clk <= '1';
            wait for 2 ns;
        end loop;
        wait;
    end process clk_process;

    process
    begin

        -- Definindo entradas de controle assíncronas
        MR <= '1';

        -- Test 1: enable = 0
        enable <= '0';
        data_in <= x"AAAA";
        wait for 3 ns;
        
        -- Test 2: enable = 1
        enable <= '1';
        data_in <= x"1234";
        wait for 3 ns;
        
        -- Test 3: enable = 1
        data_in <= x"5678";
        wait for 3 ns;
        
        -- Test 4: enable = 0
        enable <= '0';
        data_in <= x"9ABC";
        wait for 3 ns;

        -- Test 5: enable = 1 (MR)
        enable <= '0';
        MR <= '0';
        data_in <= x"9ABC";
        wait for 3 ns;
        MR <= '1';

        wait;

    end process;

end architecture teste;
