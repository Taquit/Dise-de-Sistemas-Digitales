library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_flip_flop is
end entity tb_flip_flop;

architecture test of tb_flip_flop is

    signal CLK : std_logic := '0'; --!Señal de reloj
    signal RESET : std_logic := '0'; --!Señal de reset
    signal D : std_logic := '0'; --!Señal de entrada de datos
    signal Q : std_logic; --!Señal de salida de datos
    signal TEST : std_logic; --!Señal de salida de prueba

    -- Periodo de reloj (100 MHz -> 10 ns)
    constant CLK_PERIOD : time := 10 ns;

    signal sim_finished : boolean := false; --!Bandera para detener la simulación al terminar

begin

    uut: entity work.flip_flop_A
        port map(
            TEST => TEST,
            clk => CLK,
            reset => RESET,
            D => D,
            Q => Q
        );

    -- Proceso de señal de reloj
    clk_process: process
    begin
        while not sim_finished loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Proceso de estímulos
    stim_proc: process
    begin
        -- 1. Aplicar RESET al inicio (asumiendo reset activo en alto '1')
        -- (Si tu diseño usa reset activo en bajo '0', invierte estos dos valores)
        RESET <= '1';
        D     <= '0';
        wait for 20 ns;

        -- 2. Liberar RESET
        RESET <= '0';
        wait for 10 ns;

        -- 3. Transición a '1' en D antes del flanco de subida
        D <= '1';
        wait for 20 ns; -- Q debe responder poniéndose en '1'

        -- 4. Transición a '0' en D
        D <= '0';
        wait for 20 ns; -- Q debe regresar a '0'

        -- 5. Probar que RESET tiene prioridad sobre D
        D <= '1';
        wait for 10 ns;
        RESET <= '1';   -- Se activa el reset mientras D vale '1'
        wait for 20 ns; -- Q debe forzarse a '0'

        -- 6. Fin de la simulación
        RESET <= '0';
        wait for 20 ns;

        sim_finished <= true;
        wait;
    end process;

    


    

end architecture;