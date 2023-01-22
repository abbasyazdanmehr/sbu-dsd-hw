
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY part3_tb IS
END part3_tb;

ARCHITECTURE behave OF part3_tb IS
    SIGNAL clk_in : STD_LOGIC := '0';
    SIGNAL clk_out : STD_LOGIC;
BEGIN
    m1 : ENTITY work.part3 GENERIC MAP (new_duty => 4) PORT MAP (clk_in => clk_in, clk_out => clk_out);
    clk_in <= not clk_in after 5 ns;
END behave; -- behave