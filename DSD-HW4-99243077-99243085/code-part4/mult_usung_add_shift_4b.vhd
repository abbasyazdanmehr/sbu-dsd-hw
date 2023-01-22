
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mult_usung_add_shift_4b is
	port( 
	firstinput : in std_logic_vector(3 downto 0);
	secondinput: in std_logic_vector(3 downto 0);
	result     : out std_logic_vector(7 downto 0)
		) ;
		
end mult_usung_add_shift_4b;

architecture logic_mul of mult_usung_add_shift_4b is
begin
process(firstinput,secondinput)
variable pv,bp :std_logic_vector(7 downto 0);
begin
pv:="00000000";
bp:="0000"& secondinput;
for i in 0 to 3 loop 
	if firstinput(i)='1' then 
	pv:=pv+bp;
	end if;
	bp:=bp(6 downto 0)&'0';
end loop;
result<=pv;
end process;
end logic_mul;
