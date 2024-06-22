
-- Descrição de Hardware (VHDL) de uma porta AND de duas entradas
--
--            _____				
--      a >--|     |          a | b | z
--           | AND |--> z    -----------
--      b >--|_____|          0 | 0 | 0
--                            0 | 1 | 0
--                            1 | 0 | 0
--                            1 | 1 | 1
--                           -----------
--
-- AUTOR: André Solano F. R. Maiolini
-- DATA: 21/06/2024

--| Libraries |-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| AND gate |---------------------------------------------------------

-- Definindo uma entidade para o AND gate

entity and_gate is
  
  port (
    a : in  std_logic;
    b : in  std_logic;
    z : out std_logic
  );

end and_gate;

--| Architecture |-----------------------------------------------------

-- Definindo a lógica do AND gate

architecture main of and_gate is
begin

  z <= a and b;

end architecture main;

---------------------------------------------------------------------