----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:47:56 05/05/2015 
-- Design Name: 
-- Module Name:    bcd_counter - Behavioral 
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

entity fsm_adjust is
	port (
		clk			: in std_logic;
		rst			: in std_logic;
		
		-- user controls
		en_adj		: in std_logic;
		btn_next	: in std_logic;
		btn_inc		: in std_logic;
		
		-- outputs
		adjHourTen	: out std_logic;
		adjHourOne	: out std_logic;
		adjMinTen	: out std_logic;
		adjMinOne	: out std_logic;
		adjSecTen	: out std_logic;
		adjSecOne	: out std_logic;
		adjInc		: out std_logic
		
		);
end fsm_adjust;

architecture Behavioral of fsm_adjust is

signal adj_mask	: std_logic_vector(6 downto 0);



begin

	-- TODO: debounce
	--btn_next_db <= btn_next;
	--btn_inc_db <= btn_inc;


	proc_fsm: process(clk, rst)
	begin
		if rst = '1' then
			adj_mask <= "0000001";
		elsif rising_edge(clk) then
			if en_adj = '0' then
				adj_mask <= "0000001";
			else
				if btn_next = '1' then
					adj_mask(6 downto 1) <= adj_mask(5 downto 0);
					adj_mask(0) <= adj_mask(6);
				else
					adj_mask <= adj_mask;
				end if;
			end if;
		end if;
	end process;

	
	
	
	
	-- Outputs
	adjHourTen	<= adj_mask(6);
	adjHourOne	<= adj_mask(5);
	adjMinTen	<= adj_mask(4);
	adjMinOne	<= adj_mask(3);
	adjSecTen	<= adj_mask(2);
	adjSecOne	<= adj_mask(1);
	adjInc		<= btn_inc;
	
	
	
	
	


end Behavioral;




















