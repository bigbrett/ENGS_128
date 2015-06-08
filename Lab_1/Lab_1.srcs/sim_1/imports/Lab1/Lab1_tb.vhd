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
 
ENTITY Lab1_tb IS
END Lab1_tb;
 
ARCHITECTURE behavior OF Lab1_tb IS 
 
COMPONENT lab1top
    PORT(
         clk : IN  std_logic;
         RsRx : IN  std_logic;
         RsTx : OUT  std_logic;
         seg : out STD_LOGIC_VECTOR(0 to 6);
         an : out STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal RsRx : std_logic := '1';

 	--Outputs
   signal RsTx: std_logic;
   signal seg: STD_LOGIC_VECTOR(0 to 6);
   signal an: STD_LOGIC_VECTOR(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10ns;		-- 100 MHz
	
	-- Data definitions
	constant bit_time : time := 8.68us;		-- 115,200 baud
	constant TxData : std_logic_vector(71 downto 0) := x"414243444546474849";
	
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab1top PORT MAP (
          clk => clk,
          RsRx => RsRx,
          RsTx => RsTx,
          seg => seg,
          an => an
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

        -- Send the character stream from left to right	
        -- but send the bits within each char from right to left	
		for charcount in (TxData'length / 8)-1 downto 0 loop
		  RsRx <= '0';		-- Start bit
		  wait for bit_time;
		
		  for bitcount in 0 to 7 loop
            RsRx <= TxData(charcount*8 + bitcount);
            wait for bit_time;
		  end loop;
		
		  RsRx <= '1';		-- Stop bit
		  wait for 200 us;  -- Intercharacter spacing
		end loop;
		
		-- Repeat every millisecond
		wait for 10 ms;
   end process;
END;
