----------------------------------------------------------------------------------
-- Mojo_top VHDL
-- Translated from Mojo-base Verilog project @ http://embeddedmicro.com/frontend/files/userfiles/files/Mojo-Base.zip
-- by Xark
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity mojo_top is
	port (
		clk			: in  std_logic;		-- 50Mhz clock
		rst_n		: in  std_logic;		-- "reset" button input (negative logic)
		cclk		: in  std_logic;		-- configuration clock (?) from AVR (to detect when AVR ready)
		led			: out std_logic_vector(7 downto 0);	 -- 8 LEDs on Mojo board
		spi_sck		: in  std_logic;		-- SPI clock to from AVR
		spi_ss		: in  std_logic;		-- SPI slave select from AVR
		spi_mosi	: in  std_logic;		-- SPI serial data master out, slave in (AVR -> FPGA)
		spi_miso	: out std_logic;		-- SPI serial data master in, slave out (AVR <- FPGA)
		spi_channel : out std_logic_vector(3 downto 0);  -- analog read channel (input to AVR service task)
		avr_tx		: in  std_logic;		-- serial data transmited from AVR/USB (FPGA recieve)
		avr_rx		: out std_logic;		-- serial data for AVR/USB to receive (FPGA transmit)
		avr_rx_busy : in  std_logic;			-- AVR/USB buffer full (don't send data when true)
		
		
		-- Right
		L64P_0		: in std_logic;	-- Pin 39
		L65P_0		: in std_logic;	-- Pin 37
		L66P_0		: in std_logic;	-- Pin 35
		L1P_1			: in std_logic;	-- Pin 33
		L32P_1		: in std_logic;	-- Pin 31
		L33P_1		: in std_logic;	-- Pin 29
		L34P_1		: in std_logic;	-- Pin 27
		L40P_1		: out std_logic;	-- Pin 25
		L41P_1		: in std_logic;	-- Pin 23
		L42P_1		: out std_logic;	-- Pin 21
		L43P_1		: out std_logic;	-- Pin 19
		L45P_1		: out std_logic;	-- Pin 17
		L46P_1		: out std_logic;	-- Pin 15
		L47P_1		: out std_logic;	-- Pin 13
		L74P_1		: out std_logic;	-- Pin 11
		L2P_2			: out std_logic;	-- Pin 9
		L14P_2		: out std_logic;	-- Pin 7
		
		L64N_0		: out std_logic;	-- Pin 40
		L65N_0		: out std_logic;	-- Pin 38
		L66N_0		: out std_logic;	-- Pin 36
		L1N_1			: out std_logic;	-- Pin 34
		L32N_1		: out std_logic;	-- Pin 32
		L33N_1		: out std_logic;	-- Pin 30
		L34N_1		: out std_logic;	-- Pin 28
		L40N_1		: out std_logic;	-- Pin 26
		L41N_1		: out std_logic;	-- Pin 24
		L42N_1		: out std_logic;	-- Pin 22
		L43N_1		: out std_logic;	-- Pin 20
		L45N_1		: out std_logic;	-- Pin 18
		L46N_1		: out std_logic;	-- Pin 16
		L47N_1		: out std_logic;	-- Pin 14
		L74N_1		: out std_logic;	-- Pin 12
		L2N_2			: out std_logic;	-- Pin 10
		L14N_2		: out std_logic;	-- Pin 8
		
		-- Left
		L3P_0			: in std_logic;	-- Pin 39
		L2P_0			: in std_logic;	-- Pin 37
		L1P_0			: in std_logic;	-- Pin 35
		L83P_3		: in std_logic;	-- Pin 33
		L52P_3		: in std_logic;	-- Pin 31
		L51P_3		: in std_logic;	-- Pin 29
		L50P_3		: in std_logic;	-- Pin 27
		L49P_3		: out std_logic;	-- Pin 25
		L44P_3		: in std_logic;	-- Pin 23
		L43P_3		: out std_logic;	-- Pin 21
		L42P_3		: out std_logic;	-- Pin 19
		L41P_3		: out std_logic;	-- Pin 17
		L37P_3		: out std_logic;	-- Pin 15
		L36P_3		: out std_logic;	-- Pin 13
		L2P_3			: out std_logic;	-- Pin 11
		L1P_3			: out std_logic;	-- Pin 9
		L64P_2		: out std_logic;	-- Pin 7
		L31P_2		: out std_logic;	-- Pin 5
		
		L3N_0			: out std_logic;	-- Pin 40
		L2N_0			: out std_logic;	-- Pin 38
		L1N_0			: out std_logic;	-- Pin 36
		L83N_3		: out std_logic;	-- Pin 34
		L52N_3		: out std_logic;	-- Pin 32
		L51N_3		: out std_logic;	-- Pin 30
		L50N_3		: out std_logic;	-- Pin 28
		L49N_3		: out std_logic;	-- Pin 26
		L44N_3		: out std_logic;	-- Pin 24
		L43N_3		: out std_logic;	-- Pin 22
		L42N_3		: out std_logic;	-- Pin 20
		L41N_3		: out std_logic;	-- Pin 18
		L37N_3		: out std_logic;	-- Pin 16
		L36N_3		: out std_logic;	-- Pin 14
		L2N_3			: out std_logic;	-- Pin 12
		L1N_3			: out std_logic;	-- Pin 10
		L64N_2		: out std_logic;	-- Pin 8
		L31N_2		: out std_logic  -- Pin 6
		

	);
end mojo_top;

architecture RTL of mojo_top is

signal rst	: std_logic;		-- reset signal (rst_n inverted for postive logic)

-- signals for avr_interface
signal channel			: std_logic_vector(3 downto 0);
signal sample			: std_logic_vector(9 downto 0);
signal sample_channel	: std_logic_vector(3 downto 0);
signal new_sample		: std_logic;
signal tx_data			: std_logic_vector(7 downto 0);
signal rx_data			: std_logic_vector(7 downto 0);
signal new_tx_data		: std_logic;
signal new_rx_data		: std_logic;
signal tx_busy			: std_logic;

-- signals for UART echo test
signal uart_data		: std_logic_vector(7 downto 0);	-- data buffer for UART (holds last recieved/sent byte)
signal data_to_send		: std_logic;					-- indicates data to send in uart_data

-- signals for sample test
signal last_sample		: std_logic_vector(9 downto 0);

-- clock signals
signal pps			: std_logic;
signal blank_clk	: std_logic;

-- Named I/O
-- Inputs - time display
signal INPUT3		: std_logic;
signal INPUT2		: std_logic;
signal INPUT1		: std_logic;
signal BUTTON3		: std_logic;
signal BUTTON2		: std_logic;
signal BUTTON1		: std_logic;
signal SWITCH		: std_logic;
-- Inputs (extra) - date display
signal AUXIN7		: std_logic;
signal AUXIN6		: std_logic;
signal AUXIN5		: std_logic;
signal AUXIN4		: std_logic;
signal AUXIN3		: std_logic;
signal AUXIN2		: std_logic;
signal AUXIN1		: std_logic;

-- Outputs
signal Aleft		: std_logic_vector(3 downto 0);
signal Bleft		: std_logic_vector(3 downto 0);
signal Cleft		: std_logic_vector(3 downto 0);
signal Dleft		: std_logic_vector(3 downto 0);
signal Eleft		: std_logic_vector(3 downto 0);
signal Fleft		: std_logic_vector(3 downto 0);
signal Aright		: std_logic_vector(3 downto 0);
signal Bright		: std_logic_vector(3 downto 0);
signal Cright		: std_logic_vector(3 downto 0);
signal Dright		: std_logic_vector(3 downto 0);
signal Eright		: std_logic_vector(3 downto 0);
signal Fright		: std_logic_vector(3 downto 0);
signal BLANK		: std_logic;


-- SPI
signal RTC_SPI_CLK	: std_logic;
signal RTC_SPI_MISO	: std_logic;
signal RTC_SPI_MOSI	: std_logic;
signal RTC_SPI_SS	: std_logic;


-- Time digits
signal digHourTen		: std_logic_vector(3 downto 0);
signal digHourOne		: std_logic_vector(3 downto 0);
signal digMinTen		: std_logic_vector(3 downto 0);
signal digMinOne		: std_logic_vector(3 downto 0);
signal digSecTen		: std_logic_vector(3 downto 0);
signal digSecOne		: std_logic_vector(3 downto 0);

signal digYearTen		: std_logic_vector(3 downto 0);
signal digYearOne		: std_logic_vector(3 downto 0);
signal digMonTen		: std_logic_vector(3 downto 0);
signal digMonOne		: std_logic_vector(3 downto 0);
signal digDayTen		: std_logic_vector(3 downto 0);
signal digDayOne		: std_logic_vector(3 downto 0);


-- Adjust signals
signal adjHourTen		: std_logic;
signal adjHourOne		: std_logic;
signal adjMinTen		: std_logic;
signal adjMinOne		: std_logic;
signal adjSecTen		: std_logic;
signal adjSecOne		: std_logic;

signal adjYearTen		: std_logic;
signal adjYearOne		: std_logic;
signal adjMonTen		: std_logic;
signal adjMonOne		: std_logic;
signal adjDayTen		: std_logic;
signal adjDayOne		: std_logic;

signal adjInc			: std_logic;
signal adjDec			: std_logic;

-- RTC readback
signal rtcHourTen		: std_logic_vector(3 downto 0);
signal rtcHourOne		: std_logic_vector(3 downto 0);
signal rtcMinTen		: std_logic_vector(3 downto 0);
signal rtcMinOne		: std_logic_vector(3 downto 0);
signal rtcSecTen		: std_logic_vector(3 downto 0);
signal rtcSecOne		: std_logic_vector(3 downto 0);

signal rtcYearTen		: std_logic_vector(3 downto 0);
signal rtcYearOne		: std_logic_vector(3 downto 0);
signal rtcMonTen		: std_logic_vector(3 downto 0);
signal rtcMonOne		: std_logic_vector(3 downto 0);
signal rtcDayTen		: std_logic_vector(3 downto 0);
signal rtcDayOne		: std_logic_vector(3 downto 0);

signal rtc_ready		: std_logic;

signal rtc_cmd_write	: std_logic;
signal rtc_cmd_read		: std_logic;
signal rtc_cmd_load		: std_logic;

signal rtc_refresh		: std_logic;
signal tod_loadReady	: std_logic;
signal tod_loadTime		: std_logic;

-- Derived inputs
signal sw_adj_db		: std_logic;
signal btn_next_db		: std_logic;
signal btn_inc_db		: std_logic;
signal btn_next_once	: std_logic;
signal btn_inc_once		: std_logic;

-- Synchronized inputs
signal INPUT3_SYNC		: std_logic;
signal INPUT2_SYNC		: std_logic;
signal INPUT1_SYNC		: std_logic;
signal BUTTON3_SYNC		: std_logic;
signal BUTTON2_SYNC		: std_logic;
signal BUTTON1_SYNC		: std_logic;
signal SWITCH_SYNC		: std_logic;

signal debug1: std_logic;
signal debug2: std_logic;


begin

rst	<= NOT rst_n;						-- generate non-inverted reset signal from rst_n button

-- NOTE: If you are not using the avr_interface component, then you should uncomment the
--       following lines to keep the AVR output lines in a high-impeadence state.  When
--       using the avr_interface, this will be done automatically and these lines should
--       be commented out (or else "multiple signals connected to output" errors).
spi_miso <= 'Z';						-- keep AVR output lines high-Z
avr_rx <= 'Z';						-- keep AVR output lines high-Z
spi_channel <= "ZZZZ";				-- keep AVR output lines high-Z


	-- 1 PPS clock for driving the time
	pps_clk: entity work.clk_div_pulse
		port map (
			clk => clk,
			rst => rst,
			N => x"02FAF080",    -- 50M, 1Hz
			--N => x"017D7840", 	-- 25M, 2Hz
			--N => x"002625A0",  -- 2.5M, 20Hz
			--N => x"0003D090",  -- 250k, 200Hz
			clk_out => pps
			);

	-- Blanking clock
	blnk_clk: entity work.clk_pwm
		port map (
			clk => clk,
			rst => rst,
			--N1 => x"000000FA",
			--N2 => x"000000FA",
			--N1 => x"000001C2",	-- 10%, 100kHz
			--N2 => x"00000032",
			N1 => x"0000AFC8",	-- 10%, 1kHz
			N2 => x"00001388",
			clk_out => blank_clk
			);
	
	
	-- Time module
	timemod: entity work.time_module
		port map (
			clk		=> clk,
			rst		=> rst,
			hourTen	=> digHourTen,
			hourOne	=> digHourOne,
			minTen	=> digMinTen,
			minOne	=> digMinOne,
			secTen	=> digSecTen,
			secOne	=> digSecOne,
			yearTen	=> digYearTen,	
			yearOne	=> digYearOne,	
			monTen	=> digMonTen,
			monOne	=> digMonOne,
			dayTen	=> digDayTen,
			dayOne	=> digDayOne,
			en			=> '1',
			pps			=> pps,
			adjHourTen	=> adjHourTen,
			adjHourOne	=> adjHourOne,
			adjMinTen	=> adjMinTen,
			adjMinOne	=> adjMinOne,
			adjSecTen	=> adjSecTen,
			adjSecOne	=> adjSecOne,
			adjYearTen	=> adjYearTen,
			adjYearOne	=> adjYearOne,
			adjMonTen	=> adjMonTen,
			adjMonOne	=> adjMonOne,
			adjDayTen	=> adjDayTen,
			adjDayOne	=> adjDayOne,
			adjInc		=> adjInc,
			adjDec		=> '0',
			loadHourTen	=> rtcHourTen,
			loadHourOne	=> rtcHourOne,	
			loadMinTen	=> rtcMinTen,	
			loadMinOne	=> rtcMinOne,	
			loadSecTen	=> rtcSecTen,	
			loadSecOne	=> rtcSecOne,
			loadYearTen	=> rtcYearTen,
			loadYearOne	=> rtcYearOne,
			loadMonTen	=> rtcMonTen,
			loadMonOne	=> rtcMonOne,
			loadDayTen	=> rtcDayTen,
			loadDayOne	=> rtcDayOne,
			
			-- Load signal
			loadReady	=> tod_loadReady,
			loadTime	=> tod_loadTime
			);

	-- adjustment
	adjmod: entity work.fsm_adjust
		port map (
			clk		=> clk,
			rst		=> rst,
			en_adj	=> sw_adj_db,
			btn_next	=> btn_next_once,
			btn_inc	=> btn_inc_once,
			adjHourTen	=> adjHourTen,
			adjHourOne	=> adjHourOne,
			adjMinTen	=> adjMinTen,
			adjMinOne	=> adjMinOne,
			adjSecTen	=> adjSecTen,
			adjSecOne	=> adjSecOne,
			adjInc		=> adjInc,
			adjYearTen	=> adjYearTen,
			adjYearOne	=> adjYearOne,
			adjMonTen	=> adjMonTen,
			adjMonOne	=> adjMonOne,
			adjDayTen	=> adjDayTen,
			adjDayOne	=> adjDayOne

			);
	
	
	
	-- RTC
	rtcmod: entity work.fsm_rtc
		port map (
			clk				=> clk,
			rst				=> rst,
			
			ss				=> RTC_SPI_SS,
			sclk			=> RTC_SPI_CLK,
			miso			=> RTC_SPI_MISO,
			mosi			=> RTC_SPI_MOSI,
			
			load_sec_one	=> digSecOne,
			load_sec_ten	=> digSecTen,
			load_min_one	=> digMinOne,
			load_min_ten	=> digMinTen,
			load_hr_one		=> digHourOne,
			load_hr_ten		=> digHourTen,
			
			load_day_one	=> digDayOne,
			load_day_ten	=> digDayTen,
			load_mon_one	=> digMonOne,
			load_mon_ten	=> digMonTen,
			load_yr_one		=> digYearOne,
			load_yr_ten		=> digYearTen,
			
			sec_one			=> rtcSecOne,
			sec_ten			=> rtcSecTen,
			min_one			=> rtcMinOne,
			min_ten			=> rtcMinTen,
			hr_one			=> rtcHourOne,
			hr_ten			=> rtcHourTen,
			
			day_one			=> rtcDayOne,
			day_ten			=> rtcDayTen,
			mon_one			=> rtcMonOne,
			mon_ten			=> rtcMonTen,
			yr_one			=> rtcYearOne,
			yr_ten			=> rtcYearTen,
			
			
			cmd_write		=> rtc_cmd_write,
			cmd_read		=> rtc_cmd_read,
			cmd_load		=> rtc_cmd_load,
			
			ready			=> rtc_ready
			);	

	
	rtc_refresh <= btn_next_once and (not sw_adj_db);
	
	
	-- Main state
	mainstate: entity work.fsm_main
		port map (
			clk			=> clk,
			rst			=> rst,
			
			pps			=> pps,
			refresh_rtc	=> rtc_refresh,
			adj_en		=> sw_adj_db,
			
			rtc_ready	=> rtc_ready,
			
			cmd_write	=> rtc_cmd_write,
			cmd_read	=> rtc_cmd_read,
			cmd_load	=> rtc_cmd_load,
			
			load_tod	=> tod_loadTime,
			load_ready	=> tod_loadReady
		);
	
	
	-- Control inputs
	syncIn: entity work.input_sync
		port map (
			clk 			=> clk,
			rst			=> rst,
			pin_in(0)	=> INPUT3,
			pin_in(1)	=> INPUT2,
			pin_in(2)	=> INPUT1,
			pin_in(3)	=> BUTTON3,
			pin_in(4)	=> BUTTON2,
			pin_in(5)	=> BUTTON1,
			pin_in(6)	=> SWITCH,
			pin_out(0)	=> INPUT3_SYNC,
			pin_out(1)	=> INPUT2_SYNC,
			pin_out(2)	=> INPUT1_SYNC,
			pin_out(3)	=> BUTTON3_SYNC,
			pin_out(4)	=> BUTTON2_SYNC,
			pin_out(5)	=> BUTTON1_SYNC,
			pin_out(6)	=> SWITCH_SYNC
		);
	
	db1: entity work.input_debounce
		port map (
			clk		=> clk,
			rst		=> rst,
			timeout	=> x"002625A0", -- 2.5M @ 50MHz = 50ms
			pin_in	=> BUTTON1_SYNC,
			pin_out	=> btn_next_db
		);
	
	db2: entity work.input_debounce
		port map (
			clk		=> clk,
			rst		=> rst,
			timeout	=> x"002625A0", -- 2.5M @ 50MHz = 50ms
			pin_in	=> BUTTON2_SYNC,
			pin_out	=> btn_inc_db
		);

	sw1: entity work.input_debounce
		port map (
			clk		=> clk,
			rst		=> rst,
			timeout	=> x"002625A0", -- 2.5M @ 50MHz = 50ms
			pin_in	=> SWITCH_SYNC,
			pin_out	=> sw_adj_db
		);
		
	fall1: entity work.falling_edge_det
		port map (
			clk	=> clk,
			rst	=> rst,
			D		=> btn_next_db,
			Q		=> btn_next_once
		);
			
	fall2: entity work.falling_edge_det
		port map (
			clk	=> clk,
			rst	=> rst,
			D		=> btn_inc_db,
			Q		=> btn_inc_once
		);
	
		
	-- Map time/date to digits
	Fleft <= digSecOne;
	Eleft <= digSecTen;
	Dleft <= digMinOne;
	Cleft <= digMinTen;
	Bleft <= digHourOne;
	Aleft <= digHourTen;

	Fright <= digYearOne;
	Eright <= digYearTen;
	Dright <= digDayOne;
	Cright <= digDayTen;
	Bright <= digMonOne;
	Aright <= digMonTen;

	
	-- temp
	--BLANK <= blank_clk;
	BLANK <= (blank_clk and INPUT3) or (not INPUT2);


		--led(5 downto 0) <= "000000";
		--led(7) <= L65P_0 or L66P_0 or L1P_1 or L32P_1 or L33P_1 or L34P_1 or L2P_0 or L1P_0 or L83P_3 or L52P_3 or L51P_3 or L50P_3;
		led(7) <= adjHourTen;
		led(6) <= adjHourOne;
		led(5) <= adjMinTen;
		led(4) <= adjMinOne;
		--led(3) <= adjSecTen;
		--led(2) <= adjSecOne;
		led(3) <= tod_loadReady;
		led(2) <= rtc_ready;
		led(1) <= btn_inc_once;
		led(0) <= btn_next_once;
		
		
--		led(0) <= BUTTON1;
--		led(4) <= btn_next_db;
--		led(3) <= btn_inc_once;
--		led(2) <= btn_next_once;
--		led(1) <= sw_adj_db;
--		led(0) <= '0';
		
		
	-- Pair real pins with names
	
	-- Left twix
	INPUT3		<= L3P_0;
	INPUT2		<= L2P_0;
	INPUT1		<= L1P_0;
	BUTTON3		<= L83P_3;
	BUTTON2		<= L52P_3;
	BUTTON1		<= L51P_3;
	SWITCH		<= L50P_3;
	L49P_3		<= RTC_SPI_CLK;
	RTC_SPI_MISO <= L44P_3;
	L43P_3		<= Aleft(0);
	L42P_3		<= Aleft(3);
	L41P_3		<= Aleft(2);
	L37P_3		<= Aleft(1);
	L36P_3		<= Bleft(0);
	L2P_3		<= Bleft(3);
	L1P_3		<= Bleft(2);
	L64P_2		<= Bleft(1);
	L31P_2		<= RTC_SPI_MOSI;

	L3N_0		<= Fleft(1);
	L2N_0		<= Fleft(2);
	L1N_0		<= Fleft(3);
	L83N_3		<= Fleft(0);
	L52N_3		<= Eleft(1);
	L51N_3		<= Eleft(2);
	L50N_3		<= Eleft(3);
	L49N_3		<= Eleft(0);
	L44N_3		<= Dleft(1);
	L43N_3		<= Dleft(2);
	L42N_3		<= Dleft(3);
	L41N_3		<= Dleft(0);
	L37N_3		<= Cleft(1);
	L36N_3		<= Cleft(2);
	L2N_3		<= Cleft(3);
	L1N_3		<= Cleft(0);
	L64N_2		<= BLANK;
	L31N_2		<= RTC_SPI_SS;
		
	-- Right twix
	-- Extra input pins, commented to avoid warnings for unused signals
	--AUXIN7		<= L64P_0;
	--AUXIN6		<= L65P_0;
	--AUXIN5		<= L66P_0;
	--AUXIN4		<= L1P_1;
	--AUXIN3		<= L32P_1;
	--AUXIN2		<= L33P_1;
	--AUXIN1		<= L34P_1;
	
	L40P_1 		<= '0';	-- spi clk
	
	L42P_1		<= Aright(0);
	L43P_1		<= Aright(3);
	L45P_1		<= Aright(2);
	L46P_1		<= Aright(1);
	L47P_1		<= Bright(0);
	L74P_1		<= Bright(3);
	L2P_2		<= Bright(2);
	L14P_2		<= Bright(1);

	L64N_0		<= Fright(1);
	L65N_0		<= Fright(2);
	L66N_0		<= Fright(3);
	L1N_1		<= Fright(0);
	L32N_1		<= Eright(1);
	L33N_1		<= Eright(2);
	L34N_1		<= Eright(3);
	L40N_1		<= Eright(0);
	L41N_1		<= Dright(1);
	L42N_1		<= Dright(2);
	L43N_1		<= Dright(3);
	L45N_1		<= Dright(0);
	L46N_1		<= Cright(1);
	L47N_1		<= Cright(2);
	L74N_1		<= Cright(3);
	L2N_2		<= Cright(0);
	L14N_2		<= BLANK;
		

end RTL;






--begin
--	if rst = '1' then									-- set signals to default on reset
--		tx_data		<= (others => '0');
--		uart_data	<= (others => '0');
--		data_to_send <= '0';
--		new_tx_data <= '0';
--		channel <= "0000";									-- use channel 0 for this test
--		last_sample <= (others => '0');
--		led <= "11111111";									-- flash LEDs on reset
--	elsif rising_edge(clk) then
--		if data_to_send = '1' and tx_busy = '0' then	-- if there is data to send and UART is not busy then
--			tx_data <= uart_data;							-- set tx_data input
--			new_tx_data <= '1';								-- signal there is data to tx



---- instantiate the avr_interface (to handle USB UART and analog sampling, etc.)
--avr_interface : entity work.avr_interface
--	port map (
--		clk			=> clk,				-- 50Mhz clock
--		rst			=> rst,				-- reset signal
--		-- AVR MCU pin connections (that will be managed)
--		cclk		=> cclk,
--		spi_miso	=> spi_miso,
--		spi_mosi	=> spi_mosi,
--		spi_sck		=> spi_sck,
--		spi_ss		=> spi_ss,
--		spi_channel	=> spi_channel,
--		tx			=> avr_rx,
--		tx_block	=> avr_rx_busy,
--		rx			=> avr_tx,
--		-- analog sample interface
--		channel		=> channel,			-- set this to channel to sample (0, 1, 4, 5, 6, 7, 8, or 9)
--		new_sample	=> new_sample,		-- indicates when new sample available
--		sample_channel => sample_channel,	-- channel number of sample (only when new_sample = '1')
--		sample		=> sample,			-- 10 bit sample value (only when new_sample = '1')
--		-- USB UART tx interface
--		new_tx_data	=> new_tx_data,		-- set to set data in tx_data (only when tx_busy = '0')
--		tx_data		=> tx_data,			-- data to send
--		tx_busy		=> tx_busy,			-- indicates AVR is not ready to send data
--		-- USB UART rx interface
--		new_rx_data	=> new_rx_data,		-- set when new data is received
--		rx_data		=> rx_data			-- received data (only when new_tx_data = '1')
--	);

---- The following is simple test that will transmit any bytes received on UART and show upper 8-bits of analog 0 sample on LEDs
--echo: process(clk, rst)
--begin
--	if rst = '1' then									-- set signals to default on reset
--		tx_data		<= (others => '0');
--		uart_data	<= (others => '0');
--		data_to_send <= '0';
--		new_tx_data <= '0';
--		channel <= "0000";									-- use channel 0 for this test
--		last_sample <= (others => '0');
--		led <= "11111111";									-- flash LEDs on reset
--	elsif rising_edge(clk) then
--		if data_to_send = '1' and tx_busy = '0' then	-- if there is data to send and UART is not busy then
--			tx_data <= uart_data;							-- set tx_data input
--			new_tx_data <= '1';								-- signal there is data to tx
--			data_to_send <= '0';							-- clear our send flag
--		else
--			new_tx_data <= '0';							-- else, we have no new tx data
--		end if;
--
--		if new_rx_data = '1' then						-- if there is new received data then
--			uart_data <= rx_data;							-- put it into uart_data register
--			data_to_send <= '1';							-- set flag that we have data to send
--		end if;
--		
--		if new_sample = '1' then						-- if there is a new sample available then
--			last_sample <= sample;							-- put it into last_sample register
--		end if;
--		
--		led <= last_sample(9 downto 2);					-- display upper 8-bits of last 10-bit analog sample reading
--	end if;
--end process echo;




