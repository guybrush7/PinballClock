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

entity reg is
	port (
		clk			: in std_logic;
		rst			: in std_logic;
		
		en			: in std_logic;
		D			: in std_logic;
		Q			: out std_logic
		
		);
end reg;

architecture Behavioral of reg is

signal reg_Q : std_logic;

begin

	proc_reg: process(clk, rst)
	begin
		if rst = '1' then
			Q <= '0';
		elsif rising_edge(clk) then
			if en = '1' then
				Q <= D;
			else
				Q <= Q;
			end if;
		end if;
	end process;

	
end Behavioral;
	