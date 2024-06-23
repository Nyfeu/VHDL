
-- Arquivo de testes (testbench) para o Full Subber

--| Libraries |--------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |---------------------------------------

entity full_subber_16bit_tb is
end entity full_subber_16bit_tb;

--| Lógica - Testbench |-----------------------------

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
    
    -- 0x0003 - 0x0001 = 0x0002
    a <= x"0003";
    b <= x"0001";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x0002, b_out = 0

    -- 0xAAAA - 0x5555 = 0x5555
    a <= x"AAAA";
    b <= x"5555";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x5555, b_out = 0

    -- 0xF0F0 - 0x0F0F = 0xE1E1
    a <= x"F0F0";
    b <= x"0F0F";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0xE1E1, b_out = 0

    -- 0x0000 - 0x0001 com b_in = 1 => 0xFFFE
    a <= x"0000";
    b <= x"0001";
    b_in <= '1';
    wait for 1 ns;
    -- Esperado: dif = 0xFFFE, b_out = 1

    -- 0xFFFF - 0x0000 = 0xFFFF
    a <= x"FFFF";
    b <= x"0000";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0xFFFF, b_out = 0

    -- 0x8000 - 0x8000 com b_in = 0 => 0x0000
    a <= x"8000";
    b <= x"8000";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x0000, b_out = 0

    -- 0x7FFF - 0xFFFF com b_in = 0 => 0x8000
    a <= x"7FFF";
    b <= x"FFFF";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x8000, b_out = 1

    -- 0x0F0F - 0x0F0F com b_in = 0 => 0x0000
    a <= x"0F0F";
    b <= x"0F0F";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x0000, b_out = 0

    -- 0x8001 - 0x0001 com b_in = 0 => 0x8000
    a <= x"8001";
    b <= x"0001";
    b_in <= '0';
    wait for 1 ns;
    -- Esperado: dif = 0x8000, b_out = 0

    wait;

  end process;

end architecture teste;
