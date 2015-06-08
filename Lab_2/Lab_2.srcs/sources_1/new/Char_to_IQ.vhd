----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2015 05:52:58 PM
-- Design Name: 
-- Module Name: Char_to_IQ - Behavioral
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

entity Char_to_IQ is
Port ( 
    clk                 : in STD_LOGIC; 
    symbol_clk          : in STD_LOGIC; 
    ser_start           : in STD_LOGIC; 
    char_data_in        : in STD_LOGIC_VECTOR (7 downto 0); 
    serialI             : out STD_LOGIC; 
    serialQ             : out STD_LOGIC 
    );
end Char_to_IQ;

architecture Behavioral of Char_to_IQ is

signal char_in_reg : std_logic_vector (7 downto 0) := (others => '0');
signal serialIQ : std_logic_vector (1 downto 0) := "00";
signal serI : std_logic := '0';
signal serQ : std_logic := '0';

signal rotate : std_logic_vector (1 downto 0) := "00";
signal diff_encode_in : std_logic_vector (3 downto 0) := "0000"; 
signal diff_encode_out : std_logic_vector (1 downto 0) := "00"; 
signal diff_encode_reset    : std_logic := '0';
signal split_ctr : unsigned (1 downto 0) := (others => '0'); 


begin

-- loads the character register with the output 
-- of the buffer on every ser_start tick 
CharReg: process(clk)
begin
    if rising_edge(clk) then
        if (ser_start = '1') then
            char_in_reg <= char_data_in;
        end if;
     end if;
 end process;

-- increments bit split counter on symbol clk
splitCTR: process(clk)
begin 
    if rising_edge(clk) then 
        if (ser_start = '1') then
            split_ctr <= (others => '0');
        elsif (symbol_clk = '1') then 
            split_ctr <= split_ctr + 1;
        end if;
    end if; 
end process; 

-- Grabs correct bits from register based on counter and splits them 
IQ_Split: process(clk)
begin
    if rising_edge(clk) then 
        case split_ctr is
            when "00" => 
            -- (
               serI <= char_in_reg(7);
               serQ <= char_in_reg(6);  
            when "01" =>
               serI <= char_in_reg(5);
               serQ <= char_in_reg(4); 
            when "10" => 
               serI <= char_in_reg(3);
               serQ <= char_in_reg(2);             
            when "11" => 
               serI <= char_in_reg(1); 
               serQ <= char_in_reg(0);     
            when others => 
               serI <= '0';
               serQ <= '0'; 
       end case; 
   end if; 
end process; 

-- **********************************************************************************
-- The differential encoder transforms the current symbol and previously encoded symbol 
-- into the next encoded symbol.  See Rice, p. 403
-- To maintain phase lock between packets, the idle lines must alternate phase with
-- every symbol.  Resetting the encoder output to 01 then feeding a stream of 11 will 
-- cause the output to toggle 01-10-01-10...  
-- Because the idle symbols are 00, we invert the symbols before presenting to the encoder
-- in order to get the idle 11 stream.  We reinvert the symbols when they come out of the 
-- decoder.
diff_encode_in <= not(serQ) & not(serI) & diff_encode_out;

with rotate select 
    serialI <= diff_encode_out(0)    when "00",
            not(diff_encode_out(1))  when "01",
            not(diff_encode_out(0))  when "10",
            diff_encode_out(1)       when "11";
    
with rotate select 
    serialQ <= diff_encode_out(1)       when "00",
            diff_encode_out(0)       when "01",
            not(diff_encode_out(1))  when "10",
            not(diff_encode_out(0))  when "11";

differential_encoder: process(clk)
begin
    if rising_edge(clk) then
        if symbol_clk = '1' then
            if diff_encode_reset = '1' then
                diff_encode_out <= "01";
            else
                case diff_encode_in is
                    when x"0" | x"6" | x"9" | x"f" => diff_encode_out <= "00";
                    when x"1" | x"4" | x"b" | x"e" => diff_encode_out <= "01";
                    when x"2" | x"7" | x"8" | x"d" => diff_encode_out <= "10";
                    when x"3" | x"5" | x"a" | x"c" => diff_encode_out <= "11";
                    when others => null;
                end case;
            end if;
        end if;
    end if;
 end process;
-- -- END DIFFERENTIAL ENCODER ****************************
-- -- *****************************************************
 
end Behavioral;
