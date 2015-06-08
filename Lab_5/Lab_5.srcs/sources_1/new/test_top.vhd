----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2015 12:45:24 PM
-- Design Name: 
-- Module Name: test_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity test_top is
PORT(
	clk 		 : in std_logic;
	adc_in		 : in std_logic;
	spi_sclk_out : out std_logic := '0';
	dac_spi_sclk_out : out std_logic := '0';
	sync_out	 : out std_logic := '0';    
	CS_out 		 : out std_logic := '0';
	dac_out		 : out std_logic := '0';
	sample_clk_out : out std_logic := '0'
	);  
end test_top;

architecture Behavioral of test_top is
	COMPONENT clk_wiz_0 is
	port (
		-- Clock in ports
		cm_clkin          	 : in     std_logic;
		-- Clock out ports
		cm_clkout1			 : out    std_logic;
		-- Status and control signals
		cm_reset             : in     std_logic;
		cm_locked            : out    std_logic  );
	END COMPONENT;
	ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
	ATTRIBUTE SYN_BLACK_BOX OF clk_wiz_0 : COMPONENT IS TRUE;
	ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
	ATTRIBUTE BLACK_BOX_PAD_PIN OF clk_wiz_0 : COMPONENT IS "cm_clkin,cm_clkout1,cm_reset,cm_locked";    

	COMPONENT pmodDA2_SPI is
	Port ( 	
			clk 			: in STD_LOGIC;
			spi_sclk 		: in STD_LOGIC; 	-- serial clock 
			sample_clk 		: in STD_LOGIC;		-- sample clock 
			dac_sync 		: out STD_LOGIC;	-- sync pulse (falling edge starts conversion sequence)
			dac_ch0_word 	: in STD_LOGIC_VECTOR (11 downto 0); -- word to be transmitted over ch0
			dac_ch0_busy 	: out STD_LOGIC;	-- ch0 busy signal 
			dac_ch0_sdin 	: out STD_LOGIC; 	-- serialized data to DAC ch0
			dac_spi_sclk	: out STD_LOGIC ); 	-- serial clock passed to DAC 
	END COMPONENT;

	COMPONENT pmodAD1_SPI is
	Port ( 
		clk 				: in STD_LOGIC;
		spi_sclk 			: in STD_LOGIC;
		sample_clk			: in STD_LOGIC;
		adc_ch0_sdout 		: in STD_LOGIC;		
		adc_CS 				: out STD_LOGIC;
		adc_ch0_data_ready 	: out STD_LOGIC;
		adc_ch0_word 		: out STD_LOGIC_VECTOR (11 downto 0)  );
	end COMPONENT;

--		 Clock divider for sample clock 
    COMPONENT ClockDivider is
    generic ( CLK_RATE : integer := 40000 );              
    Port ( 
       clk : in STD_LOGIC;
       slow_tick : out STD_LOGIC
       );
    END COMPONENT;
	
	signal spi_sclk 			: STD_LOGIC := '0';
	
	-- DAC signals
	signal dac_ch0_word 		: std_logic_vector(11 downto 0) := (others => '0');
	signal dac_ch0_start 		: std_logic := '0';
	signal dac_ch0_busy 		: std_logic := '0';
	signal dac_sync 			: std_logic := '0';
	signal dac_spi_sclk			: std_logic := '0';
	signal dac_ch0_sdin 		: std_logic := '0';

	-- ADC signals
	signal adc_CS 				: STD_LOGIC := '0';
--	signal adc_ch0_sdout 		: std_logic := '0';
	signal adc_ch0_data_ready 	: std_logic := '0';
	signal adc_ch0_word 		: std_logic_vector(11 downto 0) := (others => '0');
	
	-- test counter
	signal testcnt				: unsigned (11 downto 0) := (others => '0'); 
    constant RAMP           : integer := 10;
	
	-- sample clock 
	constant FSAMP 			: real := 640000.0;					--	sample rate (Hz)
    signal sample_clk       : STD_LOGIC := '0';
    signal slow_tick   : STD_LOGIC := '0'; 

begin 
dac_spi_sclk_out <= spi_sclk;
spi_sclk_out <= spi_sclk;
sync_out <= dac_sync;
CS_out <= adc_CS;
sample_clk_out <= sample_clk;

-- CLOCK GENERATOR FOR 20 MHz SPI CLOCK 
MMCM: clk_wiz_0
port map (
	-- Clock in ports
	cm_clkin => clk,
	-- Clock out ports  
	cm_clkout1 => spi_sclk,
	-- Status and control signals                
	cm_reset => '0',
	cm_locked => open  );   
	

DAC: pmodDA2_SPI 
Port MAP( 
	clk => clk,
	spi_sclk => spi_sclk,
	sample_clk => adc_ch0_data_ready,
	dac_sync => dac_sync,
	dac_ch0_word => adc_ch0_word,
	dac_ch0_busy => dac_ch0_busy,
	dac_ch0_sdin => dac_out,
--	dac_ch1_word => databus,
--	dac_ch1_busy => open,
--	dac_ch1_sdin => open,
	dac_spi_sclk => dac_spi_sclk );
	
		
SampleClk: ClockDivider 
GENERIC MAP(CLK_RATE => integer(FSAMP))
PORT MAP (
    clk => clk,
    slow_tick => sample_clk
    ); 


ADC: pmodAD1_SPI 
Port MAP ( 
	clk => clk,
	spi_sclk => spi_sclk,
	sample_clk => sample_clk,
	adc_ch0_sdout => adc_in,
	adc_CS => adc_CS,
	adc_ch0_data_ready => adc_ch0_data_ready,
	adc_ch0_word => adc_ch0_word    );
end Behavioral;
