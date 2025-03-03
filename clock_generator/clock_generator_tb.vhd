
-- Arquivo de testes (testbench) para Timer de Freq. Genérica (MHz)

--| Libraries |------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |-------------------------------------------------------

entity clock_generator_tb is

    constant n : integer := 2000;

end entity clock_generator_tb;

--| Lógica - Testbench |---------------------------------------------

architecture teste of clock_generator_tb is
  
  signal clk : std_logic;

  signal enable : std_logic := '1';

  component clock_generator
    generic (
      clk_freq : integer
    );
    port (
      clk    : out std_logic;
      enable : in  std_logic
    );
  end component;

begin

    TIMER: entity work.clock_generator 
        generic map(n) 
        port map (clk, enable);
  
    process
    begin
        
        wait for 10 ns;
        enable <= '0';
        wait for 10 ns;

        wait;

    end process;

end architecture teste;
