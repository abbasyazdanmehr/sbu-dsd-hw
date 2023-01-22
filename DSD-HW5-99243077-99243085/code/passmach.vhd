LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY passmatch IS
    GENERIC (n : INTEGER := 4);
    PORT (
        input_pass : IN STD_LOGIC_VECTOR(0 TO n - 1);
        clk : IN STD_LOGIC;
        lock : OUT STD_LOGIC;
        boogh : OUT STD_LOGIC
    );
END passmatch;
ARCHITECTURE beh OF passmatch IS

    TYPE state_type IS (sinit, strue, strue1, strue2, sfalse1, sfalse2, sfalse3);
    SIGNAL state : state_type;
    SIGNAL stored_pass : STD_LOGIC_VECTOR(0 TO n - 1) := "0101";

BEGIN

    change_state : PROCESS (clk, input_pass)
    BEGIN
        -- input_pass event
        IF input_pass'event THEN
            IF state = sinit THEN
                IF input_pass = stored_pass THEN
                    state <= strue;
                ELSE
                    state <= sfalse1;
                END IF;
            ELSIF state = sfalse1 THEN
                IF input_pass = stored_pass THEN
                    state <= strue;
                ELSE
                    state <= sfalse2;
                END IF;
            ELSIF state = sfalse2 THEN
                IF input_pass = stored_pass THEN
                    state <= strue;
                ELSE
                    state <= sfalse3;
                END IF;
            ELSIF state = sfalse3 THEN
                IF input_pass = stored_pass THEN
                    state <= strue;
                ELSE
                    state <= sinit;
                END IF;
            END IF;
        END IF;

        -- clk event
        IF clk'event AND clk = '1' THEN
            IF state = strue THEN
                state <= strue1;
            ELSIF state = strue1 THEN
                state <= strue2;
            ELSIF state = strue2 THEN
                state <= sinit;
            END IF;
        END IF;

    END PROCESS;

    state_initial : PROCESS (state)
    BEGIN
        CASE state IS
            WHEN sinit =>
                lock <= '1';
                boogh <= '0';
            WHEN strue =>
                lock <= '1';
                boogh <= '0';
            WHEN strue1 =>
                lock <= '0';
                boogh <= '0';
            WHEN strue2 =>
                lock <= '0';
                boogh <= '0';
            WHEN sfalse1 =>
                lock <= '1';
                boogh <= '1';
            WHEN sfalse2 =>
                lock <= '1';
                boogh <= '1';
            WHEN sfalse3 =>
                lock <= '1';
                boogh <= '1';
        END CASE;
    END PROCESS; -- state_initial
END beh; -- beh