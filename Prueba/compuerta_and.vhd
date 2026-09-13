library ieee;
use ieee.std_logic_1164.all;

entity compuerta_and is
    port(
        A,B: in std_logic; --!Estas son las entradas
        F: out std_logic --!Puerto de salida
    );
end entity;

architecture behavior of compuerta_and is
begin
    F <= A and B; --!Se realiza la operación AND entre las entradas A y B
end architecture;
