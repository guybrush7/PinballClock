----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:40:50 06/21/2015 
-- Design Name: 
-- Module Name:    input_debounce - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity input_debounce is
	port (
		clk		: in std_logic;
		rst		: in std_logic;
		timeout	: in std_logic_vector(31 downto 0);
		pin_in	: in std_logic;
		pin_out	: out std_logic
--		db1		: out std_logic;
--		db2		: out std_logic
	);
end input_debounce;

architecture Behavioral of input_debounce is

signal count		: std_logic_vector(31 downto 0);
signal cnt_en		: std_logic;
signal cnt_term	: std_logic;

type db_state is (db_ready, db_wait, db_delay);
signal state		: db_state;

signal pin_hold 	: std_logic;

begin

	-- state transition
	proc_fsm: process (clk, rst)
	begin
		if rst = '1' then
			state <= db_ready;
		elsif rising_edge(clk) then
		
			state <= state;
			case state is
				when db_ready =>
					if pin_in /= pin_hold then
						state <= db_wait;
					end if;
				when db_wait =>
					if cnt_term = '1' then
						state <= db_delay;
					end if;
				when db_delay =>
					state <= db_ready;
				when others =>
					state <= db_ready;
			end case;
			
		end if;
	end process;
	
	-- enable counter while waiting
	cnt_en <= '1' when state = db_wait else '0';


	-- process to count timer
	proc_cnt: process (clk, rst)
	begin
		if rst = '1' then
			count <= (others => '0');
		elsif rising_edge(clk) then
			if cnt_en = '1' then
				count <= std_logic_vector(unsigned(count) + 1);
			else
				count <= (others => '0');
			end if;
		end if;
	end process;
	
	-- Flag count termination
	cnt_term <= '1' when count = timeout else '0';
	
	-- output
	proc_out: process (clk, rst)
	begin
		if rst = '1' then
			pin_hold <= '0';
		elsif rising_edge(clk) then
			if state = db_wait then
				pin_hold <= pin_hold;
			else
				pin_hold <= pin_in;
			end if;
		end if;
	end process;
	
	pin_out <= pin_hold;
	
	--db1 <= '1' when (state = db_wait) else '0';
	--db2 <= cnt_en;

end Behavioral;

