
-- Descrição de Hardware (VHDL) de uma porta AND de duas entradas
--
--			      _____				
--      a >--|     |		      a | b | z
--           | XOR |--> z    -----------
--      b >--|_____|          0 | 0 | 0
--            							  0 | 1 | 1
--            							  1 | 0 | 1
--            							  1 | 1 | 0
--            							 -----------
--
-- AUTOR: André Solano F. R. Maiolini
-- DATA: 21/06/2024

--| Libraries |-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| AND gate |---------------------------------------------------------

entity xor_gate is
  
  port (
    a : in  std_logic;
    b : in  std_logic;
    z : out std_logic
  );

end xor_gate;

--| Architecture |-----------------------------------------------------

architecture main of xor_gate is
begin

  z <= a xor b;

end architecture main;

---------------------------------------------------------------------