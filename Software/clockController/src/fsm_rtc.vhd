----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:00 03/27/2016 
-- Design Name: 
-- Module Name:    fsm_rtc - Behavioral 
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

entity fsm_rtc is

	port (
		clk		: in 	std_logic;
		rst	: in	std_logic;
		
		-- spi interface
		ss		: out	std_logic;
		sclk	: out	std_logic;
		miso	: in 	std_logic;
		mosi	: out	std_logic;
		
		-- get/set interface
		load_sec_one	: in std_logic_vector (3 downto 0);
		load_sec_ten	: in std_logic_vector (3 downto 0);
		load_min_one	: in std_logic_vector (3 downto 0);
		load_min_ten	: in std_logic_vector (3 downto 0);
		load_hr_one		: in std_logic_vector (3 downto 0);
		load_hr_ten		: in std_logic_vector (3 downto 0);

		load_day_one	: in std_logic_vector (3 downto 0);
		load_day_ten	: in std_logic_vector (3 downto 0);
		load_mon_one	: in std_logic_vector (3 downto 0);
		load_mon_ten	: in std_logic_vector (3 downto 0);
		load_yr_one		: in std_logic_vector (3 downto 0);
		load_yr_ten		: in std_logic_vector (3 downto 0);
		
		sec_one		: out std_logic_vector (3 downto 0);
		sec_ten		: out std_logic_vector (3 downto 0);
		min_one		: out std_logic_vector (3 downto 0);
		min_ten		: out std_logic_vector (3 downto 0);
		hr_one		: out std_logic_vector (3 downto 0);
		hr_ten		: out std_logic_vector (3 downto 0);
		
		day_one		: out std_logic_vector (3 downto 0);
		day_ten		: out std_logic_vector (3 downto 0);
		mon_one		: out std_logic_vector (3 downto 0);
		mon_ten		: out std_logic_vector (3 downto 0);
		yr_one		: out std_logic_vector (3 downto 0);
		yr_ten		: out std_logic_vector (3 downto 0);
		
		-- command interface
		cmd_write	: in std_logic;
		cmd_read	: in std_logic;
		cmd_load	: in std_logic;
		
		ready		: out std_logic
		);

end fsm_rtc;

architecture Behavioral of fsm_rtc is

type rtc_spi_state is (	spi_ready, 
						spi_init,
						spi_start,
						spi_adv_byte,
						spi_wait,
						spi_read,
						spi_read_adv,
						spi_done
						);
						

						
type rtc_state is (	rtc_ready,
					rtc_wr_copy,
					rtc_wr_start,
					rtc_wr_wait,
					rtc_wr_done,
					rtc_rd_init,
					rtc_rd_start,
					rtc_rd_wait,
					rtc_rd_copy,
					rtc_rd_done
					);

constant MAX_REG : integer := 7;

type wr_reg_array_t is array (0 to MAX_REG) of std_logic_vector(7 downto 0);
type rd_reg_array_t is array (0 to MAX_REG) of std_logic_vector(7 downto 0);

signal wr_reg_array : wr_reg_array_t;
signal rd_reg_array : rd_reg_array_t;
					
						
signal state_spi	: rtc_spi_state;
signal state_rtc	: rtc_state;
						
signal en_spi		: std_logic;

signal wr_reg		: std_logic_vector(7 downto 0);
signal rd_reg		: std_logic_vector(7 downto 0);
signal spi_busy		: std_logic;

signal start_xfer	: std_logic;

signal reset_n		: std_logic;

signal cont_spi 	: std_logic;

signal read_spi		: std_logic;

signal idx_write	: integer range 0 to MAX_REG := 0;
signal idx_read		: integer range 0 to MAX_REG := 0;
						
