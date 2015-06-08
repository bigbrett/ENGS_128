----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2015 01:09:04 PM
-- Design Name: 
-- Module Name: IQ_to_Char - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IQ_to_Char is
Port ( 
       clk           : in STD_LOGIC;  
       symbol_clk    : in STD_LOGIC;
       serialI       : in STD_LOGIC;
       serialQ       : in STD_LOGIC;
       tx_start_tick : out STD_LOGIC;
       tx_data       : out STD_LOGIC_VECTOR (7 downto 0));
end IQ_to_Char;

architecture Behavioral of IQ_to_Char is
signal symb_dec_out : std_logic_vector (1 downto 0) := "00";
signal symb_dec_in  : std_logic_vector (3 downto 0) := "0000";
signal STX_flag     : std_logic := '0'; 
signal NUL_flag     : std_logic := '0';
signal CE, CC       : STD_LOGIC := '0';
signal shift_counter: unsigned (1 downto 0) := "00";
signal shift_reg    : std_logic_vector (7 downto 0) := (others => '0');
signal output_reg   : std_logic_vector (7 downto 0) := (others => '0'); 
type state_type is (sWAIT, sGRAB);
signal curr_state, next_state : state_type;
begin

-- **********************************************************************
-- Note symb_dec_out is QI not IQ
-- Swap and invert the symb_dec_out bits before shifting into frame buffer!
-- Differential decoder; see Rice, p. 404
DifferentialDecode: process(clk)
begin
    if rising_edge(clk) then
        if symbol_clk = '1' then  
            symb_dec_in <= symb_dec_in(1 downto 0) & serialQ & serialI;       
            case symb_dec_in is
                when x"0" | x"5" | x"a" | x"f"  => symb_dec_out <= "00";
                when x"1" | x"7" | x"8" | x"e"  => symb_dec_out <= "01";
                when x"2" | x"4" | x"b" | x"d"  => symb_dec_out <= "10";
                when x"3" | x"6" | x"9" | x"c"  => symb_dec_out <= "11";
                when others => symb_dec_out <= "00";
            end case;
        end if;
    end if;
end process;
-- End Decoder **********************************************************

-- shifts 2-bit decoder output into shift register  
-- on every every symbol_clk tick, and sets STX flag 
-- high if STX bit detected in bits 1,0 of shift register 
DataRegs: process(clk)
begin
    if rising_edge(clk) then
        -- shift register 
        if (symbol_clk = '1') then
            shift_reg <= shift_reg(5 downto 0) & not(symb_dec_out(0)) & not(symb_dec_out(1)); 
        end if;
   
        -- STX watchdog 
        if (shift_reg = x"02") then 
            STX_flag <= '1';
        else STX_flag <= '0';     
        end if;
        
        -- NUL watchdog 
        if (shift_reg = x"00") then 
            NUL_flag <= '1';
        else NUL_flag <= '0';     
        end if;
    end if;
 end process;
 
RegCounter: process(clk)
begin
    if rising_edge(clk) then
        if (CC = '1') then
            shift_counter <= "00";
        elsif (CE = '1') then
            if (symbol_clk = '1') then
                shift_counter <= shift_counter +1;
            end if;
        end if;
    end if;
end process;

tx_data <= output_reg;
TxOut: process(clk)
begin
    if rising_edge(clk) then
        if (CE = '1' and symbol_clk = '1' and shift_counter = "00") then
            output_reg <= shift_reg;
            tx_start_tick <= '1';
        else tx_start_tick <= '0';
        end if;
    end if;
end process;

ControllerComb: process(curr_state, STX_flag, NUL_flag) 
begin
	-- defaults	
	next_state <= curr_state;
	CE <= '0'; -- count enable
	CC <= '0'; -- count clear
	
	
	-- FSM logic 
	case curr_state is
		when sWAIT => 
          CC <= '1';
		  if (STX_flag = '1') then
		      next_state <= sGRAB; 
		  end if; 
		  
		when sGRAB => 
	      CE <= '1'; 
          if (NUL_FLAG = '1') then 
            next_state <= sWAIT;
          end if;
            
		when others =>
			next_state <= sWAIT;
	end case;
end process; 


ControllerReg: process(clk)
begin 
    if rising_edge(clk) then
        curr_state <= next_state; 
    end if; 
end process; 


end Behavioral;
