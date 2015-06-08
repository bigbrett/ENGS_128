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
Port ( 	clk 			: in STD_LOGIC;
		spi_sclk 		: in STD_LOGIC; 	-- serial clock 
		sample_clk 		: in STD_LOGIC;		-- sample clock 
		dac_sync 		: out STD_LOGIC;	-- sync pulse (falling edge starts conversion sequence)
		dac_ch0_word 	: in STD_LOGIC_VECTOR (11 downto 0); -- word to be transmitted over ch0
		dac_ch0_busy 	: out STD_LOGIC;	-- ch0 busy signal 
		dac_ch0_sdin 	: out STD_LOGIC; 	-- serialized data to DAC ch0
		dac_spi_sclk	: out STD_LOGIC ); 	-- serial clock passed to DAC 
end pmodDA2_SPI;

architecture Behavioral of pmodDA2_SPI is

	signal sync				   : std_logic := '1';

-- shift register 
	signal shift_reg		   : std_logic_vector(15 downto 0) := x"0000";
	signal spi_load			   : std_logic := '0';
	signal shift_en			   : std_logic := '0';
	
-- shift counter 
	signal shift_count_clear       : std_logic := '0';
	signal shift_count		       : integer range 0 to 16 := 0;
	signal shift_count_done		   : std_logic := '0';

-- sample clock delay counter
	signal delay_count                 : integer range 0 to 6 := 0;
	signal delay_count_en              : std_logic := '0';
	signal delay_count_clear		   : std_logic := '0';
	signal delay_count_done    		   : std_logic := '0';
	signal DAC_sample                  : std_logic := '0';
	
	type s_state_type is (sIDLE,sLOAD, sSHIFT);
	signal current_state, next_state: s_state_type := sIDLE;
	
	type c_state_type is (sWAIT, sCOUNT);
	signal c_current_state, c_next_state: c_state_type := sWAIT;

begin

-- pass signals on to DAC
dac_sync <= sync; 
dac_spi_sclk <= spi_sclk;
dac_ch0_sdin <= shift_reg(15); -- MSB shifted out to DAC


-- *********************************************************************
-- ******************** SPI CLOCK SYNCHRONOUS LOGIC ********************
-- *********************************************************************
ShiftRegister: process(spi_sclk)
begin
	if rising_edge(spi_sclk) then
		if (spi_load = '1') then
			shift_reg <= "1100" & not(dac_ch0_word(11)) & dac_ch0_word(10 downto 0);
		elsif (shift_en = '1') then
			shift_reg <= shift_reg(14 downto 0) & '0';
		end if;
	end if;
end process;


ShiftCounter: process(spi_sclk)
begin  
	if rising_edge(spi_sclk) then
	   if (shift_count_clear = '1') then
           shift_count <= 0;
	   elsif (shift_en = '1') then
			shift_count <= shift_count + 1;
	   end if;
	end if;
end process;
shift_count_done <= '1' when shift_count = 15 else '0';


-- *************************** FSM CONTROLLER *****************************
StateUpdate: process(spi_sclk)
begin
	if rising_edge(spi_sclk) then
		current_state <= next_state;
	end if;
end process;


StateMachine: process(current_state, DAC_sample, shift_count_done )
begin
	spi_load <= '0';	-- SR parallel load enable 
	sync <= '1';		-- serial tx begins on falling edge 
	shift_en <= '0';		-- SR enable
	shift_count_clear <= '0';	-- shift counter clear
--	spi_clk_delay_count_en <= '0';
--	spi_clk_delay_count_clear <= '0';
	dac_ch0_busy <= '1'; -- busy signal asserted low in sIDLE
	next_state <= current_state;
	
	case current_state is
	
		when sIDLE =>
			dac_ch0_busy <= '0'; -- DAC not being used 
			shift_count_clear <= '1';
			if (DAC_sample = '1') then
				next_state <= sLOAD;
			end if;
			
		when sLOAD =>
			spi_load <= '1';	-- load shift register w/ parallel data			
			next_state <= sSHIFT;
			
		when sSHIFT =>
            sync <= '0';
            shift_en <= '1';
            if (shift_count_done = '1') then
                next_state <= sIDLE;
            end if;

		when others =>
			next_state <= sIDLE;
				
	end case;
end process;


-- *********************************************************************
-- ****************** MASTER CLOCK SYNCHRONOUS LOGIC  ******************
-- *********************************************************************
DelayCounter: process(clk)
begin  
	if rising_edge(clk) then
	   if (delay_count_clear = '1') then
           delay_count <= 0;
	   elsif (delay_count_en = '1') then
			delay_count <= delay_count + 1;
	   end if;
	end if;
end process;
delay_count_done <= '1' when delay_count = 5 else '0';


UpdateState: process(clk)
begin
	if rising_edge(clk) then
		c_current_state <= c_next_state;
	end if;
end process;


CStateMachine: process(c_current_state, sample_clk, delay_count_done)
begin
	DAC_sample <= '0';
	delay_count_en <= '0';
	delay_count_clear <= '0';
	c_next_state <= c_current_state;
	
	case c_current_state is
	
		when sWAIT =>
			delay_count_clear <= '1';
			if sample_clk = '1' then
				c_next_state <= sCOUNT;
			end if;
			
		when sCOUNT =>
			delay_count_en <= '1';
			DAC_sample <= '1';
			if delay_count_done = '1' then
				c_next_state <= sWAIT;
			end if;
		
		when others =>
			c_next_state <= sWAIT;
			
	end case;
end process;	

END Behavioral;