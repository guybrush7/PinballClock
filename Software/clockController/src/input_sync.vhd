----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:49:29 02/21/2016 
-- Design Name: 
-- Module Name:    input_sync - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity input_sync is
	port (
		clk		: in std_logic;
		rst		: in std_logic;
		pin_in	: in std_logic_vector(6 downto 0);
		pin_out	: out std_logic_vector(6 downto 0)
	);	
end input_sync;

architecture Behavioral of input_sync is



signal delay1:		std_logic_vector (6 downto 0);
signal delay2:		std_logic_vector (6 downto 0);


begin

	proc_delay: process(clk,rst)
	begin
		if rst = '1' then
			delay1 <= (others => '0');
			delay2 <= (others => '0');
		elsif rising_edge(clk) then
			delay1 <= pin_in;
			delay2 <= delay1;
		end if;
	end process;

	pin_out <= delay2;

end Behavioral;

