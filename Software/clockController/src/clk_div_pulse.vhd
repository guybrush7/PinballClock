----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:03:24 06/21/2015 
-- Design Name: 
-- Module Name:    clk_div - Behavioral 
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

entity clk_div_pulse is
	port (
		clk		: in std_logic;
		rst		: in std_logic;
		N			: in std_logic_vector (31 downto 0);
		clk_out	: out std_logic
		);
end clk_div_pulse;


architecture Behavioral of clk_div_pulse is

-- Counter value
signal count	: std_logic_vector (31 downto 0);
-- Counter terminal signal
signal term		: std_logic;

-- Output
signal clk_out_i	: std_logic;

begin

	proc_count: process(clk, rst)
	begin
		if rst = '1' then
			count <= (others => '0');
			clk_out_i <= '0';
		elsif rising_edge(clk) then
			if term = '1' then
				count <= (others => '0');
				clk_out_i <= '1';
			else
				count <= std_logic_vector(unsigned(count) + 1);
				clk_out_i <= '0';
			end if;
		end if;
	end process;

	-- Pulse at counter reset
	term <= '1' when count = N else '0';
	
	-- Outputs
	clk_out <= clk_out_i;

end Behavioral;


