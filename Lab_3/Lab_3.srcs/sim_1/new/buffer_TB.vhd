--------------------------------------------------------------------------------
-- Company: 		Engs 128 15S
-- Engineer:		E.W. Hansen
--
-- Create Date:     17:11:39 07/25/2009, modified 04/04/2015
-- Design Name:   
-- Module Name:     Lab1_tb.vhd
-- Project Name:    Lab1-SerialIO
-- Target Device:  
-- Tool versions:   Vivado 2014.4
-- Description:     Testbench for Lab 1.  Send a serial bit stream to the top
--                  level.
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
 
ENTITY buffer_TB IS
END buffer_TB;
 
ARCHITECTURE behavior OF buffer_TB IS 
 
Component RRC_Matched_Filter is
    Port ( clk : in STD_LOGIC;
           Xshift : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
           Ibus : in STD_LOGIC_VECTOR (15 downto 0);
           Qbus : in STD_LOGIC_VECTOR (15 downto 0);
           serialI : out STD_LOGIC;
           serialQ : out STD_LOGIC
           );
end component;
    
    
COMPONENT ClockDivider is
Port ( clk : in STD_LOGIC;
       slow_tick : out STD_LOGIC);
end component;

   --Inputs
   signal clk : std_logic := '0';
   signal Xshift : std_logic := '0';
   signal symbol_clk : std_logic := '0';
   signal serialI, serialQ : STD_LOGIC := '0';
   signal Ibus, Qbus : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); 
   signal sample_clk : std_logic := '0';
   signal Xcount : integer := 0;
   constant X1 : std_logic_vector(15 downto 0) := x"0102";
   constant X2 : STD_LOGIC_VECTOR(15 downto 0) := x"0304";
   
   -- Clock period definitions
   constant clk_period : time := 10ns;		-- 100 MHz
	
	-- Data definitions
	constant bit_time : time := 8.68us;		-- 115,200 baud
	
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: RRC_Matched_filter
   PORT MAP (
        clk => clk,
        Xshift => sample_clk,
        sample_clk => sample_clk, 
        Ibus => Ibus,
        Qbus => Qbus,
        serialI => serialI,
        serialQ => serialQ
        );

    clkdiv: ClockDivider
    Port map (
        clk => clk,
        slow_tick => sample_clk
        );
 
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
 
 
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 100 us;
		wait for 10.25*clk_period;		
       
       
       for foo in 0 to 65 loop 
        Ibus <= X1;
        wait for 100 us; 
        Ibus <= X2; 
        wait for 100us; 
       end loop;
       
       
--        -- Send the character stream from left to right	
--        -- but send the bits within each char from right to left	
--		for charcount in (TxData'length / 8)-1 downto 0 loop
--		  RsRx <= '0';		-- Start bit
--		  wait for bit_time;
		
--		  for bitcount in 0 to 7 loop
--            RsRx <= TxData(charcount*8 + bitcount);
--            wait for bit_time;
--		  end loop;
		
--		  RsRx <= '1';		-- Stop bit
--		  wait for 200 us;  -- Intercharacter spacing
--		end loop;
		
--		-- Repeat every millisecond
--		wait for 3 ms;
		 
--		 for charcount in (TxData2'length / 8)-1 downto 0 loop
--                  RsRx <= '0';        -- Start bit
--                  wait for bit_time;
                
--                  for bitcount in 0 to 7 loop
--                    RsRx <= TxData2(charcount*8 + bitcount);
--                    wait for bit_time;
--                  end loop;
                
--                  RsRx <= '1';        -- Stop bit
--                  wait for 200 us;  -- Intercharacter spacing
--                end loop;
		 
		wait for 10 ms;

		 
   end process;
END;
