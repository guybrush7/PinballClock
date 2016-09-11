----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    time_module - Behavioral 
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

entity time_module is
	port (
		-- system values
		clk		: in std_logic;
		rst		: in std_logic;
		
		-- Output values
		hourTen		: out std_logic_vector (3 downto 0);
		hourOne		: out std_logic_vector (3 downto 0);
		minTen		: out std_logic_vector (3 downto 0);
		minOne		: out std_logic_vector (3 downto 0);
		secTen		: out std_logic_vector (3 downto 0);
		secOne		: out std_logic_vector (3 downto 0);
		
		yearTen		: out std_logic_vector (3 downto 0);
		yearOne		: out std_logic_vector (3 downto 0);
		monTen		: out std_logic_vector (3 downto 0);
		monOne		: out std_logic_vector (3 downto 0);
		dayTen		: out std_logic_vector (3 downto 0);
		dayOne		: out std_logic_vector (3 downto 0);
		
		
		-- enable time
		en			: in std_logic;
		-- tick input
		pps			: in std_logic;
		
		-- Select digit to adjust
		adjHourTen	: in std_logic;
		adjHourOne	: in std_logic;
		adjMinTen	: in std_logic;
		adjMinOne	: in std_logic;
		adjSecTen	: in std_logic;
		adjSecOne	: in std_logic;
		
		adjYearTen	: in std_logic;
		adjYearOne	: in std_logic;
		adjMonTen	: in std_logic;
		adjMonOne	: in std_logic;
		adjDayTen	: in std_logic;
		adjDayOne	: in std_logic;
		
		-- Adjust up/down
		adjInc		: in std_logic;
		adjDec		: in std_logic;
		
		-- Digit values to load
		loadHourTen	: in std_logic_vector(3 downto 0);
		loadHourOne	: in std_logic_vector(3 downto 0);
		loadMinTen	: in std_logic_vector(3 downto 0);
		loadMinOne	: in std_logic_vector(3 downto 0);
		loadSecTen	: in std_logic_vector(3 downto 0);
		loadSecOne	: in std_logic_vector(3 downto 0);

		loadYearTen	: in std_logic_vector(3 downto 0);
		loadYearOne	: in std_logic_vector(3 downto 0);
		loadMonTen	: in std_logic_vector(3 downto 0);
		loadMonOne	: in std_logic_vector(3 downto 0);
		loadDayTen	: in std_logic_vector(3 downto 0);
		loadDayOne	: in std_logic_vector(3 downto 0);
		
		-- Load signal
		loadReady	: in std_logic;
		loadTime	: in std_logic
		
		
		);
end time_module;

architecture Behavioral of time_module is


-- Time registers
signal regSecOne		: std_logic_vector(3 downto 0);
signal regSecTen		: std_logic_vector(3 downto 0);
signal regMinOne		: std_logic_vector(3 downto 0);
signal regMinTen		: std_logic_vector(3 downto 0);
signal regHourOne		: std_logic_vector(3 downto 0);
signal regHourTen		: std_logic_vector(3 downto 0);

-- Date registers
signal regDayOne		: std_logic_vector(3 downto 0);
signal regDayTen		: std_logic_vector(3 downto 0);
signal regMonOne		: std_logic_vector(3 downto 0);
signal regMonTen		: std_logic_vector(3 downto 0);
signal regYearOne		: std_logic_vector(3 downto 0);
signal regYearTen		: std_logic_vector(3 downto 0);

-- Terminal flag
signal termSecOne		: std_logic;
signal termSecTen		: std_logic;
signal termMinOne		: std_logic;
signal termMinTen		: std_logic;
signal termHourOne		: std_logic;
signal termHourTen		: std_logic;

-- Tick signals
signal tickSecOne		: std_logic;
signal tickSecTen		: std_logic;
signal tickMinOne		: std_logic;
signal tickMinTen		: std_logic;
signal tickHourOne		: std_logic;
signal tickHourTen		: std_logic;

signal tickDayOne		: std_logic;
signal tickDayTen		: std_logic;
signal tickMonOne		: std_logic;
signal tickMonTen		: std_logic;
signal tickYearOne		: std_logic;
signal tickYearTen		: std_logic;

-- Control
signal hour_load		: std_logic;
signal hour_reset		: std_logic;

signal hourTenLoadVal	: std_logic_vector(3 downto 0);
signal hourOneLoadVal	: std_logic_vector(3 downto 0);

signal adjBlinkClock		: std_logic;
signal adjSegBlinking	: std_logic_vector(3 downto 0);


