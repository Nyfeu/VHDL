
-- Arquivo de testes (testbench) para o Full Adder (4 bits)

--| Libraries |---------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |----------------------------------------------

entity full_adder_16bit_tb is
end entity full_adder_16bit_tb;

--| Lógica - Testbench |------------------------------------

architecture teste of full_adder_16bit_tb is
  
  signal a         : std_logic_vector(15 downto 0);
  signal b         : std_logic_vector(15 downto 0);
  signal carry_in  : std_logic;
  signal sum       : std_logic_vector(15 downto 0);
  signal carry_out : std_logic;

  component full_adder_16bit is
    port (
        a, b      : in  std_logic_vector(15 downto 0);
        carry_in  : in  std_logic;
        sum       : out std_logic_vector(15 downto 0);
        carry_out : out std_logic
    );
  end component full_adder_16bit;

begin
  
  X: full_adder_16bit port map (
    a, b, carry_in, sum, carry_out
  ); 

  process
  begin

    -- 0000000000000001 + 0000000000000010 + 0 = 0000000000000011 (3)
    a <= "0000000000000001";
    b <= "0000000000000010";
    carry_in <= '0';
    wait for 1 ns;

    -- 0000000000000001 + 0000000000000010 + 1 = 0000000000000100 (4)
    a <= "0000000000000001";
    b <= "0000000000000010";
    carry_in <= '1';
    wait for 1 ns;

    -- 1111111111111111 + 0000000000000001 + 0 = 0000000000000000 (0) com carry_out = 1
    a <= "1111111111111111";
    b <= "0000000000000001";
    carry_in <= '0';
    wait for 1 ns;

    -- 1111111111111111 + 1111111111111111 + 0 = 1111111111111110 (65534) com carry_out = 1
    a <= "1111111111111111";
    b <= "1111111111111111";
    carry_in <= '0';
    wait for 1 ns;

    -- 1001100110011001 + 0110011001100110 + 0 = 1111111111111111 (65535)
    a <= "1001100110011001";
    b <= "0110011001100110";
    carry_in <= '0';
    wait for 1 ns;

    -- 1001100110011001 + 0110011001100110 + 1 = 0000000000000000 (0) com carry_out = 1
    a <= "1001100110011001";
    b <= "0110011001100110";
    carry_in <= '1';
    wait for 1 ns;

    -- 0000111100001111 + 1111000011110000 + 0 = 1111111111111111 (65535)
    a <= "0000111100001111";
    b <= "1111000011110000";
    carry_in <= '0';
    wait for 1 ns;

    -- 0000111100001111 + 1111000011110000 + 1 = 0000000000000000 (0) com carry_out = 1
    a <= "0000111100001111";
    b <= "1111000011110000";
    carry_in <= '1';
    wait for 1 ns;

    -- Teste de overflow: 0111111111111111 + 0000000000000001 + 0 = 1000000000000000 (32768) com carry_out = 0
    a <= "0111111111111111";
    b <= "0000000000000001";
    carry_in <= '0';
    wait for 1 ns;

    -- Teste de overflow: 1000000000000000 + 1000000000000000 + 0 = 0000000000000000 (0) com carry_out = 1
    a <= "1000000000000000";
    b <= "1000000000000000";
    carry_in <= '0';
    wait for 1 ns;

    wait;

  end process;

end architecture teste;
