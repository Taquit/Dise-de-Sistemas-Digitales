----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:11:05 09/08/2026 
-- Design Name: 
-- Module Name:    divisor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divisor is
    Port ( CLK_DIV : in  STD_LOGIC;
           RST_IN : in  STD_LOGIC;
           LED : out  STD_LOGIC;
			  LED_EX: out STD_LOGIC);
end divisor;

architecture Behavioral of divisor is
	--attribute LOC :string;
	--attribute LOC of LED : signal is "U16";
	--attribute LOC of CLK_DIV : signal is "V10";
	--attribute LOC of RST_IN : signal is "T10";
	--attribute LOC of LED_EX: signal is "U15";
	
	constant WAIT_BOUNDARY : integer := 5; -- Valores para fpga 250_000_000
	constant TOTAL_PERIOD : integer := 10; -- Valores para fpga 500_000_000
	signal count_reg : integer range 0 to TOTAL_PERIOD - 1;
	signal led_reg: std_logic;
	
begin
	LED <= led_reg;
	LED_EX <= '1';
	process(CLK_DIV,RST_IN)
	begin
		if RST_IN = '0' then
			count_reg <= 0;
			led_reg <= '0';
		elsif rising_edge(CLK_DIV) then
			if count_reg = TOTAL_PERIOD - 1 then
				count_reg <= 0;
			else
				count_reg <= count_reg + 1;
			end if;
			if count_reg < WAIT_BOUNDARY then
				led_reg <= '0';
			else
				led_reg <= '1';
			end if;
		
		end if;
	end process;

end Behavioral;