begin



	-- Time digit counters
	-- SECONDS
	count_sec_one: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => loadSecOne,
			q => regSecOne,
			term_cnt => "1001",
			en => tickSecOne,
			load => loadTime,
			term => termSecOne
			);
	count_sec_ten: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => loadSecTen,
			q => regSecTen,
			term_cnt => "0101",
			en => tickSecTen,
			load => loadTime,
			term => termSecTen
			);

	-- MINUTES
	count_min_one: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => loadMinOne,
			q => regMinOne,
			term_cnt => "1001",
			en => tickMinOne,
			load => loadTime,
			term => termMinOne
			);
	count_min_ten: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => loadMinTen,
			q => regMinTen,
			term_cnt => "0101",
			en => tickMinTen,
			load => loadTime,
			term => termMinTen
			);

	-- HOURS
	count_hour_one: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => hourOneLoadVal,
			q => regHourOne,
			term_cnt => "1001",
			en => tickHourOne,
			load => hour_load,
			term => termHourOne
			);
	count_hour_ten: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => hourTenLoadVal,
			q => regHourTen,
			term_cnt => "0010",
			en => tickHourTen,
			load => hour_load,
			term => termHourTen
			);
	
	-- Reset hours
	hour_reset <= '1' when regHourTen = "0001" and regHourOne = "0010" else '0';
	hour_load <= (hour_reset and tickHourOne) or loadTime;
	
	-- Switch hour load state
	hourTenLoadVal <= loadHourTen when loadReady = '1' else "0000";
	hourOneLoadVal <= loadHourOne when loadReady = '1' else "0001";
	
	-- Logic to tick next digit
	-- For all digits, enable if:
	--  1.) adj inc and adjust this digit
	--  2.) pps and digit before is incrementing and at terminal value
	-- For hour ten, also enable if hour_reset on 12 and ticking hour one
	tickSecOne		<= (adjSecOne and adjInc) or (pps and en);
	tickSecTen		<= (adjSecTen and adjInc) or (pps and tickSecOne and termSecOne);
	tickMinOne		<= (adjMinOne and adjInc) or (pps and tickSecTen and termSecTen);
	tickMinTen		<= (adjMinTen and adjInc) or (pps and tickMinOne and termMinOne);
	tickHourOne		<= (adjHourOne and adjInc) or (pps and tickMinTen and termMinTen);
	tickHourTen		<= (adjHourTen and adjInc) or (pps and tickHourOne and termHourOne) or (pps and tickHourOne and hour_reset);
	
	
		-- Adjust blinking clock
	blnk_clk: entity work.clk_pwm
		port map (
			clk => clk,
			rst => rst,
			N1 => x"00BEBC20",	-- 50%, 2Hz
			N2 => x"00BEBC20",	-- 50%, 2Hz
			clk_out => adjBlinkClock
			);

	
	-- Blinking while adjusting
	--adjBlinkClock <= pps;
	adjSegBlinking(3) <= adjBlinkClock;
	adjSegBlinking(2) <= adjBlinkClock;
	adjSegBlinking(1) <= adjBlinkClock;
	adjSegBlinking(0) <= adjBlinkClock;
	
	-- Time outputs
	hourTen 	<= regHourTen when (adjHourTen = '0') else (regHourTen or adjSegBlinking);
	hourOne 	<= regHourOne when (adjHourOne = '0') else (regHourOne or adjSegBlinking);
	minTen 		<= regMinTen when (adjMinTen = '0') else (regMinTen or adjSegBlinking);
	minOne 		<= regMinOne when (adjMinOne = '0') else (regMinOne or adjSegBlinking);
	secTen 		<= regSecTen when (adjSecTen = '0') else (regSecTen or adjSegBlinking);
	secOne 		<= regSecOne when (adjSecOne = '0') else (regSecOne or adjSegBlinking);

	-- Date outputs
	yearTen 	<= regYearTen when (adjYearTen = '0') else (regYearTen or adjSegBlinking);
	yearOne 	<= regYearOne when (adjYearOne = '0') else (regYearOne or adjSegBlinking);
	monTen 		<= regMonTen when (adjMonTen = '0') else (regMonTen or adjSegBlinking);
	monOne 		<= regMonOne when (adjMonOne = '0') else (regMonOne or adjSegBlinking);
	dayTen 		<= regDayTen when (adjDayTen = '0') else (regDayTen or adjSegBlinking);
	dayOne 		<= regDayOne when (adjDayOne = '0') else (regDayOne or adjSegBlinking);
	

	
	-- Date digit counters
	-- DAYS
	count_day_one: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => loadDayOne,
			q => regDayOne,
			term_cnt => "1001",
			en => tickDayOne,
			load => loadTime,
			term => open
			);
	count_day_ten: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => loadDayTen,
			q => regDayTen,
			term_cnt => "0011",
			en => tickDayTen,
			load => loadTime,
			term => open
			);
	
	-- MONTHS
	count_mon_one: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => loadMonOne,
			q => regMonOne,
			term_cnt => "1001",
			en => tickMonOne,
			load => loadTime,
			term => open
			);
	count_mon_ten: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => loadMonTen,
			q => regMonTen,
			term_cnt => "0001",
			en => tickMonTen,
			load => loadTime,
			term => open
			);

	-- YEARS
	count_year_one: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => loadYearOne,
			q => regYearOne,
			term_cnt => "1001",
			en => tickYearOne,
			load => loadTime,
			term => open
			);
	count_year_ten: entity work.bcd_counter
		port map (
			clk => clk,
			rst => rst,
			d => loadYearTen,
			q => regYearTen,
			term_cnt => "1001",
			en => tickYearTen,
			load => loadTime,
			term => open
			);


	-- Logic to tick date digits
	-- Spoiler alert: they don't actually tick, just controlled by buttons
	-- Only updated when loading the rtc
	tickDayOne		<= (adjDayOne and adjInc);
	tickDayTen		<= (adjDayTen and adjInc);
	tickMonOne		<= (adjMonOne and adjInc);
	tickMonTen		<= (adjMonTen and adjInc);
	tickYearOne		<= (adjYearOne and adjInc);
	tickYearTen		<= (adjYearTen and adjInc);
			




end Behavioral;










