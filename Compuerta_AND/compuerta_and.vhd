library ieee;
use ieee.std_logic_1164.all;

entity compuerta_and is
    port(
        A: in std_logic;
        B: in std_logic;
        Y: out std_logic
    );
end entity compuerta_and;

architecture behavior of compuerta_and is
begin
    Y <= A and B; --!Salida Y es la compuerta AND de las entradas A y B
end architecture ;
