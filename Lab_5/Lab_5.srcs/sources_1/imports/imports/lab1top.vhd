----------------------------------------------------------------------------------
-- Company:         Engs 128 15S
-- Engineer:        E.W. Hansen
-- 
-- Create Date:     15:44:25 07/25/2009; ported to Vivado 04/02/2015
-- Design Name: 
-- Module Name:     lab1top - Behavioral 
-- Project Name:	Lab1-SerialIO 
-- Target Devices:  Artix-7
-- Tool versions:   Vivado 2014.4
-- Description:     Top level for Lab 1 (RS-232 serial link), looping
--		back from receiver to transmitter
--
-- Dependencies:    SerialRx.vhd, SerialTx.vhd
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use ieee.math_real.all;

entity lab5top is
Port (	clk     		: in  STD_LOGIC;
		RsRx    		: in  STD_LOGIC; -- serial data in
--		RsRx_out    		: out  STD_LOGIC; 
		ADC_in			: in STD_LOGIC;	 -- serialized ADC in (testing)
		ADC_CS			: out STD_LOGIC; -- chip select (low true, ADC conversion starts on falling edge)
		RsTx    		: out STD_LOGIC; -- serial data out
--		RsTx_out        : out STD_LOGIC;
		DAC_out 		: out STD_LOGIC; -- serial data to DAC
		DAC_sync		: out STD_LOGIC; -- sync pulse (low true, DAC conversion starts on falling edge)
		DAC_spi_sclk	: out STD_LOGIC; -- spi clock to DAC
		ADC_spi_sclk	: out STD_LOGIC; -- spi clock to ADC 
--		sample_clk_out  : out STD_LOGIC;
		seg     		: out STD_LOGIC_VECTOR(0 to 6); -- LED 7 segment display 
		an      		: out STD_LOGIC_VECTOR(3 downto 0)  ); -- LED 7 segment display 
end lab5top;

architecture Structural of lab5top is


constant cBUF_LEN : integer := 16;
--constant cBUF_WIDTH : integer := 8;
constant cSYMBOL_CLOCK_FREQUENCY : integer := 40000;

signal sig_symbol_clk               : STD_LOGIC; 
signal sig_sample_clk	            : STD_LOGIC;  
signal sig_rx_data                  : STD_LOGIC_VECTOR (7 downto 0);
signal sig_spi_sclk					: STD_LOGIC;
--signal Ibus                   		: STD_LOGIC_VECTOR (15 downto 0); 
--signal Qbus			                : STD_LOGIC_VECTOR (15 downto 0); 
--signal sig_databus                  : STD_LOGIC_VECTOR (11 downto 0);
signal RsTx_sig					: STD_LOGIC;


COMPONENT clk_wiz_0 is
PORT (
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


-- MUX to control Arctix-7 7-segment LED display
COMPONENT mux7seg is
PORT (	clk                  : in  STD_LOGIC;
		y0, y1, y2, y3       : in  STD_LOGIC_VECTOR (3 downto 0);    -- digits
		seg                  : out  STD_LOGIC_VECTOR(0 to 6);        -- segments (a...g)
		an                   : out  STD_LOGIC_VECTOR (3 downto 0) ); -- anodes
END COMPONENT;
	
	
-- Clock divider for symbol clock 
COMPONENT ClockDivider is
Port ( clk 			: in STD_LOGIC;
	   slow_tick 	: out STD_LOGIC
	   );
END COMPONENT;


-- Modem transmitter: Receives serial data from putty and transmits in QPSK format 	
COMPONENT ModemTx is
GENERIC ( 
		BUF_LEN              		: integer := 8;
		SYMBOL_CLOCK_FREQUENCY      : integer := 40000
		);  
PORT (	clk 				: in STD_LOGIC;
		symbol_clk 			: in STD_LOGIC;
		RsRx    			: in STD_LOGIC;
		spi_sclk			: in STD_LOGIC;
		sample_clk		    : out STD_LOGIC;
		rx_data 			: out STD_LOGIC_VECTOR(7 downto 0);
		DAC_out				: out STD_LOGIC := '0';
		DAC_sync			: out STD_LOGIC := '0'
		);
END COMPONENT;


-- Modem Receiver: Receives QPSK encoded data from transmitter and reserializes
COMPONENT ModemRx is
PORT ( clk 					: in STD_LOGIC;
	   sample_clk			: in STD_LOGIC;
	   spi_sclk				: in STD_LOGIC;
	   ADC_in				: in STD_LOGIC;
	   ADC_CS				: out STD_LOGIC;
	   RsTx                 : out STD_LOGIC := '0' 
	   ); 
END COMPONENT;


BEGIN

--sample_clk_out <= sig_sample_clk; -- output sample clock (for debugging)
--RsRx_out <= RsRx;
--RsTx_out <= RsTx_sig;
RsTx <= RsTx_sig;
Display: mux7seg 
PORT MAP( 
	clk => clk,
	y0 => sig_rx_data(3 downto 0),  -- using only the lower 2 digits
	y1 => sig_rx_data(7 downto 4),
	y2 => x"0",
	y3 => x"0",
	seg => seg,                   
	an => an  );
    
        
MMCM: clk_wiz_0
PORT MAP (
	-- Clock in ports
	cm_clkin => clk,
	-- Clock out ports  
	cm_clkout1 => sig_spi_sclk,
	-- Status and control signals                
	cm_reset => '0',
	cm_locked => open  );
		   
		          
SymbolClk: ClockDivider 
PORT MAP (
    clk => clk,
    slow_tick => sig_symbol_clk  ); 
    
        
ModemTransmitter: ModemTx 
GENERIC MAP ( 
    BUF_LEN => cBUF_LEN,
    SYMBOL_CLOCK_FREQUENCY => cSYMBOL_CLOCK_FREQUENCY  )  
PORT MAP(
    clk => clk,
    symbol_clk => sig_symbol_clk,
    RsRx => RsRx,
    spi_sclk => sig_spi_sclk,    
    sample_clk => sig_sample_clk,
    rx_data => sig_rx_data,
    DAC_out => DAC_out,
    DAC_sync => DAC_sync  
    ); 
DAC_spi_sclk <= sig_spi_sclk;  
    
 
ModemReceiver: ModemRx 
PORT MAP(
    clk => clk,
    sample_clk => sig_sample_clk,
    spi_sclk => sig_spi_sclk,
    ADC_in => ADC_in,
    ADC_CS => ADC_CS, 
    RsTx => RsTx_sig -- to putty 
    );
ADC_spi_sclk <= sig_spi_sclk;
     
   
end Structural;

