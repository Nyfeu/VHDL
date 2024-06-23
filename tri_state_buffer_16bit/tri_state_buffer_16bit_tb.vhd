
-- Arquivo de testes (testbench) para o Tri-State Buffer

--| Libraries |------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |-------------------------------------------

entity tri_state_buffer_16bit_tb is
end entity tri_state_buffer_16bit_tb;

--| Lógica - Testbench |---------------------------------

architecture teste of tri_state_buffer_16bit_tb is
  
  signal data_in  : std_logic_vector(15 downto 0);
  signal data_out : std_logic_vector(15 downto 0);
  signal enable   : std_logic;

  component tri_state_buffer_16bit is
    port (
        data_in   : in  std_logic_vector(15 downto 0);  -- Dados de entrada
        enable    : in  std_logic;                      -- Sinal de habilitação
        data_out  : out std_logic_vector(15 downto 0)   -- Dados de saída
    );
  end component tri_state_buffer_16bit;

begin

    TRI: tri_state_buffer_16bit port map (
        data_in => data_in,
        enable => enable,
        data_out => data_out
    );
  
    process 
    begin

        data_in <= x"FFFF";
        enable <= '0';
        wait for 1 ns;
        enable <= '1';
        wait for 1 ns;

        data_in <= x"0000";
        enable <= '0';
        wait for 1 ns;
        enable <= '1';
        wait for 1 ns;

        data_in <= x"0042";
        enable <= '0';
        wait for 1 ns;
        enable <= '1';
        wait for 1 ns;

        wait;

    end process;

end architecture teste;
