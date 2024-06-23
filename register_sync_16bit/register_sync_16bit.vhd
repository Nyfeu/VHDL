-- Descrição de Hardware (VHDL) de um Registrador Síncrono 16 bits c/ CLEAR e PRESET
--
--                  __________
--      not(PR) >--|          |
--      not(CL) >--| register |-->      Q (16 bits)
--      data_in >--|  16 bits |--> not(Q) (16 bits)
--       enable >--|          |
--          CLK >--|__________|
--
--
-- AUTOR: André Solano F. R. Maiolini
-- DATA: 23/06/2024

--| Libraries |--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Register |---------------------------------------------------------------------------

entity register_sync_16bit is
    port (
        data_in   : in  std_logic_vector(15 downto 0);  -- Dados de entrada
        enable    : in  std_logic;                      -- Sinal de habilitação
        PR, CL    : in  std_logic;                      -- Sinais de controle assíncronos 
        CLK       : in  std_logic;                      -- Sinal de clock
        Q, not_Q  : out std_logic_vector(15 downto 0)   -- Dados de saída
    );
end entity register_sync_16bit;

--| Lógica |------------------------------------------------------------------------------

architecture main of register_sync_16bit is

    signal q_reg : std_logic_vector(15 downto 0);

begin

    process (CLK, PR, CL)
    begin
        if PR = '0' then
            q_reg <= x"FFFF";
        elsif CL = '0' then
            q_reg <= x"0000";
        elsif falling_edge(CLK) then
            if enable = '1' then
                q_reg <= data_in;
            end if;
        end if;
    end process;

    Q <= q_reg;
    not_Q <= not(q_reg);

end architecture main;
