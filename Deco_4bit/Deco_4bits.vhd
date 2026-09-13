library ieee;
use ieee.std_logic_1164.all;

entity deco_4bits is 
    port(
        TEST: out std_logic;
        A: in std_logic_vector(3 downto 0); --!Entrada de 4 bits (como vector)
        Y: out std_logic_vector(15 downto 0) --!Salida de 16 bits (como vector)

    );
end entity deco_4bits;

architecture behavior of deco_4bits is
    --attribute LOC :string;
	--attribute LOC of LED : signal is "U16";
	--attribute LOC of RST_IN : signal is "T10";
	--attribute LOC of LED_EX: signal is "U15";
begin
    TEST<= '1'; --!Led para indicar que se programo la FPGA
    process(A)
    begin
        case A is
            when "0000" => Y <= "0000000000000001";
            when "0001" => Y <= "0000000000000010";
            when "0010" => Y <= "0000000000000100";
            when "0011" => Y <= "0000000000001000";
            when "0100" => Y <= "0000000000010000";
            when "0101" => Y <= "0000000000100000";
            when "0110" => Y <= "0000000001000000";
            when "0111" => Y <= "0000000010000000";
            when "1000" => Y <= "0000000100000000";
            when "1001" => Y <= "0000001000000000";
            when "1010" => Y <= "0000010000000000";
            when "1011" => Y <= "0000100000000000";
            when "1100" => Y <= "0001000000000000";
            when "1101" => Y <= "0010000000000000";
            when "1110" => Y <= "0100000000000000";
            when "1111" => Y <= "1000000000000000";
            when others => Y <= "0000000000000000"; --!Salida por defecto para cualquier otro valor de A
        end case;
    end process;
end architecture ;
