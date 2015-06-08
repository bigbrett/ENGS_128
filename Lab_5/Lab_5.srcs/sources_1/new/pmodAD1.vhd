----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2015 12:15:22 PM
-- Design Name: 
-- Module Name: pmodAD1_SPI - Behavioral
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

entity pmodAD1_SPI is
Port ( clk : in STD_LOGIC;
	   spi_sclk : in STD_LOGIC;
	   sample_clk : in STD_LOGIC;
	   adc_start : in STD_LOGIC;
	   adc_ch0_sdout : in STD_LOGIC;
	   adc_ch0_data_ready : out STD_LOGIC;
	   adc_ch0_word : out STD_LOGIC_VECTOR (11 downto 0));
end pmodAD1_SPI;

architecture Behavioral of pmodAD1_SPI is

begin



end Behavioral;
