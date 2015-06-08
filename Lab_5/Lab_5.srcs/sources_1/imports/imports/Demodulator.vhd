----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2015 04:54:14 PM
-- Design Name: 
-- Module Name: Demodulator - Behavioral
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
use IEEE.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Demodulator is
    Port ( clk : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
           Mod_databus : in STD_LOGIC_VECTOR (11 downto 0);
           Ibus : out STD_LOGIC_VECTOR (15 downto 0);
           Qbus : out STD_LOGIC_VECTOR (15 downto 0));
end Demodulator;

architecture Behavioral of Demodulator is

signal wave_count : unsigned(1 downto 0) := (others => '0');
--signal sin, cos : integer;
signal Iprod, Qprod : signed(11 downto 0) := (others => '0'); 

begin


Wave_Generator: process(clk,sample_clk)
begin
    if rising_edge(clk) then
        if sample_clk = '1' then
            wave_count <= wave_count + 1;
        end if;
    end if;
end process;

    
IQ_Demod: process(clk)
begin
	if rising_edge(clk) then
		if sample_clk = '1' then
			case wave_count is 
				when "00" =>
					Iprod <= signed(Mod_databus); -- * cos(0)
					Qprod <= (others => '0'); -- * sin(0)
					 
				when "01" => 
					Iprod <= (others => '0'); -- * cos(pi/2)
					Qprod <= NOT(signed(Mod_databus)) + 1; -- * sin(pi/2)
					
				when "10" =>
					Iprod <= NOT(signed(Mod_databus)) + 1;
					Qprod <= (others => '0'); 
					
				when "11" =>
					Iprod <= (others => '0'); 
					Qprod <= signed(Mod_databus); 
				 
				when others => 
					Iprod <= (others => '0'); 
					Qprod <= (others => '0'); 
			end case;
		end if;
	end if; 
end process;                 
Ibus <= std_logic_vector(resize(Iprod,16));  
Qbus <= std_logic_vector(resize(Qprod,16));  


end Behavioral;
