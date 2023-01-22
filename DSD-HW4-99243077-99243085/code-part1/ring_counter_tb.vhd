LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ring_counter_tb IS
END ring_counter_tb;

ARCHITECTURE beh OF ring_counter_tb IS

    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '0';
    SIGNAL counter : STD_LOGIC_VECTOR(0 TO 7) := (others => '0');

BEGIN

    uut : ENTITY work.ring_counter GENERIC MAP(n => 8) PORT MAP(clk => clk, reset => reset, counter => counter);
    clk <= NOT clk AFTER 5 ns;
    reset <= '1' after 43 ns, '0' after 51 ns;

END beh; -- beh