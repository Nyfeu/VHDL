
-- Descrição de Hardware (VHDL) de uma porta NAND de duas entradas
--
--            ______			
--      a >--|      |          a | b | z
--           | NAND |--> z    -----------
--      b >--|______|          0 | 0 | 0
--                             0 | 1 | 1
--                             1 | 0 | 1
--                             1 | 1 | 0
--                            -----------
--
-- AUTOR: André Solano F. R. Maiolini
-- DATA: 21/06/2024

--| Libraries |-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| NAND gate |---------------------------------------------------------

entity nand_gate is
  
  port (
    a : in  std_logic;
    b : in  std_logic;
    z : out std_logic
  );

end nand_gate;

--| Architecture |-----------------------------------------------------

architecture main of nand_gate is
begin

  z <= a nand b;

end architecture main;

---------------------------------------------------------------------