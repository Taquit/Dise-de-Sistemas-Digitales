library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor_tb is
end entity divisor_tb;

architecture test of divisor_tb is

    -- Señales de interconexión con el DUT
    signal s_CLK_DIV : std_logic := '0';
    signal s_RST_IN  : std_logic := '0';
    signal s_LED     : std_logic;
    signal s_LED_EX  : std_logic;

    -- Periodo de reloj (100 MHz -> 10 ns)
    constant CLK_PERIOD : time := 10 ns;

    -- Bandera para detener la simulación al terminar
    signal sim_finished : boolean := false;

begin

    -- Instanciación del módulo a probar (DUT)
    uut: entity work.divisor
        port map (
            CLK_DIV => s_CLK_DIV,
            RST_IN  => s_RST_IN,
            LED     => s_LED,
            LED_EX  => s_LED_EX
        );

    -- Generador de señal de reloj (100 MHz)
    clk_process: process
    begin
        while not sim_finished loop
            s_CLK_DIV <= '0';
            wait for CLK_PERIOD / 2;
            s_CLK_DIV <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Proceso de estímulos
    stim_proc: process
    begin
        -- 1. Mantener reset en '0' durante los primeros 40 ns (Reset asíncrono activo en bajo)
        s_RST_IN <= '0';
        wait for 40 ns;

        -- 2. Liberar reset a '1' para permitir que el contador empiece a contar
        s_RST_IN <= '1';

        -- 3. Tiempo de simulación:
        -- NOTA: Con TOTAL_PERIOD = 500_000_000, un ciclo completo requiere 5 segundos reales de tiempo simulado.
        -- Si solo quieres verificar que arranca y cuenta, espera un tiempo moderado:
        wait for 1000 ns;

        -- Si quieres simular un ciclo completo, cambia el valor de TOTAL_PERIOD temporalmente
        -- en divisor.vhd a un número pequeño (ej. 10 y WAIT_BOUNDARY a 5).

        sim_finished <= true;
        wait;
    end process;

end architecture test;