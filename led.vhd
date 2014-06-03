library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity led is
	port(
	clk: in std_logic;
	row: out std_logic_vector(7 downto 0);
	red: out std_logic_vector(7 downto 0);
	green: out std_logic_vector(7 downto 0)
	);
	end led;

architecture arch of led is
type Arr is array (0 to 7) of std_logic_vector(15 downto 0);
signal current_row: std_logic_vector(7 downto 0);
begin
	p1:process(clk)
	variable red2 : Arr := ( "11111111",
							"11111111",
							"11010111",
							"10000011",
							"11000111",
							"11101111",
							"11111111",
							"11111111");
	variable c: integer := 0;
	begin
		if clk = '1' and clk'event then
			case current_row is
				when "10000000"=>row<="01000000"; current_row<="01000000"; red<=red2(0); green<="11111111";
				when "01000000"=>row<="00100000"; current_row<="00100000"; red<=red2(1); green<="11111111"; 
				when "00100000"=>row<="00010000"; current_row<="00010000"; red<=red2(2); green<="11111111";
				when "00010000"=>row<="00001000"; current_row<="00001000"; red<=red2(3); green<="11111111";
				when "00001000"=>row<="00000100"; current_row<="00000100"; red<=red2(4); green<="11111111";
				when "00000100"=>row<="00000010"; current_row<="00000010"; red<=red2(5); green<="11111111";
				when "00000010"=>row<="00000001"; current_row<="00000001"; red<=red2(6); green<="11111111";
				when "00000001"=>row<="10000000"; current_row<="10000000"; red<=red2(7); green<="11111111";
				when others =>row<="10000000"; current_row<="10000000";
			end case;
			c := c + 1;
			if c = 1000000 then
				red2(0) := red2(0)(6 downto 0) & red2(0)(7);
				red2(1) := red2(1)(6 downto 0) & red2(1)(7);
				red2(2) := red2(2)(6 downto 0) & red2(2)(7);
				red2(3) := red2(3)(6 downto 0) & red2(3)(7);
				red2(4) := red2(4)(6 downto 0) & red2(4)(7);
				red2(5) := red2(5)(6 downto 0) & red2(5)(7);
				red2(6) := red2(6)(6 downto 0) & red2(6)(7);
				red2(7) := red2(7)(6 downto 0) & red2(7)(7);
				c := 0;
			end if;
		end if;
	end process p1;
end architecture arch;
		
		
		
		
		
		
		
		
		
