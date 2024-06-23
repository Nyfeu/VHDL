
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

    -- 0x1 + 0x2 + 0x0 = 0x3 (3)
    a <= x"1";
    b <= x"2";
    carry_in <= '0';
    wait for 1 ns;

    -- 0x1 + 0x2 + 0x1 = 0x4 (4)
    a <= x"1";
    b <= x"2";
    carry_in <= '1';
    wait for 1 ns;

    -- 0x7 + 0x8 + 0x0 = 0xF (15)
    a <= x"7";
    b <= x"8";
    carry_in <= '0';
    wait for 1 ns;

    -- 0x7 + 0x8 + 0x1 = 0x0 (0)
    a <= "0111";
    b <= "1000";
    carry_in <= '1';
    wait for 1 ns;

    wait;

  end process;

end architecture teste;
