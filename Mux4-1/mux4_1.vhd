library ieee;
use ieee.std_logic_1164.all;

entity mux4_1 is
    port(
        a, b, c, d : in std_logic; --!Entrada de 4 señales
        sel : in std_logic_vector(1 downto 0); --!Entrada de 2 bits para seleccionar la señal de salida
        y : out std_logic --!Salida de la señal seleccionada
    );
end mux4_1;

architecture behavior of mux4_1 is
begin
    
    process(a, b, c, d, sel)
    begin
        case sel is
            when "00" =>
                y <= a; --!Selecciona la señal a
            when "01" =>
                y <= b; --!Selecciona la señal b
            when "10" =>
                y <= c; --!Selecciona la señal c
            when "11" =>
                y <= d; --!Selecciona la señal d
            when others =>
                y <= '0'; --!Valor por defecto en caso de error
        end case;
    end process;

end behavior;
