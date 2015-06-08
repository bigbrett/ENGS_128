----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2015 10:56:55 AM
-- Design Name: 
-- Module Name: RRC_Matched_Filter - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity RRC_Matched_Filter is
    Port ( clk 				: in STD_LOGIC;
           sample_clk 		: in STD_LOGIC;
           symbol_clk		: in STD_LOGIC;
           databus_in 		: in STD_LOGIC_VECTOR (15 downto 0);
           serial_out 		: out STD_LOGIC := '0' );
end RRC_Matched_Filter;


architecture Behavioral of RRC_Matched_Filter is
          
    -- Block Memory to hold RRC coefficients 
    COMPONENT blk_mem_gen_0
      PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
    END COMPONENT;
        
    constant CTR_FULL_DELAY					: integer := 2; -- number of extra clock cycles for 129th MAC value to propogate     
    signal delay_ctr 						: unsigned (2 downto 0) := "000";
    signal delay_ctr_clr, delay_ctr_en		: std_logic := '0';
    signal delay_ctr_full					: std_logic := '0';
    
    -- X buffer
    constant XBUF_LEN                       : integer := 129; 
    constant XBUF_WIDTH                     : integer := 16; -- depth of the sample buffer
    type regfile_type is array(XBUF_LEN-1 downto 0) of std_logic_vector(XBUF_WIDTH-1 downto 0);
    signal Xbuf                             : regfile_type := (others => x"0000"); -- delay line registers
    signal Xbuf_delay1, Xbuf_delay2			: std_logic_vector(15 downto 0) := (others => '0');
    signal Xin                              : std_logic_vector(15 downto 0) := (others => '0'); -- next sample to be pushed into delay line
    signal Xreg                             : std_logic_vector (XBUF_WIDTH-1 downto 0) := (others => '0');
    
    -- MAC 
    signal clock_cnt                 		: unsigned (7 downto 0) := (others => '0'); 
    signal ctr_full                         : std_logic := '0';
    signal prod_reg                         : std_logic_vector (31 downto 0) := (others => '0');
    signal accum_reg                        : std_logic_vector (31 downto 0) := (others => '0');  
    signal MAC_out_reg                      : std_logic_vector(15 downto 0) := (others => '0');

    -- BRAM
    signal Hreg                             : std_logic_vector (XBUF_WIDTH-1 downto 0) := (others => '0');
    signal ROM_enable                       : std_logic := '1';
    signal ROM_addr                         : std_logic_vector(7 downto 0) := x"00";
    signal ROM_data                         : std_logic_vector(15 downto 0) := x"0000";
          
    -- FSM       
    signal MAC_out_en						: std_logic := '0';
    signal MAC_clr                          : std_logic := '0'; -- Enable/Clear signals to MAC
	signal ctr_enable                       : std_logic := '0';
    signal ctr_clear                        : std_logic := '0';
    type state_type is (sMAC, sDONE, sDELAY, sWAIT);
    	signal curr_state, next_state 		: state_type := sWAIT;
     
begin

-- Block Memory to hold RRC coefficients 
BlkMem : blk_mem_gen_0
PORT MAP (
    clka => clk,
    ena => ROM_enable,
    addra => ROM_addr,
    douta => ROM_data
  );
ROM_addr <= std_logic_vector(clock_cnt); -- counter tied to read address


-- X Buffer shift process
-- Xin  : new data to be shifted into bit 31 of buffer upon the enable signal
XBufferShift: process(clk, sample_clk)
begin 
  if rising_edge(clk) then       
      if (sample_clk = '1') then
          Xbuf <= Databus_in & Xbuf(XBUF_LEN-1 downto 1); -- shift out bit 0
      end if;
  end if; 
end process; 


-- registers values from sample array and ROM 
getSample: process(clk, ctr_enable)
begin 
    if rising_edge(clk) then 
    	if (MAC_clr = '1') then
    		Xbuf_delay1 <= (others => '0');
    		Xbuf_delay2 <= (others => '0');
    		Xreg <= (others => '0');
    		Hreg <= (others => '0'); 
        elsif (ctr_enable = '1') then
            Xbuf_delay1 <= Xbuf(to_integer(clock_cnt)); -- register buffer value
            Xbuf_delay2 <= Xbuf_delay1;
            Xreg <= Xbuf_delay2;
            Hreg <= ROM_data; -- registered sample from ROM 
        end if;
    end if; 
