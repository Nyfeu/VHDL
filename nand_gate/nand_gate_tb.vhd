
-- Arquivo de testes (testbench) para o NAND gate

--| Libraries |-----------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |------------------------------------

entity nand_gate_tb is
end entity nand_gate_tb;

--| Lógica - Testbench |--------------------------

architecture teste of nand_gate_tb is
  
  signal a : std_logic;
  signal b : std_logic;
  signal z : std_logic;

  component nand_gate is
    port(
      a, b : in  std_logic;
      z    : out std_logic
    );
  end component nand_gate;

begin
  
  X: nand_gate port map (
    a, b, z
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
