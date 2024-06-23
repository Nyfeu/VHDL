library ieee;
use ieee.std_logic_1164.all;

entity tri_state_buffer_16bit is
    port (
        data_in   : in  std_logic_vector(15 downto 0);  -- Dados de entrada
        enable    : in  std_logic;                     -- Sinal de habilitação
        data_out  : out std_logic_vector(15 downto 0)          -- Dados de saída
    );
end entity tri_state_buffer_16bit;

architecture main of tri_state_buffer_16bit is
begin

    -- Se habilitado, a saída segue a entrada, caso contrário a saída é alta impedância
    data_out <= data_in when enable = '1' else x"ZZZZ";

end architecture main;