end process;


-- Simple up-counter to the depth of buffer  
ctr_full <= '1' when (clock_cnt = XBUF_LEN - 2) else '0'; 
ClockCtr: process(clk, ctr_clear)
begin 
    if rising_edge(clk) then
        if (ctr_clear = '1') then 
            clock_cnt <= (others => '0');
        elsif (ctr_enable = '1') then
            clock_cnt <= clock_cnt + 1;
        end if;
    end if;
end process;


-- Multiplies X[n-k] and H[k] on enable signal 
Multiply: process(clk)
begin 
    if rising_edge(clk) then
    	if (MAC_clr = '1') then
    		prod_reg <= (others => '0');
    	elsif (ctr_enable = '1') then       
        	prod_reg <= std_logic_vector(signed(Xreg) * signed(Hreg));
        end if;
	end if;
end process; 


-- Accumulates XBUF_LEN pipeline register values and then clears for next sample 
Accumulate: process(clk, sample_clk, MAC_clr)
begin
    if rising_edge(clk) then
        if (MAC_clr = '1') then  
            accum_reg <= (others => '0');
        elsif (ctr_enable = '1') then    
            accum_reg <= std_logic_vector(signed(accum_reg) + signed(prod_reg));
        end if;
    end if; 
end process; 


-- Register the output once accumulations are done
MAC_output: process(clk, MAC_out_en)
begin
    if (rising_edge(clk) and (MAC_out_en = '1')) then
        MAC_out_reg <= accum_reg(31 downto 16);
    end if;
end process;

DelayCounter: process(clk, delay_ctr_en, delay_ctr_clr)
begin
	if rising_edge(clk) then
		if (delay_ctr_clr = '1') then
			delay_ctr <= "000";
		elsif (delay_ctr_en = '1') then
			delay_ctr <= delay_ctr + 1;
		end if;
	end if;
end process;
delay_ctr_full <= '1' when (delay_ctr >= "100") else '0';

--sample peak of each RRC pulse from MAC_out_reg on regenerated symbol clk pulse
OutputSample: process(clk, symbol_clk)
begin 
	-- grab peak value from sample 
	if rising_edge(clk) then
		if (symbol_clk = '1') then
			serial_out <= not(MAC_out_reg(15));
		end if;
	end if;
end process;


-- ************************ FSM ************************
-- FSM logic
ControllerComb: process(curr_state, ctr_full, sample_clk, delay_ctr_full) 
begin
  -- defaults    
    next_state <= curr_state;
    MAC_clr <= '0'; 
    MAC_out_en <= '0';
    ctr_enable <= '0';
    ctr_clear <= '0';
    delay_ctr_en <= '0';
    delay_ctr_clr <= '0';
    
    case (curr_state) is
        when sMAC => -- multiply accumulate
            ctr_enable <= '1'; -- enable counter to sample data
			delay_ctr_clr <= '1'; -- clear delay counter
            if (ctr_full = '1') then
           		next_state <= sDELAY;
           	end if;
           	
        when sDELAY => 
       	 	ctr_clear <= '1';
        	ctr_enable <= '1';
        	delay_ctr_en <= '1';
        	if (delay_ctr_full = '1') then
        		next_state <= sDONE;
			end if;
        	  	
        when sDONE =>
        	MAC_out_en <= '1';
        	next_state <= sWAIT;
        
        when sWAIT =>	-- wait for sample_clock tick to begin sampling
            MAC_clr <= '1';
            if (sample_clk = '1') then
                next_state <= sMAC;
            end if;    
             
        when others => 
            next_state <= sWAIT;
    end case;
  
end process; 


-- FSM clocked process
ControllerReg: process(clk)
begin 
  if rising_edge(clk) then
      curr_state <= next_state; 
  end if; 
end process; 

end Behavioral;
