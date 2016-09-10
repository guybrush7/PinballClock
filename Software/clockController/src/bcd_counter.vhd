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

entity bcd_counter is
	port (
		clk		: in std_logic;
		rst		: in std_logic;
		d			: in std_logic_vector (3 downto 0);
		q			: out std_logic_vector (3 downto 0);
		term_cnt	: in std_logic_vector (3 downto 0);
		en			: in std_logic;
		load		: in std_logic;
		term		: out std_logic
		);
end bcd_counter;

architecture Behavioral of bcd_counter is

-- Counter value
signal count	: std_logic_vector (3 downto 0);
-- Counter terminal signal
signal term_i	: std_logic;

begin

	proc_count: process(clk, rst)
	begin
		if rst = '1' then
			count <= "0000";
		elsif rising_edge(clk) then
			if en = '1' and term_i = '1' then
				count <= "0000";
			--elsif en = '1' and load = '1' then
			elsif load = '1' then
				count <= d;
			elsif en = '1' then
				count <= std_logic_vector(unsigned(count) + 1);
			else
				count <= count;
			end if;
		end if;
	end process;

	term_i <= '1' when count = term_cnt else '0';
	
	
	
	-- Outputs
	term <= term_i;
	q <= count;


end Behavioral;

