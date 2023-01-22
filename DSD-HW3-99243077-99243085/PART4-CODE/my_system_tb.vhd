
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_system_tb is
end my_system_tb;

architecture Behavioral of my_system_tb is
	signal trafficlights : std_logic_vector(4 downto 0);
	signal sensor : std_logic;
begin
	mytlc: entity work.my_system port map (trafficlights => trafficlights, sensor => sensor);
	
			
	-- sensor <= 	'0',	'1' after 5 ns,'0' after 20 ns,	'1' after 23 ns,	'0' after 27 ns;
	-- sensor <= '0',	'1' after 5 ns,'0' after 8 ns,	'1' after 23 ns,	'0' after 27 ns;
	sensor <= '0',	'1' after 5 ns,'0' after 8 ns,	'1' after 9 ns,	'0' after 27 ns;
	

end Behavioral;