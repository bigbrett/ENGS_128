----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2015 01:29:03 PM
-- Design Name: 
-- Module Name: test_TB_2 - Behavioral
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

entity test_TB_2 is
end test_TB_2;

architecture Behavioral of test_TB_2 is

COMPONENT test_top is
    Port ( clk : in STD_LOGIC;
           databus : in STD_LOGIC_VECTOR (15 downto 0);
           serial_out : out STD_LOGIC);
end COMPONENT;

   --Inputs
	signal clk : std_logic := '0';
   	signal databus :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
   	signal serial :  STD_LOGIC := '0';
	
	-- Clock period definitions
   	constant clk_period : time := 10ns;		-- 100 MHz

begin
	-- Instantiate the Unit Under Test (UUT)
uut: test_top PORT MAP (
    clk => clk, 
    databus => databus,
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
        
    databus <= x"ffff";
    wait for 1.6us;
    databus <= x"0000";
    

    wait for 10 ms;

     
end process;



end Behavioral;
