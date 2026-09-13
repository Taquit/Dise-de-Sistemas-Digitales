library ieee;
use ieee.std_logic_1164.all;

entity flip_flop_S is 
    
    port(
        TEST: out std_logic; --!Salida de prueba
        clk : in std_logic; --!Entrada de reloj
        reset: in std_logic; --!Entrada de reset
        D : in std_logic; --!Entrada de datos
        Q: out std_logic --!Salida de datos
    );
end flip_flop_S;

architecture behavior of flip_flop_S is
begin
    process(clk)
    begin
        -- Solo se activa si hay un flanco de subida en el reloj
        if rising_edge(clk) then
            if reset = '1' then
                Q <= '0';
            else
                Q <= D;
            end if;
        end if;
    end process;
end behavior;
