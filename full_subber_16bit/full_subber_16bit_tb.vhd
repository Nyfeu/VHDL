
-- Arquivo de testes (testbench) para o Full Adder

--| Libraries |-----------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |------------------------------------

entity full_subber_16bit_tb is
end entity full_subber_16bit_tb;

--| Lógica - Testbench |--------------------------

architecture teste of full_subber_16bit_tb is
  
  signal a     : std_logic_vector(15 downto 0);
  signal b     : std_logic_vector(15 downto 0);
  signal b_in  : std_logic;
  signal dif   : std_logic_vector(15 downto 0);
  signal b_out : std_logic;

  component full_subber_16bit is
    port (
        a, b  : in  std_logic_vector(15 downto 0);
        b_in  : in  std_logic;  
        dif   : out std_logic_vector(15 downto 0); 
        b_out : out std_logic
    );
  end component full_subber_16bit;

begin
  
  X: full_subber_16bit port map (
    a, b, b_in, dif, b_out
  ); 

  process
  begin
    
    -- 0000000000000011 - 0000000000000001 = 0000000000000010 (2)
    a <= "0000000000000011";
    b <= "0000000000000001";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0000000000000010, b_out = 0

    -- 1010101010101010 - 0101010101010101 = 0101010101010101 (21845)
    a <= "1010101010101010";
    b <= "0101010101010101";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0101010101010101, b_out = 0

    -- 1111000011110000 - 0000111100001111 = 1110000111100001 (61441)
    a <= "1111000011110000";
    b <= "0000111100001111";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 1110000111100001, b_out = 0

    -- 0000000000000000 - 0000000000000001 com borrow in = 1111111111111110 (-2)
    a <= "0000000000000000";
    b <= "0000000000000001";
    b_in <= '1';
    wait for 1 ns;
    -- Esperado: dif = 1111111111111110, b_out = 1

    -- 1111111111111111 - 0000000000000000 com borrow in = 1111111111111111 (65535)
    a <= "1111111111111111";
    b <= "0000000000000000";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 1111111111111111, b_out = 0

    -- 1000000000000000 - 1000000000000000 com borrow in = 0000000000000000 (0)
    a <= "1000000000000000";
    b <= "1000000000000000";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0000000000000000, b_out = 0

    -- 0111111111111111 - 1111111111111111 com borrow in = 1000000000000000 (-32768)
    a <= "0111111111111111";
    b <= "1111111111111111";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 1000000000000000, b_out = 1

    -- 0000111100001111 - 0000111100001111 com borrow in = 0000000000000000 (0)
    a <= "0000111100001111";
    b <= "0000111100001111";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0000000000000000, b_out = 0

    -- 1000000000000001 - 0000000000000001 com borrow in = 0111111111111111 (32767)
    a <= "1000000000000001";
    b <= "0000000000000001";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 1000000000000000, b_out = 0

    wait;

  end process;

end architecture teste;
