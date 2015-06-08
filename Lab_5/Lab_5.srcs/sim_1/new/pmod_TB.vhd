----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2015 12:30:15 PM
-- Design Name: 
-- Module Name: pmod_TB - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pmod_TB is
--  Port ( );
end pmod_TB;

architecture Behavioral of pmod_TB is

	component test_top is
	PORT(
		clk 		: in std_logic;
		sample_clk 	: in std_logic; 
		databus 	: in std_logic_vector(15 downto 0)    );  
	end component;

	signal clk : std_logic := '0';
	signal sample_clk : STD_LOGIC := '0';

	-- Clock period definitions
	constant clk_period  : time := 10ns;		-- 100 MHz
	constant sclk_period : time := 50ns; 		-- 20 MHz
	
	constant FSAMP 			: real := 640000.0;					--	sample rate (Hz)
	constant SIN_FREQ 		: real := 440.0;						-- Hz
	constant SIN_AMPL		: real := 2.0**11 - 1.0; 			-- 12-bit signed
		
	constant TSAMP 			: real := 1.0/FSAMP; 				-- sampling period (s) 
	signal DDS_sin, DDS_cos : std_logic_vector(11 downto 0) := (others => '0'); 
	signal data_in			: std_logic_vector(11 downto 0) := (others => '0'); 
begin 

uut: test_top 
port map(
	clk => clk, 
	sample_clk => sample_clk,
	databus => data_in  ); 

-- Clock process definitions
clk_process: process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process;
 
--sample_clk_process: process
--begin
--	sample_clk <= '0';
--	wait for sclk_period/2;
--	sample_clk <= '1';
--	wait for sclk_period/2;
--end process;
 
   -- Stimulus process
stim_proc: process
	variable t : real := 0.0; 
begin			
	
	loop 
		DDS_cos <= std_logic_vector(to_signed(integer( SIN_AMPL * cos(math_2_pi * SIN_FREQ * t) ), 12));
		DDS_sin <= std_logic_vector(to_signed(integer( SIN_AMPL * sin(math_2_pi * SIN_FREQ * t) ), 12));
		
		-- pack cos and sin into 16-bit words for sending to the DAC
		data_in <= "ZZZZ"& DDS_cos;
		
		-- assert start signal to initiate conversion
		sample_clk <= '1'; 
		
		wait for integer(TSAMP * 10.0**9) * 1 ns; 
		sample_clk <= '0';
		t := t + TSAMP;

	end loop; 

end process; 

END Behavioral;
