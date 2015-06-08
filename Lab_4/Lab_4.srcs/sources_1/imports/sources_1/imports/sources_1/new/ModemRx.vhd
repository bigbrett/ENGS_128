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
       sample_clk			: in STD_LOGIC;
       Mod_databus          : in STD_LOGIC_VECTOR(11 downto 0);
       RsTx                 : out STD_LOGIC := '0' -- to putty 
       ); 
end ModemRx;

architecture Behavioral of ModemRx is
    
signal sig_tx_data 			: std_logic_vector(7 downto 0) := (others => '0');
signal sig_tx_start 		: std_logic := '0';
signal sig_tx_done_tick 	: std_logic := '0';
signal serialI				: std_logic := '0';
signal serialQ				: std_logic := '0';
signal Ibus					: std_logic_vector(15 downto 0) := (others => '0');
signal Qbus					: std_logic_vector(15 downto 0) := (others => '0');
signal MF_out_I, MF_out_Q	: std_logic_vector(15 downto 0) := (others => '0');
signal regen_symbol_clk 	: std_logic := '0';

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

COMPONENT RRC_Matched_Filter is
Port ( 
		clk 			: in STD_LOGIC;
		sample_clk 		: in STD_LOGIC;
		databus_in 		: in STD_LOGIC_VECTOR (15 downto 0);
		MF_out : out STD_LOGIC_VECTOR (15 downto 0) := (others => '0')  );
END COMPONENT;

COMPONENT Demodulator is
    Port ( clk : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
           Mod_databus : in STD_LOGIC_VECTOR (11 downto 0);
           Ibus : out STD_LOGIC_VECTOR (15 downto 0);
           Qbus : out STD_LOGIC_VECTOR (15 downto 0));
end COMPONENT;

COMPONENT CRloop is
    generic( WIDTH : positive := 16 );
    Port ( clk : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
--         strobe : in STD_LOGIC; -- strobe is currently internal
           xI : in STD_LOGIC_VECTOR (WIDTH-1 downto 0); -- from matched filters
           xQ : in STD_LOGIC_VECTOR (WIDTH-1 downto 0); -- from matched filters
           CR_out_serialI: out STD_LOGIC;      -- rotator output, to detectors
           CR_out_serialQ : out STD_LOGIC;  -- rotator output, to detectors
           regen_symbol_clk : out STD_LOGIC := '0'  ); -- regenerated symbol clock for IQ serializer
end COMPONENT; 


begin

IQ_Demodulator: Demodulator PORT MAP (
        clk => clk,
        sample_clk => sample_clk,
        Mod_databus => Mod_databus,
        Ibus => Ibus,
        Qbus => Qbus );

MatchedFilter_I: RRC_Matched_Filter PORT MAP(
        clk => clk,
        sample_clk => sample_clk,
        databus_in => Ibus,
--        serial_out => serialI ); -- to IQ Deserializer
        MF_out => MF_out_I  ); 
        
MatchedFilter_Q: RRC_Matched_Filter PORT MAP(
		clk => clk,
		sample_clk => sample_clk,
		databus_in => Qbus,
	--	serial_out => serialQ );  -- to IQ Deserializer
		MF_out => MF_out_Q ); 

CR_loop: CRloop 
    PORT MAP (        
        clk => clk,
        sample_clk => sample_clk,
        xI => MF_out_I,
        xQ => MF_out_Q,
        CR_out_serialI => serialI, 
        CR_out_serialQ => serialQ,
        regen_symbol_clk => regen_symbol_clk );         		
		
IQ_Deserializer: IQ_to_Char PORT MAP(
		clk => clk,
		symbol_clk => regen_symbol_clk,
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
