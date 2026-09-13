library ieee;
use ieee.std_logic_1164.all;

entity tb_mux4_1 is
end entity tb_mux4_1;

architecture test of tb_mux4_1 is
    signal a, b, c, d : std_logic := '0'; --!Señales de entrada del MUX
    signal sel : std_logic_vector(1 downto 0) := "00"; --!Señal de selección
    signal y : std_logic; --!Señal de salida del MUX
begin

    uut: entity work.mux4_1
        port map(
            a => a,
            b => b,
            c => c,
            d => d,
            sel => sel,
            y => y
        );

    -- Proceso de estímulos
    stim_proc: process
    begin
        -- Caso 1: Probar canal 'a' (sel = "00")
        sel <= "00";
        a <= '1'; b <= '0'; c <= '0'; d <= '0';
        wait for 20 ns;
        a <= '0'; -- Verificamos que si 'a' conmuta, 'y' la sigue
        wait for 20 ns;

        -- Caso 2: Probar canal 'b' (sel = "01")
        sel <= "01";
        a <= '0'; b <= '1'; c <= '0'; d <= '0';
        wait for 20 ns;
        b <= '0';
        wait for 20 ns;

        -- Caso 3: Probar canal 'c' (sel = "10")
        sel <= "10";
        a <= '0'; b <= '0'; c <= '1'; d <= '0';
        wait for 20 ns;
        c <= '0';
        wait for 20 ns;

        -- Caso 4: Probar canal 'd' (sel = "11")
        sel <= "11";
        a <= '0'; b <= '0'; c <= '0'; d <= '1';
        wait for 20 ns;
        d <= '0';
        wait for 20 ns;

        -- Detener la simulación
        wait;
    end process;

end architecture;
