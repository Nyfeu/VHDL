-- Arquivo de testes (testbench) para display_mux

--| Libraries |------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--| Entidade |-------------------------------------------------------

entity display_mux_tb is
end entity display_mux_tb;

--| Lógica - Testbench |---------------------------------------------

architecture teste of display_mux_tb is
  
    constant n    : integer := 2000;  -- Valor para o clk_freq

    signal clk      : std_logic;
    signal data_in  : std_logic_vector(31 downto 0);
    signal data_out : std_logic_vector(6  downto 0);
    signal sel      : std_logic_vector(7  downto 0);
    signal enable   : std_logic := '1';

    component generic_timer
        generic (
            clk_freq : integer
        );
        port (
            clk    : out std_logic;
            enable : in  std_logic
        );
    end component;

    component display_mux
        port ( 
            data_in  : in  std_logic_vector (31 downto 0) := x"00000000";
            data_out : out std_logic_vector (6 downto 0);  --segmentos a b c d e f g
            sel      : out std_logic_vector (7 downto 0);
            clk      : in  std_logic
        );
    end component display_mux;

begin

    -- Instancia generic_timer
    TIMER: generic_timer
        generic map (
            clk_freq => n  -- Mapeia a constante 'n' para o parâmetro genérico
        )
        port map (
            clk    => clk,
            enable => enable
        );

    -- Instancia display_mux
    MUX: display_mux
        port map(
            data_in  => data_in,
            data_out => data_out,
            sel      => sel,
            clk      => clk
        );

    -- Processo para estímulo de enable
    process
    begin

        -- Teste básico
        data_in <= x"12345678";

        -- Espera para ver o efeito
        wait for 50 ns;
        enable <= '0';
        wait for 10 ns;
        enable <= '1';
        wait for 50 ns;

        -- Encerrar simulação
        assert false report "Testbench completed" severity note;
        wait;

    end process;

end architecture teste;