begin

	reset_n <= not rst;

	spi_interface: entity work.spi_master
		generic map (
			slaves	=> 1,
			d_width => 8
			)
		port map (
			clock	=> clk,
			reset_n	=> reset_n,
			enable	=> en_spi,
			cpol	=> '0',
			cpha 	=> '1',
			cont	=> cont_spi,
			clk_div	=> 500,
			addr 	=> 0,
			tx_data	=> wr_reg,
			miso	=> miso,
			sclk	=> sclk,
			ss_n(0)	=> ss,
			mosi	=> mosi,
			busy	=> spi_busy,
			rx_data	=> rd_reg
		);
	
	
	proc_spi_fsm: process(clk, rst)
	begin
		if rst = '1' then
			state_spi <= spi_ready;
			idx_write <= 0;
			idx_read <= 0;
		elsif rising_edge(clk) then
			
			idx_write <= idx_write;
			idx_read <= idx_read;
			cont_spi <= cont_spi;
			state_spi <= state_spi;
			read_spi <= '0';
			
			case state_spi is
				when spi_ready =>
					if start_xfer = '1' then
						state_spi <= spi_init;
					end if;
				when spi_init =>
					idx_write <= 0;
					idx_read <= 0;
					cont_spi <= '1';
					state_spi <= spi_start;
				when spi_start =>
					state_spi <= spi_adv_byte;
				when spi_adv_byte =>
					-- advance write byte
					if (idx_write < MAX_REG) then
						idx_write <= idx_write + 1;
						cont_spi <= '1';
					else
						cont_spi <= '0';
					end if;
					
					state_spi <= spi_wait;
				when spi_wait =>
					if spi_busy = '0' then
						state_spi <= spi_read;
					end if;
				when spi_read =>
					-- enable readout of spi read reg
					read_spi <= '1';
					state_spi <= spi_read_adv;
					
				when spi_read_adv =>
					-- are we done?
					if cont_spi = '1' then
						-- move to next read byte
						idx_read <= idx_read + 1;
						-- go back and write/read a new byte
						state_spi <= spi_adv_byte;
					else
						state_spi <= spi_done;
					end if;
				
				when spi_done =>
					state_spi <= spi_ready;
					
				when others =>
					state_spi <= spi_ready;
			end case;
		
		end if;
	end process;
	
	-- copy result to read reg
	proc_read_reg: process(clk, rst)
	begin
		if rst = '1' then
			for i in 0 to MAX_REG loop
				rd_reg_array(i) <= (others => '0');
			end loop;
		elsif rising_edge(clk) then
			for i in 0 to MAX_REG loop
				rd_reg_array(i) <= rd_reg_array(i);
			end loop;
			
			if read_spi = '1' then
				rd_reg_array(idx_read) <= rd_reg;
			end if;
		
		end if;
	end process;
	
	-- index by idx_write won't simulate!!!!!
	wr_reg <= wr_reg_array(idx_write);
	
	-- initiate transfer during start state
	en_spi <= '1' when state_spi = spi_start else '0';
	
	
	proc_rtc_fsm: process(clk, rst)
	begin
		if rst = '1' then
			state_rtc <= rtc_ready;
			
		elsif rising_edge(clk) then
			
			state_rtc <= state_rtc;
			start_xfer <= '0';
			
			for i in 0 to MAX_REG loop
				wr_reg_array(i) <= wr_reg_array(i);
			end loop;
			
			case state_rtc is
				when rtc_ready =>
					if cmd_write = '1' then
						state_rtc <= rtc_wr_copy;
					end if;
					if cmd_read = '1' then
						state_rtc <= rtc_rd_init;
					end if;
				
				when rtc_wr_copy =>
					wr_reg_array(0) <= x"80";
					wr_reg_array(1) <= '0' & load_sec_ten(2 downto 0) & load_sec_one(3 downto 0);
					wr_reg_array(2) <= '0' & load_min_ten(2 downto 0) & load_min_one(3 downto 0);
					wr_reg_array(3) <= "000" & load_hr_ten(0 downto 0) & load_hr_one(3 downto 0);
					wr_reg_array(4) <= x"01";  -- day of week
					wr_reg_array(5) <= "00" & load_day_ten(1 downto 0) & load_day_one(3 downto 0);
					wr_reg_array(6) <= "000" & load_mon_ten(0) & load_mon_one(3 downto 0);
					wr_reg_array(7) <= load_yr_ten & load_yr_one;
				
					state_rtc <= rtc_wr_start;
				
				when rtc_wr_start =>
					start_xfer <= '1';
					state_rtc <= rtc_wr_wait;
				
				when rtc_wr_wait =>
					if state_spi = spi_done then
						state_rtc <= rtc_wr_done;
					end if;
				
				when rtc_wr_done =>
					state_rtc <= rtc_ready;
				
				when rtc_rd_init =>
					wr_reg_array(0) <= x"00";
					wr_reg_array(1) <= x"00";
					wr_reg_array(2) <= x"00";
					wr_reg_array(3) <= x"00";
					wr_reg_array(4) <= x"00";
					wr_reg_array(5) <= x"00";
					wr_reg_array(6) <= x"00";
					wr_reg_array(7) <= x"00";
				
					state_rtc <= rtc_rd_start;
				
				when rtc_rd_start =>
					start_xfer <= '1';
					state_rtc <= rtc_rd_wait;
				
				when rtc_rd_wait =>
					if state_spi = spi_done then
						state_rtc <= rtc_rd_done;
					end if;
				
				when rtc_rd_copy =>
					state_rtc <= rtc_rd_done;
				
				when rtc_rd_done =>
					state_rtc <= rtc_ready;
				
				when others =>
					state_rtc <= rtc_ready;
			end case;
		end if;
	end process;
	
	
	
	-- Define read outputs
	sec_one	<= rd_reg_array(1)(3 downto 0);
	sec_ten	<= '0' & rd_reg_array(1)(6 downto 4);
    min_one	<= rd_reg_array(2)(3 downto 0);
    min_ten	<= '0' & rd_reg_array(2)(6 downto 4);
	hr_one	<= rd_reg_array(3)(3 downto 0);
	hr_ten	<= "000" & rd_reg_array(3)(4 downto 4);
	
	day_one	<= rd_reg_array(5)(3 downto 0);
	day_ten	<= "00" & rd_reg_array(5)(5 downto 4);
	mon_one	<= rd_reg_array(6)(3 downto 0);
	mon_ten	<= "000" & rd_reg_array(6)(4);
	yr_one	<= rd_reg_array(7)(3 downto 0);
	yr_ten	<= rd_reg_array(7)(7 downto 4);
	

	-- rtc ready state
	ready <= '1' when state_rtc = rtc_ready else '0';


end Behavioral;















