----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2015 05:55:33 PM
-- Design Name: 
-- Module Name: mod_tb - Behavioral
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

entity mod_tb is
end mod_tb;

architecture Behavioral of mod_tb is
component mod_top is
    Port ( clk : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
           Ibus : in STD_LOGIC_VECTOR (15 downto 0);
           Qbus : in STD_LOGIC_VECTOR (15 downto 0);
           Mod_databus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component ClockDivider is
	generic ( CLK_RATE : integer := 40000 );              
    Port ( clk : in STD_LOGIC;
           slow_tick : out STD_LOGIC);
end component;

signal clk, sample_clk : STD_LOGIC := '0';
signal Ibus, Qbus : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');  
signal Mod_databus : STD_LOGIC_VECTOR (11 downto 0) := (others => '0'); 

-- Clock period definitions
constant clk_period : time := 10ns;		-- 100 MHz
   
begin
mymod: mod_top Port Map(
    clk => clk,
    sample_clk => sample_clk,
    Ibus => Ibus,
    Qbus => Qbus,
    Mod_databus => mod_databus );

foo: ClockDivider 
    Generic Map(CLK_RATE => 640000 )
    Port Map(
    clk => clk,
    slow_tick => sample_clk   );

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
    wait for 100 us;
    wait for 10.25*clk_period;		





    wait for 10 ns;
end process; 


end Behavioral;
