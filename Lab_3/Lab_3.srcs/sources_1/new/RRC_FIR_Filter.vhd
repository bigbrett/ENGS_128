----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Brett Nicholas and Matt Metzler
-- 
-- Create Date: 04/22/2015 08:00:42 AM
-- Design Name: 
-- Module Name: RRC_FIR_filter - Behavioral
-- Project Name: 
-- Target Devices: Arctix - 7
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RRC_Pulse_Shaper is
    Generic (
           SYMBOL_CLOCK_FREQUENCY      : integer := 40000 -- 40,000 samples/sec
            ); 
    Port ( 
           clk : in STD_LOGIC;
           symbol_clk : in STD_LOGIC;                   
           serialI : in STD_LOGIC;                      -- BPSK even bitstream
           serialQ : in STD_LOGIC;                      -- BPSK odd bitstream
           Ibus : out STD_LOGIC_VECTOR (15 downto 0);   -- modulated carrier wave
           Qbus : out STD_LOGIC_VECTOR (15 downto 0);   -- modulated carrier wave
           sample_clock : out STD_LOGIC   
           );
end RRC_Pulse_Shaper;

architecture Behavioral of RRC_Pulse_Shaper is
    -- FIR IP core   
    COMPONENT fir_compiler_0
      PORT (
        aclk : IN STD_LOGIC;
        s_axis_data_tvalid : IN STD_LOGIC;
        s_axis_data_tready : OUT STD_LOGIC;
        s_axis_data_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        m_axis_data_tvalid : OUT STD_LOGIC;
        m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
    END COMPONENT;

    -- clock divider 
    constant MASTER_CLOCK_FREQUENCY         : integer := 100000000;       -- 100 MHz clock
    constant SAMPLE_CLOCK_FREQUENCY         : integer := SYMBOL_CLOCK_FREQUENCY * 16; -- sampling rate is 16 * symbol rate, or 640,000 samples/sec.
    constant CLK_RATE_COUNT                 : integer := MASTER_CLOCK_FREQUENCY / SAMPLE_CLOCK_FREQUENCY; -- clocks per bit
    constant CLK_CTR_WIDTH                  : integer := integer(CEIL(LOG2(real(CLK_RATE_COUNT-1))));
    signal CDcount                          : unsigned(CLK_CTR_WIDTH-1 downto 0) := (others => '0');
    signal sample_clk                       : STD_LOGIC := '0'; -- sample clock internal signal 
    
    
    -- X buffer
    constant XBUF_LEN                       : integer := 129; -- depth of the sample buffer
    type regfile_type is array(XBUF_LEN-1 downto 0) of std_logic_vector(15 downto 0);
    signal Xbuf                            : regfile_type := (others => x"0000"); -- delay line registers
    signal Xin                             : std_logic_vector(15 downto 0) := (others => '0'); -- next sample to be pushed into delay line
    signal Xtop                            : std_logic_vector(15 downto 0) := (others => '0'); -- output of buffer
    signal X_shift_en                      : std_logic := '0'; -- shift enable signal 
    
    -- FSM 
    type state_type is (foo, bar);
    signal curr_state, next_state : state_type;

begin
-- FIR Pulse shaping filter instantiation 
FIR : fir_compiler_0
  PORT MAP (
    aclk => aclk,
    s_axis_data_tvalid => s_axis_data_tvalid,
    s_axis_data_tready => s_axis_data_tready,
    s_axis_data_tdata => s_axis_data_tdata,
    m_axis_data_tvalid => m_axis_data_tvalid,
    m_axis_data_tdata => m_axis_data_tdata
  );
  
  
-- Sample clock generator 
sample_clock <= sample_clk; -- output


-- X Buffer shift process
Xtop <= Xbuf(0); -- Xtop always gets top of buffer 
XBuffer: process(clk, X_shift_en)
begin 
    if rising_edge(clk) then 
        if (X_shift_en = '1') then 
            Xbuf <= Xin & Xbuf(XBUF_LEN-1 downto 1); -- shift out bit 0
        end if;
    end if; 
end process; 


-- ************************ FSM ************************
-- FSM logic
ControllerComb: process(curr_state) 
begin
	-- defaults	
	next_state <= curr_state;
	
	case (curr_state) is
	    when foo => 
	    
	    when bar => 
	    
        when others => 
           next_state <= curr_state;
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
