
--| Libraries |-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--| Half Adder |------------------------------------------------------

entity half_adder is

    port(
        a, b  : in  std_logic;
        sum   : out std_logic;
        carry : out std_logic
    );

end half_adder;

--| Architecture |----------------------------------------------------

architecture main of half_adder is
begin 

    sum <= a xor b;
    carry <= a and b;

end architecture main;