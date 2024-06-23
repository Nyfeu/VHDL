
-- Arquivo de testes (testbench) para o Full Adder

--| Libraries |-----------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |------------------------------------

entity full_subber_4bit_tb is
end entity full_subber_4bit_tb;

--| Lógica - Testbench |--------------------------

architecture teste of full_subber_4bit_tb is
  
  signal a     : std_logic_vector(3 downto 0);
  signal b     : std_logic_vector(3 downto 0);
  signal b_in  : std_logic;
  signal dif   : std_logic_vector(3 downto 0);
  signal b_out : std_logic;

  component full_subber_4bit is
    port (
        a, b  : in  std_logic_vector(3 downto 0);
        b_in  : in  std_logic;  
        dif   : out std_logic_vector(3 downto 0); 
        b_out : out std_logic
    );
  end component full_subber_4bit;

begin
  
  X: full_subber_4bit port map (
    a, b, b_in, dif, b_out
  ); 

  process
  begin
    
    -- 0011 - 0001 = 0010 (2)
    a <= x"3";
    b <= x"1";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x2, b_out = 0

    -- 0010 - 0001 = 0001 (1)
    a <= x"2";
    b <= x"1";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x1, b_out = 0

    -- 1000 - 0100 = 0100 (4)
    a <= x"8";
    b <= x"4";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x4, b_out = 0

    -- 0110 - 0011 = 0011 (3)
    a <= x"6";
    b <= x"3";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x3, b_out = 0

    -- 0000 - 0001 com borrow in = 1110 (-2)
    a <= x"0";
    b <= x"1";
    b_in <= '1';
    wait for 1 ns;
    -- Esperado: dif = 0xE, b_out = 1

    -- 0101 - 0010 com borrow in = 0010 (3)
    a <= x"5";
    b <= x"2";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x3, b_out = 0

    -- 0101 - 0011 com borrow in = 0010 (2)
    a <= x"5";
    b <= x"3";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x2, b_out = 0

    -- 1001 - 0110 com borrow in = 0010 (2)
    a <= x"9";
    b <= x"6";
    b_in <= '1';
    wait for 1 ns;
    -- Esperado: dif = 0x2, b_out = 0

    -- 0011 - 0101 com borrow in = 1110 (-2)
    a <= x"3";
    b <= x"5";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0xE, b_out = 1

    -- 0000 - 0000 com borrow in = 0000 (0)
    a <= x"0";
    b <= x"0";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x0, b_out = 0

    wait;

  end process;

end architecture teste;
