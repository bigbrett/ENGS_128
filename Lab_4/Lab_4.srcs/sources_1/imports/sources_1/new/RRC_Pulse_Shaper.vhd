----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brett Nicholas and Matt Metzler
-- 
-- Create Date: 04/22/2015 08:00:42 AM
-- Design Name: 
-- Module Name: RRC_Pulse_Shaper - Behavioral
-- Project Name: 
-- Target Devices: Arctix - 7
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
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity RRC_Pulse_Shaper is
Port ( 
       clk : in STD_LOGIC;
       symbol_clk : in STD_LOGIC;                   
       serial_in : in STD_LOGIC;                      -- BPSK even bitstream
       databus_out : out STD_LOGIC_VECTOR (15 downto 0);   -- modulated carrier wave
       sample_clk : out STD_LOGIC   
       );
end RRC_Pulse_Shaper;

architecture Behavioral of RRC_Pulse_Shaper is

-- FIR IP core   
COMPONENT fir_compiler_0 is
  PORT (
	aclk : IN STD_LOGIC;
	s_axis_data_tvalid : IN STD_LOGIC;
	s_axis_data_tready : OUT STD_LOGIC;
	s_axis_data_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	m_axis_data_tvalid : OUT STD_LOGIC;
	m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
	
    -- data mapping
    signal mapped_sample			  : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); 
    
    -- FSM
    type state_type is (sWAIT, sSEND, sZEROS);
        	signal curr_state, next_state 		: state_type := sWAIT;
begin

-- FIR RRC Pulse Shaping Filter
FIR: fir_compiler_0
  PORT MAP (
    aclk => clk,
    s_axis_data_tvalid => symbol_clk,
    s_axis_data_tready => open,
    s_axis_data_tdata => mapped_sample,
    m_axis_data_tvalid => sample_clk,
    m_axis_data_tdata => databus_out  );


-- Map (0,1) to 2's compliment of (-1,1)

mapped_sample <= x"01" when (serial_in = '1') else x"ff"; 



end Behavioral;
