library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_system is
	port (
		sensor: in std_logic;
		trafficlights: out std_logic_vector (4 downto 0)
	);
end my_system;

architecture Behavioral of my_system is
	type state_type is (s_g_r, s_y_r, s_r_g); -- s = state, green = g, red = r, yellow = y
	
	signal state: state_type;
	

begin

sensor_event:
	process (sensor)
	begin
		-- rising edge
		if sensor'event and sensor = '1' then
			if state = s_g_r then
				state <= s_y_r, s_r_g after 5 ns;
			end if;
		end if;
		
		-- falling edge
		if sensor'event and sensor = '0' then
			if state = s_r_g then
				state <= s_g_r after 15 ns;
			end if;
		end if;
	end process;

change_state: 
	process (state)
	begin
	  case state is 
			when s_g_r =>    	trafficlights <= "10001";
			when s_y_r => 		trafficlights <= "01001";
			when s_r_g =>   	trafficlights <= "00110";
	  end case; 
	end process;

end Behavioral;