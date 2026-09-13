library ieee;
use ieee.std_logic_1164.all;

entity flip_flop_A is 
    port(
        TEST: out std_logic; --!Salida de prueba
        clk : in std_logic; --!Entrada de reloj
        reset: in std_logic; --!Entrada de reset
        D : in std_logic; --!Entrada de datos
        Q: out std_logic --!Salida de datos
    );
end flip_flop_A;

architecture behavior of flip_flop_A is
begin
    process(clk,reset)
    begin
        --Solo se activa si hay un flanco de subida en el reloj o si se activa el reset
        if  reset ='1' then
            Q<='0';
        elsif rising_edge(clk) then
            Q<=D;
        end if;
    end process;
end behavior;
