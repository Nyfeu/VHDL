-- Arquivo de testes (testbench) para a ROM genérica

--| Libraries |------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--| Entidade |-------------------------------------------------------

entity generic_rom_tb is
end entity generic_rom_tb;

--| Lógica - Testbench |---------------------------------------------

architecture teste of generic_rom_tb is

    constant n : integer := 8;
    constant word : integer := 16;

    signal cs      : std_logic := '0';  -- Chip Selection (ativo em LOW)
    signal oe      : std_logic := '0';  -- Output Enable (ativo em LOW)
    signal addr    : std_logic_vector(n-1 downto 0) := (others => '0');  -- Endereço inicial
    signal data_out: std_logic_vector(word-1 downto 0);  -- Saída de dados da ROM

begin

    rom: entity work.generic_rom
        generic map (n, word)
        port map (cs, oe, addr, data_out);

    process
    begin

        -- Teste 1: Leitura em diferentes endereços
        cs <= '0';  -- Seleciona o chip (ativo em LOW)
        oe <= '0';  -- Habilita a saída (ativo em LOW)

        -- Leitura em diferentes endereços
        for i in 0 to 15 loop
            addr <= std_logic_vector(to_unsigned(i, n));
            wait for 10 ns;
        end loop;

        -- Teste 2: Alta impedância quando CS não está ativo
        cs <= '1';  -- Desativa o chip (HIGH)
        wait for 10 ns;

        -- Teste 3: Alta impedância quando OE não está ativo
        cs <= '0';  -- Seleciona o chip (ativo em LOW)
        oe <= '1';  -- Desabilita a saída (HIGH)
        wait for 10 ns;

        -- Teste 4: Estabilidade da saída em alta impedância com CS inativo
        cs <= '1';  -- Desativa o chip (HIGH)
        wait for 10 ns;

        -- Teste 5: Estabilidade da saída em alta impedância com OE ativo
        cs <= '0';  -- Seleciona o chip (ativo em LOW)
        oe <= '1';  -- Desabilita a saída (ativo em HIGH)
        wait for 10 ns;

        -- Teste 6: Estabilidade da saída em alta impedância com CS e OE inativos
        cs <= '1';  -- Desativa o chip (ativo em HIGH)
        oe <= '1';  -- Desabilita a saída (ativo em HIGH)
        wait for 10 ns;

        -- Teste 7: Leitura em diferentes endereços
        cs <= '0';  -- Seleciona o chip (ativo em LOW)
        oe <= '0';  -- Habilita a saída (ativo em LOW)

        -- Leitura em diferentes endereços
        for i in 0 to 15 loop
            addr <= std_logic_vector(to_unsigned(i, n));
            wait for 10 ns;
        end loop;

        -- Fim do testbench
        wait;

    end process;

end architecture teste;
