
-- Arquivo de testes (testbench) para o Full Adder

--| Libraries |-----------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |------------------------------------

entity full_subber_tb is
end entity full_subber_tb;

--| Lógica - Testbench |--------------------------

architecture teste of full_subber_tb is
  
  signal a     : std_logic;
  signal b     : std_logic;
  signal b_in  : std_logic;
  signal dif   : std_logic;
  signal b_out : std_logic;

  component full_subber is
    port (
        a, b, b_in : in std_logic;
        dif, b_out : out std_logic
    );
  end component full_subber;

begin
  
  X: full_subber port map (
    a, b, b_in, dif, b_out
  ); 

  process
  begin
    a <= 'X';
    b <= 'X';
    b_in <= 'X';
    wait for 1 ns;

    a <= '0';
    b <= '0';
    b_in <= '0';
    wait for 1 ns;

    a <= '0';
    b <= '0';
    b_in <= '1';
    wait for 1 ns;

    a <= '0';
    b <= '1';
    b_in <= '0';
    wait for 1 ns;

    a <= '0';
    b <= '1';
    b_in <= '1';
    wait for 1 ns;

    a <= '1';
    b <= '0';
    b_in <= '0';
    wait for 1 ns;

    a <= '1';
    b <= '0';
    b_in <= '1';
    wait for 1 ns;

    a <= '1';
    b <= '1';
    b_in <= '0';
    wait for 1 ns;

    a <= '1';
    b <= '1';
    b_in <= '1';
    wait for 1 ns;

    wait;

  end process;

end architecture teste;
