----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2015 04:55:14 PM
-- Design Name: 
-- Module Name: mod_top - Behavioral
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

entity mod_top is
    Port ( clk : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
           Ibus : in STD_LOGIC_VECTOR (15 downto 0);
           Qbus : in STD_LOGIC_VECTOR (15 downto 0);
           Mod_databus : out STD_LOGIC_VECTOR (11 downto 0));
end mod_top;

architecture Behavioral of mod_top is
COMPONENT Modulator is
    Port ( clk : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
           Ibus : in STD_LOGIC_VECTOR (15 downto 0);
           Qbus : in STD_LOGIC_VECTOR (15 downto 0);
           Mod_databus : out STD_LOGIC_VECTOR (11 downto 0));
END COMPONENT;

begin

u1: Modulator Port Map(
    clk => clk,
    sample_clk => sample_clk,
    Ibus => Ibus,
    Qbus => Qbus,
    Mod_databus => mod_databus );

end Behavioral;
