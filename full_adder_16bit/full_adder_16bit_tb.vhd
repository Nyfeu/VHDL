
-- Arquivo de testes (testbench) para o Full Adder (16 bits)

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

    -- 0x0001 + 0x0002 + 0x0 = 0x0003 (3)
    a <= x"0001";
    b <= x"0002";
    carry_in <= '0';
    wait for 1 ns;

    -- 0x0001 + 0x0002 + 0x1 = 0x0004 (4)
    a <= x"0001";
    b <= x"0002";
    carry_in <= '1';
    wait for 1 ns;

    -- 0xFFFF + 0x0001 + 0x0 = 0x0000 (0) c/ c_out = 1
    a <= x"FFFF";
    b <= x"0001";
    carry_in <= '0';
    wait for 1 ns;

    -- 0xFFFF + 0xFFFF + 0x0 = 0xFFFE (65534) c/ c_out = 1
    a <= x"FFFF";
    b <= x"FFFF";
    carry_in <= '0';
    wait for 1 ns;

    -- 0x9999 + 0x6666 + 0x0 = 0xFFFF (65535)
    a <= x"9999";
    b <= x"6666";
    carry_in <= '0';
    wait for 1 ns;

    -- 0x9999 + 0x6666 + 0x1 = 0x0 (0) c/ c_out = 1
    a <= x"9999";
    b <= x"6666";
    carry_in <= '1';
    wait for 1 ns;

    -- 0x0F0F + 0xF0F0 + 0x0 = 0xFFFF (65535)
    a <= x"0F0F";
    b <= x"F0F0";
    carry_in <= '0';
    wait for 1 ns;

    -- 0x0F0F + 0xF0F0 + 0x1 = 0x0000 (0) c/ c_out = 1
    a <= x"0F0F";
    b <= x"F0F0";
    carry_in <= '1';
    wait for 1 ns;

    -- 0x7FFF + 0x0001 + 0x0 = 0x8000 (32768) c/ c_out = 0
    a <= x"7FFF";
    b <= x"0001";
    carry_in <= '0';
    wait for 1 ns;

    -- 0x8000 + 0x8000 + 0x0 = 0x0 (0) c/ c_out = 1
    a <= x"8000";
    b <= x"8000";
    carry_in <= '0';
    wait for 1 ns;

    wait;

  end process;

end architecture teste;
