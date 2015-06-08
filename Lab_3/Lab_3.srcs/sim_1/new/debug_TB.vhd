----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2015 01:59:56 PM
-- Design Name: 
-- Module Name: debug_TB - Behavioral
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

entity debug_TB is
end debug_TB;

ARCHITECTURE behavior OF debug_TB IS 

COMPONENT ClockDivider is
Generic (CLK_RATE : integer := 8000000);
Port ( 
       clk : in STD_LOGIC;
       slow_tick : out STD_LOGIC
       );
END COMPONENT;
 
COMPONENT debug_topLevel is
   Port ( 
	clk 	: in STD_LOGIC;
   	serial_in  : in STD_LOGIC;
   	serial_out : out STD_LOGIC );
end COMPONENT;
    
   --Inputs
	signal clk : std_logic := '0';
 	signal sample_clk :  STD_LOGIC := '0'; 
   	signal databus :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
   	signal serial :  STD_LOGIC := '0';
	
	-- Clock period definitions
   	constant clk_period : time := 10ns;		-- 100 MHz
	constant sample_period : time := 125ns;
	
	
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: debug_topLevel PORT MAP (
		clk => clk, 
		serial_in => serial,
		serial_out => open);
        	
        	
--  SampleClk: ClockDivider 
--        GENERIC MAP (CLK_RATE => 640000)
--        PORT MAP (
--            clk => clk,
--            slow_tick => sample_clk
--            ); 

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
   -- Stimulus process
   stim_proc: process
   begin
   		wait for 10.25*clk_period;			
		wait for 400us;
			
		serial <= '1';
		wait for 25us;
		serial <= '0';
		

		wait for 10 ms;

		 
   end process;
END;

