----------------------------------------------------------------------------------
-- Company:         Engs 128 15S
-- Engineer:        E.W. Hansen
-- 
-- Create Date:     03/31/2015 08:49:11 PM
-- Design Name:     
-- Module Name:     ClockDivider - Behavioral
-- Project Name:    UpDownCounter
-- Target Devices:  Artix-7 
-- Tool Versions:   Vivado 2014.4 
-- Description:     Divide the 100 MHz master clock down to a 1 Hz (or so)
--                  enable signal.  The enable signal is a tick lasting for
--                  one clock cycle.
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity ClockDivider is
    Port ( clk : in STD_LOGIC;
           slow_tick : out STD_LOGIC);
end ClockDivider;

architecture Behavioral of ClockDivider is
--  Knowing that we want a 1 us period (for now), with a 100 MHz clock,
--  the clock divider has to divide by 100    
constant CLOCK_FREQUENCY : integer := 100000000;       -- 100 MHz clock
constant CLK_RATE : integer := 20000;                -- symbol rate 
constant CLK_RATE_COUNT : integer := CLOCK_FREQUENCY / CLK_RATE; -- clocks per bit
constant CLK_CTR_WIDTH : integer := integer(CEIL(LOG2(real(CLK_RATE_COUNT-1))));
signal CDcount : unsigned(CLK_CTR_WIDTH-1 downto 0) := (others => '0');

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if CDcount < CLK_RATE_COUNT then
                CDcount <= CDcount+1;
                slow_tick <= '0';
            else
                CDcount <= (others => '0');
                slow_tick <= '1';
            end if;
        end if;
    end process;
end Behavioral;
