library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor_tb is
end entity divisor_tb;

architecture test of divisor_tb is

    -- Señales de interconexión con el DUT
    signal s_CLK_DIV : std_logic := '0';
    signal s_RST_IN  : std_logic := '0';
    signal s_LED     : std_logic;
    signal s_LED2    : std_logic; -- << CAMBIO 1: Señal para el segundo LED
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
            LED2    => s_LED2,   -- << CAMBIO 2: Mapeo de LED2
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
        -- 1. Reset activo en bajo durante 40 ns
        s_RST_IN <= '0';
        wait for 40 ns;

        -- 2. Liberar reset
        s_RST_IN <= '1';

        -- << CAMBIO 3: Tiempo de simulación suficiente
        -- IMPORTANTE: Asegurate de haber cambiado en divisor.vhd:
        -- constant TOTAL_PERIOD  : integer := 20;
        -- constant WAIT_BOUNDARY : integer := 10;
        -- Cada parpadeo tomara 20 * 10 ns = 200 ns.
        -- Para ver 5 parpadeos completos (y ver encender y apagar LED2):
        -- 5 parpadeos * 200 ns = 1000 ns + 40 ns de reset = ~1040 ns.
        wait for 1500 ns;

        sim_finished <= true;
        wait;
    end process;

end architecture test;