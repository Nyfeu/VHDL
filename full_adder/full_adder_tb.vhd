
-- Arquivo de testes (testbench) para o Full Adder

--| Libraries |-----------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |------------------------------------

entity full_adder_tb is
end entity full_adder_tb;

--| Lógica - Testbench |--------------------------

architecture teste of full_adder_tb is
  
  signal a         : std_logic;
  signal b         : std_logic;
  signal carry_in  : std_logic;
  signal sum       : std_logic;
  signal carry_out : std_logic;

  component full_adder is
    port(
      a, b      : in  std_logic;
      carry_in  : in std_logic;
      sum       : out std_logic;
      carry_out : out std_logic
    );
  end component full_adder;

begin
  
  X: full_adder port map (
    a, b, carry_in, sum, carry_out
  ); 

  process
  begin
    a <= 'X';
    b <= 'X';
    carry_in <= 'X';
    wait for 1 ns;

    a <= '0';
    b <= '0';
    carry_in <= '0';
    wait for 1 ns;

    a <= '0';
    b <= '0';
    carry_in <= '1';
    wait for 1 ns;

    a <= '0';
    b <= '1';
    carry_in <= '0';
    wait for 1 ns;

    a <= '0';
    b <= '1';
    carry_in <= '1';
    wait for 1 ns;

    a <= '1';
    b <= '0';
    carry_in <= '0';
    wait for 1 ns;

    a <= '1';
    b <= '0';
    carry_in <= '1';
    wait for 1 ns;

    a <= '1';
    b <= '1';
    carry_in <= '0';
    wait for 1 ns;

    a <= '1';
    b <= '1';
    carry_in <= '1';
    wait for 1 ns;

    wait;

  end process;

end architecture teste;
