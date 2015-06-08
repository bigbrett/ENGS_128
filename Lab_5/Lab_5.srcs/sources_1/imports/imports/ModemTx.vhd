----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2015 04:59:36 PM
-- Design Name: 
-- Module Name: ModemRx - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ModemTx is
GENERIC (
		BUF_WIDTH            		: integer := 8;
		BUF_LEN              		: integer := 8;
		SYMBOL_CLOCK_FREQUENCY     	: integer := 40000 );  
PORT (	clk 							: in STD_LOGIC;
		symbol_clk		    		: in STD_LOGIC;
		RsRx    						: in STD_LOGIC;
		spi_sclk						: in STD_LOGIC;
		sample_clk					: out STD_LOGIC;
		rx_data 						: out STD_LOGIC_VECTOR(7 downto 0);
		DAC_out						: out STD_LOGIC := '0';
		DAC_sync						: out STD_LOGIC := '0'  );
end ModemTx;

architecture Behavioral of ModemTx is
	 
-- serial receiver
COMPONENT SerialRx
PORT(
	clk                 : IN std_logic;
	RsRx                : IN std_logic;         
	rx_data             : OUT std_logic_vector(7 downto 0);
	rx_done_tick        : OUT std_logic  );
END COMPONENT;

-- character buffer
COMPONENT BufferFSM
GENERIC ( 
	--     BUF_WIDTH            : integer := 8;
	BUF_LEN              	: integer := 8;
	SYMBOL_CLOCK_FREQUENCY   : integer := 40000
	);  
Port ( 
	clk						: in STD_LOGIC;
	symbol_clk 				: in STD_LOGIC;
	rx_done_tick 			: in STD_LOGIC;
	rx_data 				: in STD_LOGIC_VECTOR (7 downto 0);
	ser_start 				: out STD_LOGIC;
	ser_data 				: out STD_LOGIC_VECTOR (7 downto 0) );
END COMPONENT;
	
-- QPSK serializer
COMPONENT Char_to_IQ
PORT(
	clk                 : in STD_LOGIC; 
	symbol_clk          : in STD_LOGIC; 
	ser_start           : in STD_LOGIC; 
	char_data_in        : in STD_LOGIC_VECTOR (7 downto 0); 
	serialI             : out STD_LOGIC; 
	serialQ             : out STD_LOGIC
	); 
END COMPONENT;    
	
COMPONENT RRC_Pulse_Shaper is
Port ( 
	   clk : in STD_LOGIC;
	   symbol_clk : in STD_LOGIC;                   
	   serial_in : in STD_LOGIC;                      -- BPSK even bitstream
	   databus_out : out STD_LOGIC_VECTOR (15 downto 0);   -- modulated carrier wave
	   sample_clk : out STD_LOGIC   
	   );
end COMPONENT;

COMPONENT Modulator is
Port ( clk : in STD_LOGIC;
	   sample_clk : in STD_LOGIC;
	   Ibus : in STD_LOGIC_VECTOR (15 downto 0);
	   Qbus : in STD_LOGIC_VECTOR (15 downto 0);
	   Mod_databus : out STD_LOGIC_VECTOR (11 downto 0) := (others => '0')  );
end COMPONENT;

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
end COMPONENT;


signal sig_rx_data           : std_logic_vector(7 downto 0) := (others => '0');
signal sig_rx_done_tick      : std_logic := '0';
signal sig_char_data         : std_logic_vector(7 downto 0)  := (others => '0');
signal sig_ser_start         : std_logic := '0';
signal sig_sample_clk        : std_logic := '0'; 
signal serialI, serialQ		 : std_logic := '0';
signal sig_Ibus, sig_Qbus    : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal Mod_databus           : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
	

begin

rx_data <= sig_rx_data;
Receiver: SerialRx 
PORT MAP(
	clk => clk,
	RsRx => RsRx,
	rx_data => sig_rx_data,
	rx_done_tick => sig_rx_done_tick  
	); 


CharBuffer: BufferFSM 
GENERIC MAP(
	BUF_LEN => BUF_LEN,
	SYMBOL_CLOCK_FREQUENCY => SYMBOL_CLOCK_FREQUENCY )  
PORT MAP(
	clk => clk,
	symbol_clk => symbol_clk,
	rx_done_tick => sig_rx_done_tick,
	rx_data => sig_rx_data,
	ser_start => sig_ser_start,  
	ser_data => sig_char_data  );   
        
IQ_Serializer: Char_to_IQ 
PORT MAP(
	clk => clk,
	symbol_clk => symbol_clk,
	ser_start => sig_ser_start,
	char_data_in => sig_char_data, -- output from serial receiver
	serialI => serialI,
	serialQ => serialQ  );   
        
PulseShaper_I: RRC_Pulse_Shaper	
PORT MAP (
	clk => clk,
	symbol_clk => symbol_clk,       
	serial_in => serialI,
	databus_out => sig_Ibus,
	sample_clk => sig_sample_clk );
sample_clk <= sig_sample_clk;        

PulseShaper_Q: RRC_Pulse_Shaper	
PORT MAP (
	clk => clk,
	symbol_clk => symbol_clk,       
	serial_in => serialQ,
	databus_out => sig_Qbus,
	sample_clk => open );
        		       		
QPSK_Modulator: Modulator
PORT MAP (
	clk => clk,
	sample_clk => sig_sample_clk,
	Ibus => sig_Ibus,
	Qbus => sig_Qbus,
	Mod_databus => Mod_databus );
	
DAC: pmodDA2_SPI 
Port MAP( 
	clk => clk,
	spi_sclk => spi_sclk, -- spi clock 
	sample_clk => sig_sample_clk, 
	dac_sync => DAC_sync, -- falling edge starts conversion sequence
	dac_ch0_word => Mod_databus, -- word to be converted
	dac_ch0_busy => open, -- dac busy signal (unused) 
	dac_ch0_sdin => dac_out, -- serialized word to be output to DAC
	dac_spi_sclk => open ); -- serial clock output (DEBUG)   
	
        
end Behavioral;
