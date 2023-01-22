

LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  
ENTITY tb IS
        END tb;


ARCHITECTURE tbm OF tb IS

	signal firstinput :  std_logic_vector(3 downto 0);
	signal secondinput:  std_logic_vector(3 downto 0);
	signal result     :  std_logic_vector(7 downto 0);
		 
BEGIN
uut : ENTITY work.mult_usung_add_shift_4b  PORT MAP(firstinput => firstinput, secondinput => secondinput, result => result);
    firstinput <= "0000", "1110" after 20 ns, "0101" after 40 ns;
    secondinput <= "0000", "1110" after 40 ns;        
end tbm;
