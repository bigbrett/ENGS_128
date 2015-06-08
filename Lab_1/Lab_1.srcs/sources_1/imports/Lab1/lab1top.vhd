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
    Port (  clk : in  STD_LOGIC;
            RsRx  : in  STD_LOGIC;
            RsTx  : out  STD_LOGIC;
            seg : out STD_LOGIC_VECTOR(0 to 6);
            an : out STD_LOGIC_VECTOR(3 downto 0) );
end lab1top;

architecture Structural of lab1top is
signal rx_data : std_logic_vector(7 downto 0) := (others => '0');
signal rx_done_tick : std_logic := '0';
signal ser_data : std_logic_vector(7 downto 0) := (others => '0');
--signal ser_start : std_logic;
signal tx_start : std_logic := '0';
signal tx_done_tick : std_logic := '0';

COMPONENT SerialRx
	PORT(
		clk : IN std_logic;
		RsRx : IN std_logic;         
		rx_data : OUT std_logic_vector(7 downto 0);
		rx_done_tick : OUT std_logic  );
	END COMPONENT;

COMPONENT SerialTx
	PORT(
		clk : IN std_logic;
		tx_data : IN std_logic_vector(7 downto 0);
		tx_start : IN std_logic;        
		tx : OUT std_logic;
		tx_done_tick : OUT std_logic );
	END COMPONENT;
	
COMPONENT mux7seg 
        PORT ( clk : in  STD_LOGIC;
               y0, y1, y2, y3 : in  STD_LOGIC_VECTOR (3 downto 0);    -- digits
               seg : out  STD_LOGIC_VECTOR(0 to 6);                   -- segments (a...g)
               an : out  STD_LOGIC_VECTOR (3 downto 0) );             -- anodes
    END COMPONENT;
    
COMPONENT BufferFSM
    Port ( 
           clk: in STD_LOGIC;
           rx_done_tick : in STD_LOGIC;
           rx_data : in STD_LOGIC_VECTOR (7 downto 0);
           ser_start : out STD_LOGIC;
           ser_data : out STD_LOGIC_VECTOR (7 downto 0) );
    END COMPONENT;
	
begin

Receiver: SerialRx PORT MAP(
		clk => clk,
		RsRx => RsRx,
		rx_data => rx_data,
		rx_done_tick => rx_done_tick  );

Transmitter: SerialTx PORT MAP(
		clk => clk,
		tx_data => ser_data,           -- loop back Rx to Tx
		tx_start => tx_start,
		tx => RsTx,
		tx_done_tick => open  );

Display: mux7seg PORT MAP( 
        clk => clk,
        y0 => rx_data(3 downto 0),  -- using only the lower 2 digits
        y1 => rx_data(7 downto 4),
        y2 => x"0",
        y3 => x"0",
        seg => seg,                   
        an => an );
        
Controller: BufferFSM PORT MAP(
        clk => clk,
        rx_done_tick => rx_done_tick,
        rx_data => rx_data,
        ser_start => tx_start,
        ser_data => ser_data       
        );                

end Structural;

