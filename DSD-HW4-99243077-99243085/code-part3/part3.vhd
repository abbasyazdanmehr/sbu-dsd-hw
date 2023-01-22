LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY part3 IS
    GENERIC (new_duty : INTEGER := 4);
    PORT (
        clk_in : IN STD_LOGIC;
        clk_out : OUT STD_LOGIC
    );
END part3;
ARCHITECTURE behave OF part3 IS

BEGIN
    count : PROCESS (clk_in)
        VARIABLE counter : INTEGER RANGE 0 TO 10;
    BEGIN
        IF (clk_in'event AND clk_in = '1') THEN
            counter := counter + 1;
            IF (counter = new_duty) THEN
                clk_out <= '0';
            END IF;
            IF (counter = 10) THEN
                clk_out <= '1';
                counter := 0;
            END IF;
        END IF;
    END PROCESS;
END behave; -- behave