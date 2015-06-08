----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2015 12:30:15 PM
-- Design Name: 
-- Module Name: pmod_TB - Behavioral
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
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity foo_TB is
--  Port ( );
end foo_TB;

architecture Behavioral of foo_TB is

	COMPONENT clk_wiz_0 is
	port (
		-- Clock in ports
		cm_clkin          	 : in     std_logic;
		-- Clock out ports
		cm_clkout1			 : out    std_logic;
		-- Status and control signals
		cm_reset             : in     std_logic;
		cm_locked            : out    std_logic  
		);
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


	-- Clock divider for sample clock 
	COMPONENT ClockDivider is
	generic ( CLK_RATE : integer := 40000 );              
	Port ( 
	       clk : in STD_LOGIC;
	       slow_tick : out STD_LOGIC
	       );
	END COMPONENT;

	signal clk : std_logic := '0';
	signal sample_clk : STD_LOGIC := '0';
	signal spi_sclk : std_logic := '0'; 
	
	-- Clock period definitions
	constant clk_period  : time := 10ns;		-- 100 MHz
	constant sclk_period : time := 1.563us; 		-- 640 kHz
	constant FSAMP 			: real := 640000.0;					--	sample rate (Hz)
	constant SIN_FREQ 		: real := 440.0;						-- Hz
	constant SIN_AMPL		: real := 2.0**11 - 1.0; 			-- 12-bit signed
		
	constant TSAMP 			: real := 1.0/FSAMP; 				-- sampling period (s) 
	signal DDS_sin, DDS_cos : std_logic_vector(11 downto 0) := (others => '0'); 
	signal data_in			: std_logic_vector(11 downto 0) := (others => '0'); 
	
	signal adc_sdin : std_logic := '0';
	signal delay1, delay2 : std_logic := '0'; 
begin 


dac: pmodDA2_SPI
port map (  clk => clk, 		
			spi_sclk => spi_sclk,		
			sample_clk => sample_clk,		
			dac_sync => open,		
			dac_ch0_word => DDS_cos,	
			dac_ch0_busy => open,	
			dac_ch0_sdin => adc_sdin,	
			dac_spi_sclk =>	open 
			); 


ADC: pmodAD1_SPI 
Port MAP ( 
	clk => clk,
	spi_sclk => spi_sclk,
	sample_clk => sample_clk,
	adc_ch0_sdout => adc_sdin,
	adc_CS => open,
	adc_ch0_data_ready => open,
	adc_ch0_word => open    );
	
	
MMCM: clk_wiz_0
port map (
	-- Clock in ports
	cm_clkin => clk,
	-- Clock out ports  
	cm_clkout1 => spi_sclk,
	-- Status and control signals                
	cm_reset => '0',
	cm_locked => open  );
	
	
SampleClk: ClockDivider 
GENERIC MAP(CLK_RATE => integer(FSAMP))
PORT MAP (
    clk => clk,
    slow_tick => sample_clk
    ); 

-- Clock process definitions
clk_process: process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';

	wait for clk_period/2;
end process;   


wavegen: process
	variable t : real := 0.0; 
begin			 
	loop 
		DDS_cos <= std_logic_vector(to_signed(integer( SIN_AMPL * cos(math_2_pi * SIN_FREQ * t) ), 12));
		wait for integer(TSAMP * 10.0**9) * 1 ns; 
		t := t + TSAMP;
	end loop; 
end process; 




END Behavioral;
