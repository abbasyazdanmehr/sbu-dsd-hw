
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY calcul_tb IS
END calcul_tb;

ARCHITECTURE beh OF calcul_tb IS

    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL KEY : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL SW : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL LED : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

    uut : ENTITY work.calcul PORT MAP(clk => clk, KEY => KEY, SW => SW, LED => LED);

    -- clock (no usage)
    -- clk <= NOT clk AFTER 5 ns;

    -- sim1 - wrong password input
    -- SW <= "0000", "0011" AFTER 10 ns, "0010" AFTER 25 ns;
    -- KEY <= "00", "10" AFTER 10 ns, "01" AFTER 20 ns, "10" AFTER 35 ns;

    -- sim2 - true password input
    -- SW <= "0000", "0101" AFTER 10 ns;
    -- KEY <= "00", "01" AFTER 20 ns, "10" AFTER 35 ns;

    -- sim3 - one complete senario
    tb1 : PROCESS
        CONSTANT select_period : TIME := 5 ns;
        CONSTANT press_period : TIME := 1 ns;
    BEGIN
        SW <= "0000";
        KEY <= "00";
        WAIT FOR select_period;

        SW <= "0101"; -- true password on switch
        WAIT FOR select_period;

        KEY <= "01"; -- key_read_password
        WAIT FOR press_period;
        KEY <= "11";
        WAIT FOR select_period;

        KEY <= "10"; -- key_event go to sinnum1 state
        WAIT FOR press_period;
        KEY <= "11";
        WAIT FOR select_period;

        SW <= "1111"; -- number 31 on switch as num1
        WAIT FOR select_period;

        KEY <= "10"; -- num1 = 31 now state is sinop
        WAIT FOR press_period;
        KEY <= "11";
        WAIT FOR select_period;

        SW <= "0000"; -- choose addition operation --------------- choose operator here --
        WAIT FOR select_period;

        KEY <= "10"; -- op = addition now state is sinnum2
        WAIT FOR press_period;
        KEY <= "11";
        WAIT FOR select_period;

        SW <= "0111"; -- number 7 on switch as num2
        WAIT FOR select_period;

        KEY <= "10"; -- num2 = 7 now state is sinnum1
        WAIT FOR press_period;
        KEY <= "11";
        WAIT FOR select_period;

        -- you should see the led = 7 + 15 = 22 = 0001_0110 here

        WAIT; -- indefinitely suspend process
    END PROCESS;

END beh; -- beh