
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE beh OF tb IS

    SIGNAL tin : STD_LOGIC_VECTOR(0 TO 7) := "00001001";
    SIGNAL tout : STD_LOGIC_VECTOR(0 TO 7) := "00001001";

BEGIN
    uut : ENTITY work.zeroonedifference GENERIC MAP(n => 8) PORT MAP (inbin => tin, outbin => tout);
    tin <= "10000001", "11001001" AFTER 5 ns, "00000010" AFTER 10 ns, "00000011" AFTER 15 ns, "01111111" AFTER 20 ns;
END beh; -- beh