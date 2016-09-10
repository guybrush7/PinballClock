library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm_main is

	port (
		clk			: in 	std_logic;
		rst			: in	std_logic;
		
		pps			: in 	std_logic;
		refresh_rtc	: in 	std_logic;
		adj_en		: in 	std_logic;
		
		rtc_ready	: in 	std_logic;
		
		cmd_write	: out 	std_logic;
		cmd_read	: out 	std_logic;
		cmd_load	: out 	std_logic;
		
		load_tod	: out	std_logic;
		load_ready	: out	std_logic
		
		);

end fsm_main;

architecture Behavioral of fsm_main is

type main_states is (	st_init, 
						st_wait,
						st_idle,
						st_adjusting,
						st_store_time,
						st_read_start,
						st_read_wait,
						st_read_load
						);
						
signal state	: main_states;



						
	
begin	
	
	-- RTC operation state
	proc_rtc_op: process (clk, rst)
	begin
		if rst = '1' then
			-- cmd_write <= '0';
			-- cmd_read <= '0';
			-- cmd_load <= '0';
			-- load_tod <= '0';
			-- load_ready <= '0';
			
			state <= st_init;
			
		elsif rising_edge(clk) then
			
			-- cmd_write <= '0';
			-- cmd_read <= '0';
			-- cmd_load <= '0';
			-- load_tod <= '0';
			-- load_ready <= '0';
			
			state <= state;
			
			case state is
				when st_init =>
					state <= st_wait;
				
				when st_wait =>
					state <= st_read_start;
				
				when st_idle =>
					if refresh_rtc = '1' then
						state <= st_read_start;
					end if;
					
					if adj_en = '1' then
						state <= st_adjusting;
					end if;
				
				when st_adjusting =>
					if adj_en = '0' then
						state <= st_store_time;
					end if;
				
				when st_store_time =>
					--rtc_cmd_write <= '1';
					state <= st_idle;
				
				when st_read_start =>
					--rtc_cmd_read <= '1';
					state <= st_read_wait;
				
				when st_read_wait =>
					if rtc_ready = '1' then
						state <= st_read_load;
					end if;
				
				when st_read_load =>
					--load_tod <= '1';
					state <= st_idle;
				
				when others =>
					state <= st_init;
				
			end case;
		
		end if;
	end process;
	
	-- outputs
	cmd_write <= '1' when state = st_store_time else '0';
	cmd_read <= '1' when state = st_read_start else '0';
	cmd_load <= '0';
	load_tod <= '1' when state = st_read_load else '0';
	load_ready <= '1' when state = st_read_load else '0';
			
			
			
			
end Behavioral;