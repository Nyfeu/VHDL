
-- Arquivo de testes (testbench) para o AND gate

--| Libraries |-----------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |------------------------------------

entity decoder_tb is
end entity decoder_tb;

--| Lógica - Testbench |--------------------------

architecture teste of decoder_tb is
  
  signal op_code           : std_logic_vector(3 downto 0);
  signal sel_ula_src       : std_logic;
  signal WR_RAM            : std_logic;
  signal WR_PC             : std_logic;
  signal WR_ACC            : std_logic;
  signal sel_acc_src_1     : std_logic;
  signal sel_acc_src_0     : std_logic;
  signal op_ula            : std_logic;

  component decoder is
    port(
      op_code       : in  std_logic_vector(3 downto 0);
      sel_ula_src   : out std_logic;
      WR_RAM        : out std_logic;
      WR_PC         : out std_logic;
      WR_ACC        : out std_logic;
      sel_acc_src_1 : out std_logic;
      sel_acc_src_0 : out std_logic;
      op_ula        : out std_logic
    );
  end component decoder;

begin
  
  X: decoder port map (
    op_code, sel_ula_src, WR_RAM, WR_PC, WR_ACC, sel_acc_src_1, sel_acc_src_0, op_ula
  ); 

  process
  begin
    
    op_code <= x"0";
    wait for 1 ns;

    op_code <= x"1";
    wait for 1 ns;

    op_code <= x"2";
    wait for 1 ns;

    op_code <= x"3";
    wait for 1 ns;
    
    op_code <= x"4";
    wait for 1 ns;

    op_code <= x"5";
    wait for 1 ns;

    op_code <= x"6";
    wait for 1 ns;

    op_code <= x"7";
    wait for 1 ns;

    wait;

  end process;

end architecture teste;
