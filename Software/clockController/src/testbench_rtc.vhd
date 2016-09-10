--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:25:48 04/07/2016
-- Design Name:   
-- Module Name:   J:/House/Projects/Clock/fpga/clockController/src/testbench_rtc.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fsm_rtc
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
 
ENTITY testbench_rtc IS
END testbench_rtc;
 
ARCHITECTURE behavior OF testbench_rtc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fsm_rtc
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ss : OUT  std_logic;
         sclk : OUT  std_logic;
         miso : IN  std_logic;
         mosi : OUT  std_logic;
         load_sec_one : IN  std_logic_vector(3 downto 0);
         load_sec_ten : IN  std_logic_vector(3 downto 0);
         load_min_one : IN  std_logic_vector(3 downto 0);
         load_min_ten : IN  std_logic_vector(3 downto 0);
         load_hr_one : IN  std_logic_vector(3 downto 0);
         load_hr_ten : IN  std_logic_vector(3 downto 0);
         sec_one : OUT  std_logic_vector(3 downto 0);
         sec_ten : OUT  std_logic_vector(3 downto 0);
         min_one : OUT  std_logic_vector(3 downto 0);
         min_ten : OUT  std_logic_vector(3 downto 0);
         hr_one : OUT  std_logic_vector(3 downto 0);
         hr_ten : OUT  std_logic_vector(3 downto 0);
         cmd_write : IN  std_logic;
         cmd_read : IN  std_logic;
         cmd_load : IN  std_logic;
         ready : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal miso : std_logic := '0';
   signal load_sec_one : std_logic_vector(3 downto 0) := (others => '0');
   signal load_sec_ten : std_logic_vector(3 downto 0) := (others => '0');
   signal load_min_one : std_logic_vector(3 downto 0) := (others => '0');
   signal load_min_ten : std_logic_vector(3 downto 0) := (others => '0');
   signal load_hr_one : std_logic_vector(3 downto 0) := (others => '0');
   signal load_hr_ten : std_logic_vector(3 downto 0) := (others => '0');
   signal cmd_write : std_logic := '0';
   signal cmd_read : std_logic := '0';
   signal cmd_load : std_logic := '0';

 	--Outputs
   signal ss : std_logic;
   signal sclk : std_logic;
   signal mosi : std_logic;
   signal sec_one : std_logic_vector(3 downto 0);
   signal sec_ten : std_logic_vector(3 downto 0);
   signal min_one : std_logic_vector(3 downto 0);
   signal min_ten : std_logic_vector(3 downto 0);
   signal hr_one : std_logic_vector(3 downto 0);
   signal hr_ten : std_logic_vector(3 downto 0);
   signal ready : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant sclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fsm_rtc PORT MAP (
          clk => clk,
          rst => rst,
          ss => ss,
          sclk => sclk,
          miso => miso,
          mosi => mosi,
          load_sec_one => load_sec_one,
          load_sec_ten => load_sec_ten,
          load_min_one => load_min_one,
          load_min_ten => load_min_ten,
          load_hr_one => load_hr_one,
          load_hr_ten => load_hr_ten,
          sec_one => sec_one,
          sec_ten => sec_ten,
          min_one => min_one,
          min_ten => min_ten,
          hr_one => hr_one,
          hr_ten => hr_ten,
          cmd_write => cmd_write,
          cmd_read => cmd_read,
          cmd_load => cmd_load,
          ready => ready
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
--   sclk_process :process
--   begin
--		sclk <= '0';
--		wait for sclk_period/2;
--		sclk <= '1';
--		wait for sclk_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		cmd_write <= '1';
		
		wait for clk_period;
		
		cmd_write <= '0';
		

      wait;
   end process;

END;
