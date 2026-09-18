library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor is
    Port ( 
        CLK_DIV : in  STD_LOGIC;
        RST_IN  : in  STD_LOGIC;
        LED     : out STD_LOGIC;
        LED2    : out STD_LOGIC;
        LED_EX  : out STD_LOGIC
    );
end divisor;

architecture Behavioral of divisor is

    -- fpga
    --constant TOTAL_PERIOD  : integer := 200_000_000;
    --constant WAIT_BOUNDARY : integer := 100_000_000;
    
    -- simulacion
    constant TOTAL_PERIOD  : integer := 20;
    constant WAIT_BOUNDARY : integer := 10;

    signal count_reg : integer range 0 to TOTAL_PERIOD - 1 := 0;
    signal led_reg   : std_logic := '0';

    -- Contador para registrar los parpadeos (0 a 3 = 4 ciclos)
    signal blink_count : integer range 0 to 3 := 0;
    signal led2_reg    : std_logic := '0';

begin

    LED    <= led_reg;
    LED2   <= led2_reg;
    LED_EX <= '1';

    process(CLK_DIV, RST_IN)
begin
    if RST_IN = '0' then
        count_reg   <= 0;
        led_reg     <= '0';
        blink_count <= 0;
        led2_reg    <= '0';

    elsif rising_edge(CLK_DIV) then
        
        -- Divisor de tiempo
        if count_reg = TOTAL_PERIOD - 1 then
            count_reg <= 0;
            
            -- Incrementar el contador de parpadeos completados
            if blink_count = 3 then
                blink_count <= 0;
            else
                blink_count <= blink_count + 1;
            end if;
        else
            count_reg <= count_reg + 1;
        end if;

        -- Generación del pulso de LED1
        if count_reg < WAIT_BOUNDARY then
            led_reg <= '0';
        else
            led_reg <= '1';
        end if;

        -- LED2 enciende ÚNICAMENTE cuando LED1 está encendido Y es el 4.° ciclo (blink_count = 3)
        if (blink_count = 3) and (count_reg >= WAIT_BOUNDARY) then
            led2_reg <= '1';
        else
            led2_reg <= '0';
        end if;

    end if;
end process;

end Behavioral;