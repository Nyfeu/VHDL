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

    signal clk    : std_logic;
    signal clk1   : std_logic_vector(2 downto 0);
    signal MSB    : std_logic_vector(3 downto 0) := "0000";
    signal ISB    : std_logic_vector(3 downto 0) := "0000";
    signal LSB    : std_logic_vector(3 downto 0) := "0000";
    signal Dado   : std_logic_vector(6 downto 0);
    signal Sel1   : std_logic;
    signal Sel2   : std_logic;
    signal Sel3   : std_logic;
    signal enable : std_logic := '1';

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
            MSB  : in  std_logic_vector(3 downto 0);
            ISB  : in  std_logic_vector(3 downto 0);
            LSB  : in  std_logic_vector(3 downto 0);
            Dado : out std_logic_vector(6 downto 0);  -- Segmentos a b c d e f g
            Sel1 : out std_logic;
            Sel2 : out std_logic;
            Sel3 : out std_logic;
            clk  : in  std_logic
        );
    end component display_mux;

begin

    -- Instancia generic_timer
    TIMER: generic_timer
        generic map (
            clk_freq => n  -- Mapeia a constante 'n' para o parâmetro genérico
        )
        port map (
            clk => clk,
            enable => enable
        );

    -- Instancia display_mux
    MUX: display_mux
        port map(
            MSB  => MSB,
            ISB  => ISB,
            LSB  => LSB,
            Dado => Dado,
            Sel1 => Sel1,
            Sel2 => Sel2,
            Sel3 => Sel3,
            clk  => clk
        );

    -- Processo para estímulo de enable
    process
    begin
        -- Teste básico
        MSB <= "1101";  -- Defina os valores de teste
        ISB <= "0110";
        LSB <= "1001";

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
