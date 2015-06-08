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

entity lab1top is
    Port (  
            clk     : in  STD_LOGIC;
            RsRx    : in  STD_LOGIC;
            RsTx    : out  STD_LOGIC;
            seg     : out STD_LOGIC_VECTOR(0 to 6);
            an      : out STD_LOGIC_VECTOR(3 downto 0) );
end lab1top;


architecture Structural of lab1top is

-- GENERIC constants ******************************
constant cBUF_LEN : integer := 16;
--constant cBUF_WIDTH : integer := 8;
constant cSYMBOL_CLOCK_FREQUENCY : integer := 40000;

signal sig_symbol_clk               : STD_LOGIC; 
signal sig_sample_clk	                : STD_LOGIC;  
signal sig_rx_data                  : STD_LOGIC_VECTOR (7 downto 0); 
signal Ibus                   		: STD_LOGIC_VECTOR (15 downto 0); 
signal Qbus			                : STD_LOGIC_VECTOR (15 downto 0); 
signal sig_databus                  : STD_LOGIC_VECTOR (11 downto 0);

-- MUX to control Arctix-7 7-segment LED display
COMPONENT mux7seg is
PORT ( 
       clk                  : in  STD_LOGIC;
       y0, y1, y2, y3       : in  STD_LOGIC_VECTOR (3 downto 0);    -- digits
       seg                  : out  STD_LOGIC_VECTOR(0 to 6);        -- segments (a...g)
       an                   : out  STD_LOGIC_VECTOR (3 downto 0) ); -- anodes
END COMPONENT;
	
-- Clock divider for symbol clock 
COMPONENT ClockDivider is
Port ( 
       clk : in STD_LOGIC;
       slow_tick : out STD_LOGIC
       );
END COMPONENT;


-- Modem transmitter: Receives serial data from putty and transmits in QPSK format 	
COMPONENT ModemTx is
GENERIC ( 
      -- BUF_WIDTH            : integer := 8;
       BUF_LEN              : integer := 8;
       SYMBOL_CLOCK_FREQUENCY      : integer := 40000
        );  
PORT ( 
		clk 				: in STD_LOGIC;
		symbol_clk 			: in STD_LOGIC;
		RsRx    			: in STD_LOGIC;
		sample_clk		    : out STD_LOGIC;
		rx_data 			: out STD_LOGIC_VECTOR(7 downto 0);
		Mod_databus         : out STD_LOGIC_VECTOR(11 downto 0)
		);
END COMPONENT;

-- Modem Receiver: Receives QPSK encoded data from transmitter and reserializes
COMPONENT ModemRx is
PORT ( 
       clk : in STD_LOGIC;
       sample_clk			: in STD_LOGIC;
       Mod_databus          : in STD_LOGIC_VECTOR(11 downto 0);
       RsTx                 : out STD_LOGIC -- to putty 
       ); 
END COMPONENT;

begin

Display: mux7seg PORT MAP( 
    clk => clk,
    y0 => sig_rx_data(3 downto 0),  -- using only the lower 2 digits
    y1 => sig_rx_data(7 downto 4),
    y2 => x"0",
    y3 => x"0",
    seg => seg,                   
    an => an 
    );
          
SymbolClk: ClockDivider PORT MAP (
    clk => clk,
    slow_tick => sig_symbol_clk
    ); 
    
ModemTransmitter: ModemTx 
GENERIC MAP ( 
 --   BUF_WIDTH => cBUF_WIDTH,
    BUF_LEN => cBUF_LEN,
    SYMBOL_CLOCK_FREQUENCY => cSYMBOL_CLOCK_FREQUENCY
    )  
PORT MAP(
    clk => clk,
    symbol_clk => sig_symbol_clk,
    RsRx => RsRx,    
    sample_clk => sig_sample_clk,
    rx_data => sig_rx_data,
    Mod_databus => sig_databus
    ); 
    
ModemReceiver: ModemRx PORT MAP(
    clk => clk,
    sample_clk => sig_sample_clk,
    Mod_databus => sig_databus, 
    RsTx => RsTx -- to putty 
    ); 



end Structural;

