----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2015 04:59:36 PM
-- Design Name: 
-- Module Name: ModemTx - Behavioral
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

entity ModemRx is
Port ( clk : in STD_LOGIC;
       symbol_clk           : in STD_LOGIC;
       serialI              : in STD_LOGIC;
       serialQ              : in STD_LOGIC;
       RsTx                 : out STD_LOGIC := '0' -- to putty 
       ); 
end ModemRx;

architecture Behavioral of ModemRx is
    
signal sig_tx_data : std_logic_vector(7 downto 0) := (others => '0');
signal sig_tx_start : std_logic := '0';
signal sig_tx_done_tick : std_logic := '0';

COMPONENT SerialTx
	PORT(
		clk : IN std_logic;
		tx_data : IN std_logic_vector(7 downto 0);
		tx_start : IN std_logic;        
		tx : OUT std_logic;
		tx_done_tick : OUT std_logic );
END COMPONENT;
	
COMPONENT IQ_to_Char is
PORT ( 
        clk     : in STD_LOGIC;       
        symbol_clk : in STD_LOGIC;
        serialI : in STD_LOGIC;
        serialQ : in STD_LOGIC;
        tx_start_tick : out STD_LOGIC;
        tx_data : out STD_LOGIC_VECTOR (7 downto 0)  );
END COMPONENT;


begin

IQ_Deserializer: IQ_to_Char PORT MAP(
        clk => clk,
        symbol_clk => symbol_clk,
        serialI => serialI,
        serialQ => serialQ, 
        tx_start_tick => sig_tx_start,
        tx_data => sig_tx_data ); 

Transmitter: SerialTx PORT MAP(
		clk => clk,
		tx_data => sig_tx_data,           -- loop back Rx to Tx
		tx_start => sig_tx_start,
		tx => RsTx,    -- to putty 
		tx_done_tick => sig_tx_done_tick  );

end Behavioral;
