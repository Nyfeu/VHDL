
-- Arquivo de testes (testbench) para o Half Adder

--| Libraries |-----------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |------------------------------------

entity half_adder_tb is
end entity half_adder_tb;

--| Lógica - Testbench |--------------------------

architecture teste of half_adder_tb is
  
  signal a     : std_logic;
  signal b     : std_logic;
  signal sum   : std_logic;
  signal carry : std_logic;

  component half_adder is
    port(
      a, b  : in  std_logic;
      sum   : out std_logic;
      carry : out std_logic
    );
  end component half_adder;

begin
  
  X: half_adder port map (
    a, b, sum, carry
  ); 

  process
  begin
    a <= 'X';
    b <= 'X';
    wait for 1 ns;

    a <= '0';
    b <= '0';
    wait for 1 ns;

    a <= '0';
    b <= '1';
    wait for 1 ns;

    a <= '1';
    b <= '0';
    wait for 1 ns;
    
    a <= '1';
    b <= '1';
    wait for 1 ns;

    wait;

  end process;

end architecture teste;
