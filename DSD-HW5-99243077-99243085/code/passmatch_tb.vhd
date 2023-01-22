LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY passmatch_tb IS
END passmatch_tb;

ARCHITECTURE beh OF passmatch_tb IS
    SIGNAL input_pass : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL lock : STD_LOGIC;
    SIGNAL boogh : STD_LOGIC;
BEGIN
    uut : ENTITY work.passmatch PORT MAP (input_pass => input_pass, clk => clk, lock => lock, boogh => boogh);
    input_pass <= "0100", "0111" AFTER 5 ns, "0100" AFTER 8 ns, "0111" AFTER 9 ns, "0101" AFTER 27 ns;
    clk <= NOT clk AFTER 5 ns;
END beh;