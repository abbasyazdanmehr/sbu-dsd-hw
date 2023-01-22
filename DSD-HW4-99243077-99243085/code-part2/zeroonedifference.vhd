LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY zeroonedifference IS
    GENERIC (n : INTEGER := 4);
    PORT (
        inbin : IN STD_LOGIC_VECTOR(0 TO n - 1);
        outbin : OUT STD_LOGIC_VECTOR(0 TO n - 1)
    );
END zeroonedifference;

ARCHITECTURE beh OF zeroonedifference IS

    TYPE int_array IS ARRAY(0 TO n - 1) OF INTEGER;
    TYPE vector_array IS ARRAY(0 TO n - 1) OF STD_LOGIC_VECTOR(0 TO 0);

    SIGNAL notinbin: STD_LOGIC_VECTOR(0 TO n - 1);
    SIGNAL ones : int_array;
    SIGNAL zeros : int_array;
    SIGNAL diff : INTEGER;
    SIGNAL temponefirst : STD_LOGIC_VECTOR(0 TO 0);
    SIGNAL tempones : vector_array;
    SIGNAL tempzerofirst : STD_LOGIC_VECTOR(0 TO 0);
    SIGNAL tempzeros : vector_array;

BEGIN
    temponefirst(0) <= inbin(0);
    ones(0) <= ieee.numeric_std.to_integer(ieee.numeric_std.unsigned(temponefirst));
    ones_count : FOR i IN 1 TO n - 1 GENERATE
        tempones(i)(0) <= inbin(i);
        ones(i) <= ones(i - 1) + ieee.numeric_std.to_integer(ieee.numeric_std.unsigned(tempones(i)));
    END GENERATE ones_count; -- ones_counts

    notinbin <= NOT inbin;

    tempzerofirst(0) <= notinbin(0);
    zeros(0) <= ieee.numeric_std.to_integer(ieee.numeric_std.unsigned(tempzerofirst));
    zeros_count : FOR i IN 1 TO n - 1 GENERATE
        tempzeros(i)(0) <= notinbin(i);
        zeros(i) <= zeros(i - 1) + ieee.numeric_std.to_integer(ieee.numeric_std.unsigned(tempzeros(i)));
    END GENERATE zeros_count; -- zeros_counts

    diff <= ones(n - 1) - zeros(n - 1) WHEN ones(n - 1) > zeros(n - 1) ELSE
        zeros(n - 1) - ones(n - 1);
    outbin <= conv_std_logic_vector(diff, n);
END beh; -- beh