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
           BUF_WIDTH            : integer := 8;
           BUF_LEN              : integer := 8;
           SYMBOL_CLOCK_FREQUENCY      : integer := 40000
            );  
   
    Port ( clk : in STD_LOGIC;
           symbol_clk : in STD_LOGIC;
           RsRx    : in STD_LOGIC;
           serialI : out STD_LOGIC;
           serialQ : out STD_LOGIC;
           rx_data : out STD_LOGIC_VECTOR(7 downto 0)
           );
end ModemTx;

architecture Behavioral of ModemTx is

signal sig_rx_data           : std_logic_vector(7 downto 0) := (others => '0');
signal sig_rx_done_tick      : std_logic := '0';
signal sig_char_data         : std_logic_vector(7 downto 0)  := (others => '0');
signal sig_ser_start         : std_logic := '0'; 
--signal sig_symbol_clk        : std_logic := '0';

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
       BUF_LEN              : integer := 8;
       SYMBOL_CLOCK_FREQUENCY      : integer := 40000
        );  
    Port ( 
       clk: in STD_LOGIC;
       symbol_clk : in STD_LOGIC;
       rx_done_tick : in STD_LOGIC;
       rx_data : in STD_LOGIC_VECTOR (7 downto 0);
       ser_start : out STD_LOGIC;
       ser_data : out STD_LOGIC_VECTOR (7 downto 0) );
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
 --       BUF_WIDTH => BUF_WIDTH,
        BUF_LEN => BUF_LEN,
        SYMBOL_CLOCK_FREQUENCY => SYMBOL_CLOCK_FREQUENCY
        )  
PORT MAP(
        clk => clk,
        symbol_clk => symbol_clk,
        rx_done_tick => sig_rx_done_tick,
        rx_data => sig_rx_data,
        ser_start => sig_ser_start,  
        ser_data => sig_char_data
        );   
        

IQ_Serializer: Char_to_IQ 
PORT MAP(
        clk => clk,
        symbol_clk => symbol_clk,
        ser_start => sig_ser_start,
        char_data_in => sig_char_data, -- output from serial receiver
        serialI => serialI,
        serialQ => serialQ
        ); 
        
        
end Behavioral;
