
-- Arquivo de testes (testbench) para Contador Genérico

--| Libraries |------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Entidade |-------------------------------------------

entity generic_counter_tb is

    constant n : integer := 4;

end entity generic_counter_tb;

--| Lógica - Testbench |---------------------------------

architecture teste of generic_counter_tb is
  
  signal MR    : std_logic;
  signal clk   : std_logic := '0';
  signal count : std_logic_vector(n-1 downto 0);

begin

    COUNTER: entity work.generic_counter generic map(n) port map (
        clk, MR, count
    );
  
    -- Gerador de clock
    clk_process: process
    begin
        while now < 20 ns loop
            clk <= not clk;
            wait for 2 ns;
        end loop;
        wait;
    end process clk_process;

    -- Master Reset
    master_reset: process
    begin

        MR <= '0';
        wait for 1 ns;
        MR <= '1';
        wait for 14 ns;
        MR <= '0';
        wait for 2 ns;
        MR <= '1';
        wait;

    end process master_reset;

end architecture teste;
