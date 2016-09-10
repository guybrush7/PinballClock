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

entity falling_edge_det is
	port (
		-- system values
		clk		: in std_logic;
		rst		: in std_logic;
		
		D			: in std_logic;
		Q			: out std_logic
		);
end falling_edge_det;


architecture rtl of falling_edge_det is

signal D1		: std_logic;

begin
	
	-- delay input 
	proc_edge: process(clk, rst)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				D1 <= '0';
			else
				D1 <= D;
			end if;
		end if;
	end process;
	
	-- check for falling edge
	Q <= '1' when (D1 /= D) and (D = '0') else '0';
	
end rtl;
				
		

