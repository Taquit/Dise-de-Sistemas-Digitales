library ieee;
use ieee.std_logic_1164.all;

entity tb_compuerta_and is
end entity tb_compuerta_and;

architecture estimulo of tb_compuerta_and is
    signal A, B, Y: std_logic; --!Se definen las señales de entrada y salida
begin
    uut: entity work.compuerta_and
        port map(
            A => A,
            B => B,
            Y => Y
        );
    process
    begin
        A <= '0'; B <= '0'; wait for 10 ns; --!Se aplican los valores de entrada y se espera un tiempo
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;
        wait; --!Se detiene la simulación
    end process;

    

end architecture;
