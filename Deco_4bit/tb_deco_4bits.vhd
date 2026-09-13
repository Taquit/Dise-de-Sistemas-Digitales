library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity deco_4bits_tb is
end entity deco_4bits_tb;

architecture test of deco_4bits_tb is
    -- Señales para conectar al componente
    signal s_TEST : std_logic;
    signal s_A    : std_logic_vector(3 downto 0) := "0000";
    signal s_Y    : std_logic_vector(15 downto 0);
begin
    -- Instanciación del diseño bajo prueba (DUT)
    uut: entity work.deco_4bits
        port map(
            TEST => s_TEST,
            A    => s_A,
            Y    => s_Y
        );

    -- Proceso de estímulos
    stim_proc: process
    begin
        -- Barremos todos los valores de 0 a 15
        for i in 0 to 15 loop
            s_A <= std_logic_vector(to_unsigned(i, 4));
            wait for 20 ns;
        end loop;

        -- Espera final para congelar la simulación
        wait;
    end process;
end architecture test;