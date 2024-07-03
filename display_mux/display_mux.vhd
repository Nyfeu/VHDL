library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity display_mux is
    generic(
        chavear : integer := 5        -- Valor para para chavear entre displays (5 ciclos de clock)
    );
    Port ( 
        data_in  : in  std_logic_vector (31 downto 0);
        data_out : out std_logic_vector (6 downto 0);  --segmentos a b c d e f g
        sel      : out std_logic_vector (7 downto 0);
        clk      : in  std_logic
    );
end display_mux;

architecture Behavioral of display_mux is

    signal contador_aux : integer range 0 to 7 := 0;      -- Contador 0 a 7 para selecionar MUX e DECODER
    signal output_mux   : std_logic_vector (3 downto 0); 
    signal valor_y      : integer range 0 to 15;          -- Dado a decodificar

begin

    CONTADOR: process(clk)

        variable conta_1ms : integer range 0 to chavear-1 := 0;  -- Contador para 1ms
        variable cnt       : integer range 0 to 7 := 0;          -- Contador para multiplexação

    begin

        if (rising_edge(clk)) then

            if (conta_1ms = chavear-1) then

                conta_1ms := 0;

                if (cnt = 7) then

                    cnt := 0;

                else 

                    cnt := cnt + 1;

                end if;

            else

                conta_1ms := conta_1ms + 1;

            end if;

        end if;

        contador_aux <= cnt;

    end process CONTADOR;

    with contador_aux select
        output_mux <= data_in(31 downto 28) when 0,
                      data_in(27 downto 24) when 1,
                      data_in(23 downto 20) when 2,
                      data_in(19 downto 16) when 3,
                      data_in(15 downto 12) when 4,
                      data_in(11 downto 8 ) when 5,
                      data_in(7  downto 4 ) when 6,
                      data_in(3  downto 0 ) when 7;

    valor_y <= to_integer(unsigned(output_mux));-- transforma vetor para não sinalizado e depois para inteiro

    -- Decoder 2 -> 3
    DECODER: process (contador_aux)
    begin

        sel <= (others => '1');
        
        case contador_aux is

            when 0 => sel(0) <= '0';               -- Ativa o display 0
            when 1 => sel(1) <= '0';               -- Ativa o display 1
            when 2 => sel(2) <= '0';               -- Ativa o display 2
            when 3 => sel(3) <= '0';               -- Ativa o display 3
            when 4 => sel(4) <= '0';               -- Ativa o display 4
            when 5 => sel(5) <= '0';               -- Ativa o display 5
            when 6 => sel(6) <= '0';               -- Ativa o display 6
            when 7 => sel(7) <= '0';               -- Ativa o display 7
            when others => sel <= (others => '1'); -- Não faz nada para valores não esperados

        end case;

    end process DECODER;

    -- Decoder BCD para 7 segmentos
    WITH valor_y SELECT
        data_out <= "0000001" WHEN 0,  -- 0
                    "1001111" WHEN 1,  -- 1
                    "0010010" WHEN 2,  -- 2
                    "0000110" WHEN 3,  -- 3
                    "1001100" WHEN 4,  -- 4
                    "0100100" WHEN 5,  -- 5
                    "0100000" WHEN 6,  -- 6
                    "0001111" WHEN 7,  -- 7
                    "0000000" WHEN 8,  -- 8
                    "0001100" WHEN 9,  -- 9
                    "0001000" WHEN 10, -- A
                    "1100000" WHEN 11, -- b
                    "0110001" WHEN 12, -- C
                    "1000010" WHEN 13, -- d
                    "0010000" WHEN 14, -- e
                    "0111000" WHEN 15; -- F

end architecture Behavioral;
