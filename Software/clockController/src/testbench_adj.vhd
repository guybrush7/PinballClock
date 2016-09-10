--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:39:20 03/19/2016
-- Design Name:   
-- Module Name:   J:/House/Projects/Clock/fpga/clockController/ise_files/testbench_adj.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fsm_adjust
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
 
ENTITY testbench_adj IS
END testbench_adj;
 
ARCHITECTURE behavior OF testbench_adj IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fsm_adjust
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         en_adj : IN  std_logic;
         btn_next : IN  std_logic;
         btn_inc : IN  std_logic;
         adjHourTen : OUT  std_logic;
         adjHourOne : OUT  std_logic;
         adjMinTen : OUT  std_logic;
         adjMinOne : OUT  std_logic;
         adjSecTen : OUT  std_logic;
         adjSecOne : OUT  std_logic;
         adjInc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en_adj : std_logic := '0';
   signal btn_next : std_logic := '0';
   signal btn_inc : std_logic := '0';

 	--Outputs
   signal adjHourTen : std_logic;
   signal adjHourOne : std_logic;
   signal adjMinTen : std_logic;
   signal adjMinOne : std_logic;
   signal adjSecTen : std_logic;
   signal adjSecOne : std_logic;
   signal adjInc : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fsm_adjust PORT MAP (
          clk => clk,
          rst => rst,
          en_adj => en_adj,
          btn_next => btn_next,
          btn_inc => btn_inc,
          adjHourTen => adjHourTen,
          adjHourOne => adjHourOne,
          adjMinTen => adjMinTen,
          adjMinOne => adjMinOne,
          adjSecTen => adjSecTen,
          adjSecOne => adjSecOne,
          adjInc => adjInc
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
		en_adj <= '1';
		
		wait for clk_period*10;
		
		btn_next <= '1';
		wait for clk_period;
		btn_next <= '0';
		wait for clk_period*5;

		btn_next <= '1';
		wait for clk_period;
		btn_next <= '0';
		wait for clk_period*5;

		btn_next <= '1';
		wait for clk_period;
		btn_next <= '0';
		wait for clk_period*5;

		btn_next <= '1';
		wait for clk_period;
		btn_next <= '0';
		wait for clk_period*5;

		btn_next <= '1';
		wait for clk_period;
		btn_next <= '0';
		wait for clk_period*5;

		btn_next <= '1';
		wait for clk_period;
		btn_next <= '0';
		wait for clk_period*5;

		btn_next <= '1';
		wait for clk_period;
		btn_next <= '0';
		wait for clk_period*5;

		btn_next <= '1';
		wait for clk_period;
		btn_next <= '0';
		wait for clk_period*5;

		btn_next <= '1';
		wait for clk_period;
		btn_next <= '0';
		wait for clk_period*5;

		btn_next <= '1';
		wait for clk_period;
		btn_next <= '0';
		wait for clk_period*5;
		
		en_adj <= '0';


      -- insert stimulus here 

      wait;
   end process;

END;
