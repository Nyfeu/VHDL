library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity display_mux is
    generic(
        chavear : integer := 5        -- Valor para para chavear entre displays (5 ciclos de clock)
    );
    Port ( 
        MSB  : in  STD_LOGIC_VECTOR (3 downto 0);
        ISB  : in  STD_LOGIC_VECTOR (3 downto 0);
        LSB  : in  STD_LOGIC_VECTOR (3 downto 0);
        Dado : out STD_LOGIC_VECTOR (6 downto 0);  --segmentos a b c d e f g
        Sel1 : out STD_LOGIC;
        Sel2 : out STD_LOGIC;
        Sel3 : out STD_LOGIC;
        clk  : in  STD_LOGIC
    );
end display_mux;

architecture Behavioral of display_mux is

    signal contador_aux : integer range 0 to 2 := 0; -- Contador 0 a 2 para selecionar MUX e DECODER
    signal output_mux: std_logic_vector (3 downto 0);
    signal valor_y : integer range 0 to 15;--dado a decodificar

begin

    CONTADOR: process(clk)

        variable conta_1ms : integer range 0 to chavear-1 := 0;  -- Contador para 1ms
        variable cnt       : integer range 0 to 2 := 0;          -- Contador para multiplexação

    begin

        if (rising_edge(clk)) then

            if (conta_1ms = chavear-1) then

                conta_1ms := 0;

                if (cnt = 2) then

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
        output_mux <= LSB when 0,
                      ISB when 1,
                      MSB when 2;

    valor_y <= to_integer(unsigned(output_mux));-- transforma vetor para não sinalizado e depois para inteiro

    -- Decoder 2 -> 3
    DECODER: process (contador_aux)
    begin
        case contador_aux is
            when 0 =>
                Sel1 <= '0';  -- Seleciona LSB
                Sel2 <= '1';
                Sel3 <= '1';
            when 1 =>
                Sel1 <= '1';
                Sel2 <= '0';  -- Seleciona ISB
                Sel3 <= '1';
            when 2 =>
                Sel1 <= '1';
                Sel2 <= '1';
                Sel3 <= '0';  -- Seleciona MSB
            when others =>
                Sel1 <= '1';  -- Não seleciona nenhum display
                Sel2 <= '1';
                Sel3 <= '1';
        end case;
    end process DECODER;

    -- Decoder BCD para 7 segmentos
    WITH valor_y SELECT
        Dado <= "0000001" WHEN 0,  -- 0
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
