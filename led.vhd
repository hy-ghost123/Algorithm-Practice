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
signal current_row: std_logic_vector(7 downto 0);
begin
	p1:process(clk)
	begin
		case current_row is
			when "10000000"=>row<="01000000"; current_row<="01000000"; red<="11111111"; green<="11111111";
			when "01000000"=>row<="00100000"; current_row<="00100000"; red<="11111111"; green<="11111111"; 
			when "00100000"=>row<="00010000"; current_row<="00010000"; red<="11010111"; green<="11111111";
			when "00010000"=>row<="00001000"; current_row<="00001000"; red<="10000011"; green<="11111111";
			when "00001000"=>row<="00000100"; current_row<="00000100"; red<="11000111"; green<="11111111";
			when "00000100"=>row<="00000010"; current_row<="00000010"; red<="11101111"; green<="11111111";
			when "00000010"=>row<="00000001"; current_row<="00000001"; red<="11111111"; green<="11111111";
			when "00000001"=>row<="10000000"; current_row<="10000000"; red<="11111111"; green<="11111111";
			when others =>row<="10000000"; current_row<="10000000";
		end case;
	end process p1;
end architecture arch;
		
		
		
		
		
		
		
		
		
