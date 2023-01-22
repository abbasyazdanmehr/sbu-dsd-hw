
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
end tb;

architecture Behavioral of tb is
	signal address: std_logic_vector(3-1 downto 0);
	signal data: std_logic_vector(4-1 downto 0);
begin
	my_rom8x4: entity work.rom_8_x_4 port map (address => address, data => data);
	address <= 	"000", 
					"001" after 10 ns,
					"011" after 20 ns,
					"111" after 30 ns,
					"100" after 40 ns;
end Behavioral;