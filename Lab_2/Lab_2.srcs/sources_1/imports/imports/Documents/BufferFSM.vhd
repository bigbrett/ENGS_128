----------------------------------------------------------------------------------
-- Company:         Engs 128 15S
-- Engineer:        Matt Metzler
-- 
-- Create Date: 04/05/2015 03:49:36 PM
-- Design Name: 
-- Module Name: BufferFSM - Behavioral
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

entity BufferFSM is
    GENERIC ( 
           BUF_LEN              : integer := 8;
           SYMBOL_CLOCK_FREQUENCY      : integer := 40000
            );             
    Port ( 
           clk: in STD_LOGIC;
           symbol_clk : in STD_LOGIC;
           rx_done_tick : in STD_LOGIC;
           rx_data : in STD_LOGIC_VECTOR (7 downto 0);
           ser_start : out STD_LOGIC := '0';
           ser_data : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0')
           );
end BufferFSM;

architecture Behavioral of BufferFSM is
-- constant declarations	
    --constant SYMBOL_CLOCK_FREQUENCY : integer := 40000;       -- 40 kHz symbol clock
    constant CHAR_RATE : integer := 10000;               
    constant CHAR_RATE_COUNT : integer := SYMBOL_CLOCK_FREQUENCY / CHAR_RATE; -- clocks per bit
    constant CHAR_CTR_WIDTH : integer := integer(CEIL(LOG2(real(CHAR_RATE_COUNT-1))));
    constant NUL: std_logic_vector (7 downto 0) := (others => '0');
    constant STX: std_logic_vector (7 downto 0) := (1 => '1', others => '0');
    constant ADDR_WIDTH: integer := integer(CEIL(LOG2(real(BUF_LEN+1))));
    
-- signals     
    signal char_clk_cnt:    unsigned(CHAR_CTR_WIDTH-1 downto 0) := (others=>'0');
    signal char_clk : std_logic := '0';
    signal wr_address: unsigned(ADDR_WIDTH-1 downto 0) := (others=>'0');
    signal rd_address: unsigned(ADDR_WIDTH-1 downto 0) := (others=>'0');
    signal eol: STD_LOGIC := '0';
    signal stop: STD_LOGIC := '0';
    signal wr_ctr_enable: STD_LOGIC := '0';
    signal wr_ctr_clear: STD_LOGIC := '0';
    signal rd_ctr_enable: STD_LOGIC := '0';
    signal rd_ctr_clear: STD_LOGIC := '0';
    signal buff_full: STD_LOGIC := '0';
    signal wr_enable: STD_LOGIC := '0';
    signal wr_type: STD_LOGIC := '0';
    

    type regfile_type is array(BUF_LEN+1 downto 0) of std_logic_vector(7 downto 0);
    signal theBuffer : regfile_type := (0 => STX, others => NUL);
   

    type state_type is (sWAIT, sWR_INC, sWRITE, sSYNC, sSTART, sFLUSH_WAIT, sFLUSH1, sFLUSH2, sNULL_INC, sNULL);
    signal curr_state, next_state: state_type;
begin


-- *****************************************************************
-- *****************************************************************
-- CONCURENT SIGNAL ASSIGNMENTS 
ser_data <= theBuffer(to_integer(rd_address)); -- always 
eol <= '1' when rx_data = x"0d" else '0'; 
buff_full <= '1' when wr_address = BUF_LEN else '0';
stop <= '1' when theBuffer(to_integer(rd_address)) = NUL else '0';
char_clk <= '1' when char_clk_cnt = 0 and symbol_clk = '1' else '0';
-- *****************************************************************
-- *****************************************************************

Char_Clock_Divider: process(clk, symbol_clk)
begin
	if rising_edge(clk) then
	   if (symbol_clk = '1') then
	       if (char_clk_cnt = CHAR_RATE_COUNT-1) then
	           char_clk_cnt <= to_unsigned(0, char_clk_cnt'length);
	       else char_clk_cnt <= char_clk_cnt + 1;
	       end if;
       end if;
   end if;
end process Char_Clock_Divider;

Write2Buffer: process(clk)
begin
    if rising_edge(clk) then
        if (wr_enable = '1') then
            if (wr_type = '0') then 
                theBuffer(to_integer(wr_address)) <= rx_data; 
            else 
                theBuffer(to_integer(wr_address)) <= NUL; 
            end if; 
        end if;
    end if;
end process Write2Buffer;


WRITE_COUNTER: process(clk)
begin
    if rising_edge(clk) then
        if (wr_ctr_clear = '1') then
            wr_address <= to_unsigned(0, wr_address'length);
        elsif (wr_ctr_enable = '1') then
            wr_address <= wr_address + 1;
        end if;
    end if;
end process WRITE_COUNTER;

READ_COUNTER: process(clk)
begin
    if rising_edge(clk) then
        if (rd_ctr_clear = '1') then
            rd_address <= to_unsigned(0, rd_address'length);
        elsif (rd_ctr_enable = '1') then
            rd_address <= rd_address + 1;
        end if;
    end if;
end process READ_COUNTER;

BufferFSM: process(curr_state, rx_done_tick, eol, stop, char_clk, buff_full)
begin

    -- Defaults
    next_state <= curr_state;
    wr_enable <= '0'; wr_ctr_enable <= '0'; wr_ctr_clear <= '0'; 
    rd_ctr_enable <= '0'; rd_ctr_clear <= '0';
    wr_type <= '0'; 
    ser_start <= '0';
    
    -- Next state and output logic
    case curr_state is
    
        when sWAIT =>
            rd_ctr_clear <= '1';            
            if (buff_full = '1') then
                next_state <= sSYNC;
            elsif (rx_done_tick = '1') then 
                next_state <= sWR_INC; 
            end if;
        
        when sWR_INC => 
            wr_ctr_enable <= '1';
            next_state <= sWRITE; 
            
        when sWRITE => 
            wr_enable <= '1'; 
            if (EOL = '1') then 
                next_state <= sNULL_INC; 
            else
                next_state <= sWAIT; 
            end if; 
            
        when sNULL_INC =>
            wr_ctr_enable <= '1';
            next_state <= sNULL; 
            
        when sNULL => 
            wr_enable <= '1'; 
            wr_type <= '1'; 
            next_state <= sSYNC; 
            
        when sSYNC =>   
            wr_ctr_clear <= '1'; 
            wr_type <= '1'; 
            if (char_clk = '1') then 
                next_state <= sSTART;
            end if; 
        
        when sSTART => 
            ser_start <= '1';
            next_state <= sFLUSH_WAIT;
            
        when sFLUSH_WAIT => 
            if (stop = '1') then 
                next_state <= sWAIT; 
            elsif (char_clk = '1') then 
                next_state <= sFLUSH1; 
            end if; 
            
        when sFLUSH1 => 
            rd_ctr_enable <= '1'; 
            next_state <= sFLUSH2; 
        
        when sFLUSH2 =>
            ser_start <= '1'; 
            next_state <= sFLUSH_WAIT;
            
        when others =>
            next_state <= sWAIT;
            
    end case;
end process BufferFSM;

BufferFSM_update: process(clk)
begin
    if rising_edge(clk) then
        curr_state <= next_state;
    end if;
end process BufferFSM_Update;

end Behavioral;
