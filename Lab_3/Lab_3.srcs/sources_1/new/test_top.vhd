----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2015 01:20:17 PM
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_top is
    Port ( clk : in STD_LOGIC;
           databus : in STD_LOGIC_VECTOR (15 downto 0);
           serial_out : out STD_LOGIC);
end test_top;

architecture Behavioral of test_top is

COMPONENT ClockDivider is
Generic (CLK_RATE : integer := 40000);
Port ( 
       clk : in STD_LOGIC;
       slow_tick : out STD_LOGIC
       );
END COMPONENT;

COMPONENT RRC_Matched_Filter is
Port ( 
		clk 			: in STD_LOGIC;
		sample_clk 		: in STD_LOGIC;
		symbol_clk		: in STD_LOGIC;
		databus_in 		: in STD_LOGIC_VECTOR (15 downto 0);
		serial_out 		: out STD_LOGIC := '0' );
END COMPONENT;
signal symbol_clk		: STD_LOGIC := '0';
signal sample_clk 		: STD_LOGIC := '0';
begin

SymbolClk: ClockDivider 
GENERIC MAP (
	CLK_RATE => 40000)
PORT MAP (
    clk => clk,
    slow_tick => symbol_clk
    ); 

SampleClk: ClockDivider 
GENERIC MAP (
	CLK_RATE => 640000)
PORT MAP (
    clk => clk,
    slow_tick => sample_clk
    ); 
    
MatchedFilter: RRC_Matched_Filter 
    PORT MAP(
            clk => clk,
            sample_clk => sample_clk,
            symbol_clk => symbol_clk,
            databus_in => databus,
            serial_out => serial_out ); 



end Behavioral;
