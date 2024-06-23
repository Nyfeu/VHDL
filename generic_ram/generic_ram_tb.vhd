-- Arquivo de testes (testbench) para a RAM genérica

--| Libraries |------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--| Entidade |-------------------------------------------------------

entity generic_ram_tb is
end entity generic_ram_tb;

--| Lógica - Testbench |---------------------------------------------

architecture teste of generic_ram_tb is

    constant n : integer := 8;
    constant word : integer := 16;

    signal we      : std_logic;
    signal oe      : std_logic;
    signal ME      : std_logic;
    signal addr    : std_logic_vector(n-1 downto 0);
    signal data_in : std_logic_vector(word-1 downto 0);
    signal data_out: std_logic_vector(word-1 downto 0);

begin

    RAM: entity work.generic_ram
        generic map (
            n => n,
            word => word
        )
        port map (
            we => we,
            oe => oe,
            ME => ME,
            addr => addr,
            data_in => data_in,
            data_out => data_out
        );

    process
    begin

        -- Inicialização
        we <= '1';  -- Desabilitar escrita
        oe <= '0';  -- Desabilitar leitura
        ME <= '1';  -- Habilitar memória
        addr <= (others => '0');
        data_in <= (others => '0');
        wait for 10 ns;

        -- Teste de Escrita 1
        we <= '0';  -- Habilitar escrita
        addr <= x"01";
        data_in <= x"1234";
        wait for 10 ns;

        -- Teste de Escrita 2
        addr <= x"02";
        data_in <= x"5678";
        wait for 10 ns;

        -- Teste de Leitura 1
        we <= '1';  -- Desabilitar escrita
        oe <= '1';  -- Habilitar leitura
        addr <= x"01";
        wait for 10 ns;
        
        -- Teste de Leitura 2
        addr <= x"02";
        wait for 10 ns;

        -- Teste de Escrita com ME desabilitado
        ME <= '0';  -- Desabilitar memória
        we <= '0';  -- Habilitar escrita
        oe <= '0';  -- Desabilitar leitura
        addr <= x"01";
        data_in <= x"0042";
        wait for 10 ns;


        -- Teste de Leitura com ME desabilitado
        ME <= '0';  -- Desabilitar memória
        we <= '1';  -- Desabilitar escrita
        oe <= '1';  -- Habilitar leitura
        addr <= x"01";
        wait for 10 ns;

        -- Teste de Leitura 3
        ME <= '1';  -- Habilitar memória
        addr <= x"01";
        wait for 10 ns;

        -- Finalizar simulação
        wait;

    end process;

end architecture teste;
