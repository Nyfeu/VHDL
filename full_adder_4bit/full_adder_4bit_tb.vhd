
-- Arquivo de testes (testbench) para o Full Adder (4 bits)

--| Libraries |---------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |----------------------------------------------

entity full_adder_4bit_tb is
end entity full_adder_4bit_tb;

--| Lógica - Testbench |------------------------------------

architecture teste of full_adder_4bit_tb is
  
  signal a         : std_logic_vector(3 downto 0);
  signal b         : std_logic_vector(3 downto 0);
  signal carry_in  : std_logic;
  signal sum       : std_logic_vector(3 downto 0);
  signal carry_out : std_logic;

  component full_adder_4bit is
    port (
        a, b      : in  std_logic_vector(3 downto 0);
        carry_in  : in  std_logic;
        sum       : out std_logic_vector(3 downto 0);
        carry_out : out std_logic
    );
  end component full_adder_4bit;

begin
  
  X: full_adder_4bit port map (
    a, b, carry_in, sum, carry_out
  ); 

  process
  begin

    -- 0001 + 0010 + 0000 = 0011 (3)
    a <= "0001";
    b <= "0010";
    carry_in <= '0';
    wait for 1 ns;

    -- 0001 + 0010 + 0001 = 0100 (4)
    a <= "0001";
    b <= "0010";
    carry_in <= '1';
    wait for 1 ns;

    -- 0111 + 1000 + 0000 = 1111 (15)
    a <= "0111";
    b <= "1000";
    carry_in <= '0';
    wait for 1 ns;

    -- 0111 + 1000 + 0001 = 0000 (0)
    a <= "0111";
    b <= "1000";
    carry_in <= '1';
    wait for 1 ns;

    wait;

  end process;

end architecture teste;
