----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2015 04:54:14 PM
-- Design Name: 
-- Module Name: Modulator - Behavioral
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
use IEEE.math_real.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity Modulator is
    Port ( clk : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
           Ibus : in STD_LOGIC_VECTOR (15 downto 0);
           Qbus : in STD_LOGIC_VECTOR (15 downto 0);
           Mod_databus : out STD_LOGIC_VECTOR (11 downto 0) := (others => '0')  );
end Modulator;

architecture Behavioral of Modulator is

COMPONENT dds_compiler_0
  PORT (
    aclk : IN STD_LOGIC;
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

    signal dds_data : std_logic_vector(31 downto 0) := (others => '0'); 
    signal Q_sin_data, I_cos_data, qpsk : signed(31 downto 0) := (others => '0'); 
    signal DDS_data_valid : STD_LOGIC := '0';
    signal sine, cosine : signed(15 downto 0) := (others => '0');

begin
-- DDS sin/cos wave generator for modulation
DDS: dds_compiler_0
  PORT MAP (
    aclk => sample_clk,
    m_axis_data_tvalid => DDS_data_valid,
    m_axis_data_tdata => dds_data  
  );

sine <= signed(dds_data(31 downto 16));     --DDS outputs s0.13
cosine <= signed(dds_data(15 downto 0));

-- grab sin and cos values from dds output and register them 
ProdReg: process(clk)
begin
    if rising_edge(clk) then
        Q_sin_data <= sine*signed(Qbus(15 downto 0));   --Pulse shaper outputs s0.14
        I_cos_data <= cosine*signed(Ibus(15 downto 0));
        qpsk <= I_cos_data - Q_sin_data;

    end if; 
end process;
Mod_databus <= std_logic_vector(qpsk(27 downto 16));


end Behavioral;

