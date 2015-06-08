----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2015 04:00:25 PM
-- Design Name: 
-- Module Name: BufferReg - Behavioral
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
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BufferReg is
    Port ( clk : in STD_LOGIC;
           rx_data : in STD_LOGIC_VECTOR (7 downto 0);
           wr_enable : in STD_LOGIC;
           ctr_enable : in STD_LOGIC;
           ctr_clear : in STD_LOGIC;
           eol : out STD_LOGIC;
           buff_full : out STD_LOGIC;
           tx_data : out STD_LOGIC_VECTOR (7 downto 0));
end BufferReg;

architecture Behavioral of BufferReg is
    constant BUF_LEN: integer := 8;
    constant BUF_WIDTH: integer := 8;
    
    
    signal address: STD_LOGIC_VECTOR (BUF_LEN-1 downto 0) := "00000000";

    type regfile_type is array(BUF_LEN-1 downto 0) of std_logic_vector(BUF_WIDTH-1 downto 0);
    signal theBuffer : regfile_type; 

begin

COUNTER: process(clk)
begin
    if rising_edge(clk) then
        if (ctr_clear = '1') then
            address <= "00000000";
        elsif (ctr_enable = '1') then
            address <= address + 1;
        end if;
    end if;
end process;



end Behavioral;
