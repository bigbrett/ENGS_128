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
Port ( 	clk 				: in STD_LOGIC; -- master clock 
	 	spi_sclk 			: in STD_LOGIC; -- SPI clock
		sample_clk 			: in STD_LOGIC; -- sample clock 
	   	adc_ch0_sdout 		: in STD_LOGIC; -- serial converted data from ADC 
		adc_CS				: out STD_LOGIC; -- low true CS initiates conversion on falling edge
		adc_ch0_data_ready	: out STD_LOGIC; -- data ready flag true on rising edge of next SPI clock tick
		adc_ch0_word 		: out STD_LOGIC_VECTOR (11 downto 0)); -- deserialized word from ADC sample
end pmodAD1_SPI;

architecture Behavioral of pmodAD1_SPI is

	signal CS				   : std_logic := '1';
	
-- output register
	signal o_reg_load_en		: std_logic := '0'; -- enable signal for ouput register 
	
-- shift register 
	signal shift_reg		   : std_logic_vector(15 downto 0) := x"0000"; 
	signal shift_en			   : std_logic := '0'; -- shift register enable
	
-- shift counter 
	signal shift_count_clear       : std_logic := '0';  -- clears shift counter
	signal shift_count		       : integer range 0 to 16 := 0; -- shift counter
	signal shift_count_done		   : std_logic := '0'; -- done shifting flag

-- sample clock delay counter: synchronizes sample clock pulse with the rising edge of spi clock
	signal delay_count                 : integer range 0 to 6 := 0;
	signal delay_count_en              : std_logic := '0';
	signal delay_count_clear		   : std_logic := '0';
	signal delay_count_done    		   : std_logic := '0';
	signal ADC_sample                  : std_logic := '0'; 

-- state declarations for spi clock syncronous FSM
	type s_state_type is (sIDLE,sLOAD, sSHIFT, sREADY);
	signal current_state, next_state: s_state_type := sIDLE;
	
-- state declarations for master clock syncronous FSM (to synchronize sample clock ticks)
	type c_state_type is (sWAIT, sCOUNT);
	signal c_current_state, c_next_state: c_state_type := sWAIT;

begin

adc_CS <= CS;

-- *********************************************************************
-- ******************** SPI CLOCK SYNCHRONOUS LOGIC ********************
-- *********************************************************************
ShiftRegister: process(spi_sclk)
begin
	if rising_edge(spi_sclk) then
		if (shift_en = '1') then
			shift_reg <= shift_reg(14 downto 0) & adc_ch0_sdout;
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
shift_count_done <= '1' when shift_count = 14 else '0';


-- parallel load register for output
OutputReg: process(spi_sclk)
begin
	if rising_edge(spi_sclk) then
		if (o_reg_load_en = '1') then
			adc_ch0_word <= NOT(shift_reg(11)) & shift_reg(10 downto 0); 
		end if; 
	end if;
end process;


-- ************* SHIFT REGISTER FSM CONTROLLER *************
StateUpdate: process(spi_sclk)
begin
	if rising_edge(spi_sclk) then
		current_state <= next_state;
	end if;
end process;

StateMachine: process(current_state, ADC_sample, shift_count_done )
begin
	adc_ch0_data_ready <= '0';
	o_reg_load_en <= '0';	-- SR parallel load enable 
	CS <= '1';		-- serial tx begins on falling edge 
	shift_en <= '0';		-- SR enable
	shift_count_clear <= '0';	-- shift counter clear
	next_state <= current_state;
	
	case current_state is
	
		when sIDLE =>
			shift_count_clear <= '1';
			if (ADC_sample = '1') then
				next_state <= sSHIFT;
			end if;
		
		when sSHIFT =>
            CS <= '0';
            shift_en <= '1';
            if (shift_count_done = '1') then
                next_state <= sLOAD;
            end if;
            
		when sLOAD =>
			o_reg_load_en <= '1';	-- load shift register w/ parallel data		
			next_state <= sREADY;
			
		when sREADY => 
			adc_ch0_data_ready <= '1';
			next_state <= sIDLE; 	

			
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
	ADC_sample <= '0'; -- synchronized sample start tick 
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
			ADC_sample <= '1';
			if delay_count_done = '1' then
				c_next_state <= sWAIT;
			end if;
		
		when others =>
			c_next_state <= sWAIT;
			
	end case;
end process;	

end Behavioral;
