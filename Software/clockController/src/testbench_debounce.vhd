--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:29:34 02/15/2016
-- Design Name:   
-- Module Name:   J:/House/Projects/Clock/fpga/clockController/ise_files/testbench_debounce.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: input_debounce
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbench_debounce IS
END testbench_debounce;
 
ARCHITECTURE behavior OF testbench_debounce IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT input_debounce
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         timeout : IN  std_logic_vector(31 downto 0);
         pin_in : IN  std_logic;
         pin_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal timeout : std_logic_vector(31 downto 0) := (others => '0');
   signal pin_in : std_logic := '0';

 	--Outputs
   signal pin_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: input_debounce PORT MAP (
          clk => clk,
          rst => rst,
          timeout => timeout,
          pin_in => pin_in,
          pin_out => pin_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '1';
      wait for 100 ns;	
		rst <= '0';

      wait for clk_period*10;
		wait for clk_period/8;
		
		
		
		timeout <= x"00000010";

      -- insert stimulus here
		wait for clk_period*2;
		
		pin_in <= '1';
		
		wait for 5 us;
		
		pin_in <= '0';
		
		wait for clk_period*2;
		
		--pin_in <= '1';
		

      wait;
   end process;

END;
