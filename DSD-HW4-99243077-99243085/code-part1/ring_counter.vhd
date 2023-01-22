LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ring_counter IS
    GENERIC (N : INTEGER := 4);
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        counter : OUT STD_LOGIC_VECTOR(0 TO n - 1)
    );
END ring_counter;

ARCHITECTURE beh OF ring_counter IS

    SIGNAL notend : STD_LOGIC;
    SIGNAL temp : STD_LOGIC_VECTOR(0 TO n - 1) := (0 => '1', OTHERS => '0');

BEGIN
    -- if you can code not structrual, do that :)
    notend <= NOT temp(n - 1);

    temp <= (others=>'0') WHEN reset = '1' ELSE
        (notend & temp(0 TO n - 2)) WHEN clk'event AND clk = '1';
    counter <= temp;
END beh; -- beh