----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2015 12:15:22 PM
-- Design Name: 
-- Module Name: pmodDA2_SPI - Behavioral
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

entity pmodDA2_SPI is
    Port ( clk : in STD_LOGIC;
           spi_sclk : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
           dac_ch0_word : in STD_LOGIC_VECTOR (11 downto 0);
           dac_ch0_start : in STD_LOGIC;
           dac_ch0_busy : out STD_LOGIC;
           dac_ch0_sync : out STD_LOGIC;
           dac_ch0_sclk : out STD_LOGIC;
           dac_ch0_sdin : out STD_LOGIC);
end pmodDA2_SPI;

architecture Behavioral of pmodDA2_SPI is

	signal shift_reg:	std_logic_vector(15 downto 0) := x"0000";
	signal sync:		std_logic := '1';
	signal spi_load:	std_logic := '0';
	signal shift:		std_logic := '0';
	signal count_en:	std_logic := '0';
	signal count_clear:	std_logic := '0';
	signal shift_count:	integer range 0 to 15 := 0;
	signal count_done:		std_logic := '0';
	
	type state_type is (sIDLE, sLOAD, sWAIT, sSHIFT, sINC, sLOW);
	signal current_state, next_state: state_type := sIDLE;

begin

ShiftRegister: process(clk)
begin
	if rising_edge(clk) then
		if (spi_load = '1') then
			shift_reg <= "XX00" & not(dac_ch0_word(11)) & dac_ch0_word(10 downto 0);
		elsif(shift = '1') then
			shift_reg <= shift_reg(14 downto 0) & '0';
		end if;
	end if;
end process;

ShiftCounter: process(clk)
begin
	if rising_edge(clk) then
		if (count_clear = '1') then
			shift_count <= 0;
		elsif (count_en = '1') then
			shift_count <= shift_count + 1;
		end if;
	end if;
end process;
	count_done <= '1' when shift_count = 15 else '0';

StateUpdate: process(clk)
begin
	if rising_edge(clk) then
		current_state <= next_state;
	end if;
end process;

StateMachine: process(sample_clk, spi_sclk, count_done)
begin
	count_clear <= '0';
	spi_load <= '0';
	sync <= '0';
	shift <= '0';
	count_en <= '0';
	count_clear <= '0';
	
	next_state <= current_state;
	
	case current_state is
		
		when sIDLE =>
			count_clear <= '1';
			sync <= '1';
			if (sample_clk = '1') then
				next_state <= sLOAD;
			end if;
			
		when sLOAD =>
			spi_load <= '1';
			next_state <= sWAIT;
			
		when sWAIT =>
			if spi_sclk = '1' then
				next_state <= sSHIFT;
			end if;
		
		when sSHIFT =>
			shift <= '1';
			if count_done = '1' then
				next_state <= sIDLE;
			else
				next_state <= sINC;
			end if;
			
		when sINC =>
			count_en <= '1';
			next_state <= sLOW;
			
		when sLOW =>
			if spi_sclk = '0' then
				next_state <= sWAIT;
			end if;
			
		when others =>
			next_state <= sIDLE;
			
	end case;
end process;

dac_ch0_sync <= sync;
dac_ch0_sclk <= spi_sclk;
dac_ch0_sdin <= shift_reg(15);
dac_ch0_busy <= '0';
	
	
	
end Behavioral;
