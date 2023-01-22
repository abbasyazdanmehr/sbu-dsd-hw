
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom_8_x_4 is
	generic (
		address_width: integer := 8;
		address_bits: integer := 3;
		data_width: integer := 4
	);
	port (
		address: in std_logic_vector(address_bits-1 downto 0);
		data: out std_logic_vector(data_width-1 downto 0)
	);
end rom_8_x_4;

architecture Behavioral of rom_8_x_4 is
	type rom_type is array (0 to 8-1) of std_logic_vector(4-1 downto 0);
	signal my_rom : rom_type := (
                            "0001",
                            "0010", 
                            "0011",
                            "0100", 
                            "0101", 
                            "0110", 
                            "0111",
                            "1000"
        );
begin
	data <= my_rom (to_integer(unsigned(address)));
end Behavioral;

