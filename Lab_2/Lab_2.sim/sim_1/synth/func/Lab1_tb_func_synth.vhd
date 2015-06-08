-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
-- Date        : Fri Apr 17 12:04:00 2015
-- Host        : M210-23 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_2/Lab_2.sim/sim_1/synth/func/Lab1_tb_func_synth.vhd
-- Design      : lab1top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufferFSM is
  port (
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    symbol_clk : in STD_LOGIC
  );
end BufferFSM;

architecture STRUCTURE of BufferFSM is
  signal \^d\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal char_clk_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \n_0_char_clk_cnt[0]_i_1\ : STD_LOGIC;
  signal \n_0_char_clk_cnt[1]_i_1\ : STD_LOGIC;
  signal \n_0_curr_state[0]_i_1\ : STD_LOGIC;
  signal \n_0_curr_state[1]_i_1\ : STD_LOGIC;
  signal \n_0_curr_state[1]_i_2\ : STD_LOGIC;
  signal \n_0_curr_state[2]_i_1\ : STD_LOGIC;
  signal \n_0_curr_state[2]_i_2\ : STD_LOGIC;
  signal \n_0_curr_state[3]_i_1\ : STD_LOGIC;
  signal \n_0_curr_state[3]_i_2\ : STD_LOGIC;
  signal \n_0_curr_state[3]_i_3\ : STD_LOGIC;
  signal \n_0_curr_state[3]_i_4\ : STD_LOGIC;
  signal \n_0_curr_state[3]_i_5\ : STD_LOGIC;
  signal \n_0_curr_state[3]_i_8\ : STD_LOGIC;
  signal \n_0_rd_address_rep[0]_i_1\ : STD_LOGIC;
  signal \n_0_rd_address_rep[1]_i_1\ : STD_LOGIC;
  signal \n_0_rd_address_rep[2]_i_1\ : STD_LOGIC;
  signal \n_0_rd_address_rep[3]_i_3\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rd_address : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \rd_address_reg__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rd_ctr_clear : STD_LOGIC;
  signal rd_ctr_enable : STD_LOGIC;
  signal \wr_address_reg__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal wr_ctr_clear : STD_LOGIC;
  signal wr_ctr_enable : STD_LOGIC;
  signal wr_enable : STD_LOGIC;
  signal NLW_theBuffer_reg_0_15_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_theBuffer_reg_0_15_6_7_DOB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_theBuffer_reg_0_15_6_7_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_theBuffer_reg_0_15_6_7_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \char_clk_cnt[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \curr_state[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \curr_state[1]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \curr_state[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \curr_state[2]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \curr_state[3]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \curr_state[3]_i_4\ : label is "soft_lutpair16";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \rd_address_reg_rep[0]\ : label is "no";
  attribute equivalent_register_removal of \rd_address_reg_rep[1]\ : label is "no";
  attribute equivalent_register_removal of \rd_address_reg_rep[2]\ : label is "no";
  attribute equivalent_register_removal of \rd_address_reg_rep[3]\ : label is "no";
  attribute SOFT_HLUTNM of \rd_address_rep[0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \rd_address_rep[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \rd_address_rep[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \rd_address_rep[3]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \wr_address[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \wr_address[2]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \wr_address[3]_i_3\ : label is "soft_lutpair13";
begin
  D(7 downto 0) <= \^d\(7 downto 0);
  Q(3 downto 0) <= \^q\(3 downto 0);
\char_clk_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => char_clk_cnt(0),
      O => \n_0_char_clk_cnt[0]_i_1\
    );
\char_clk_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => char_clk_cnt(1),
      I1 => char_clk_cnt(0),
      O => \n_0_char_clk_cnt[1]_i_1\
    );
\char_clk_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => \n_0_char_clk_cnt[0]_i_1\,
      Q => char_clk_cnt(0),
      R => '0'
    );
\char_clk_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => \n_0_char_clk_cnt[1]_i_1\,
      Q => char_clk_cnt(1),
      R => '0'
    );
\char_in_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4004"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => E(0)
    );
\curr_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"118B"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(3),
      O => \n_0_curr_state[0]_i_1\
    );
\curr_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"010101011010B0F5"
    )
    port map (
      I0 => \^q\(3),
      I1 => \n_0_curr_state[2]_i_2\,
      I2 => \^q\(0),
      I3 => \n_0_curr_state[1]_i_2\,
      I4 => \^q\(2),
      I5 => \^q\(1),
      O => \n_0_curr_state[1]_i_1\
    );
\curr_state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555545"
    )
    port map (
      I0 => \^q\(0),
      I1 => \wr_address_reg__0\(2),
      I2 => \wr_address_reg__0\(3),
      I3 => \wr_address_reg__0\(0),
      I4 => \wr_address_reg__0\(1),
      O => \n_0_curr_state[1]_i_2\
    );
\curr_state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"008F"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \n_0_curr_state[2]_i_2\,
      I3 => \^q\(3),
      O => \n_0_curr_state[2]_i_1\
    );
\curr_state[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0100FFFF"
    )
    port map (
      I0 => \^d\(1),
      I1 => \^d\(0),
      I2 => \n_0_curr_state[3]_i_8\,
      I3 => \^q\(0),
      I4 => \^q\(2),
      O => \n_0_curr_state[2]_i_2\
    );
\curr_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEE8A"
    )
    port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \n_0_curr_state[3]_i_3\,
      I3 => \n_0_curr_state[3]_i_4\,
      I4 => \n_0_curr_state[3]_i_5\,
      I5 => \^q\(3),
      O => \n_0_curr_state[3]_i_1\
    );
\curr_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000008F0"
    )
    port map (
      I0 => I1,
      I1 => I2,
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^q\(2),
      O => \n_0_curr_state[3]_i_2\
    );
\curr_state[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => \^d\(1),
      I1 => \^d\(0),
      I2 => \n_0_curr_state[3]_i_8\,
      O => \n_0_curr_state[3]_i_3\
    );
\curr_state[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10FF"
    )
    port map (
      I0 => char_clk_cnt(1),
      I1 => char_clk_cnt(0),
      I2 => symbol_clk,
      I3 => \^q\(0),
      O => \n_0_curr_state[3]_i_4\
    );
\curr_state[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001011111111"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => \out\(2),
      I3 => \out\(0),
      I4 => \out\(1),
      I5 => \n_0_curr_state[1]_i_2\,
      O => \n_0_curr_state[3]_i_5\
    );
\curr_state[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => \^d\(3),
      I1 => \^d\(2),
      I2 => \^d\(6),
      I3 => \^d\(7),
      I4 => \^d\(4),
      I5 => \^d\(5),
      O => \n_0_curr_state[3]_i_8\
    );
\curr_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_curr_state[3]_i_1\,
      D => \n_0_curr_state[0]_i_1\,
      Q => \^q\(0),
      R => '0'
    );
\curr_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_curr_state[3]_i_1\,
      D => \n_0_curr_state[1]_i_1\,
      Q => \^q\(1),
      R => '0'
    );
\curr_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_curr_state[3]_i_1\,
      D => \n_0_curr_state[2]_i_1\,
      Q => \^q\(2),
      R => '0'
    );
\curr_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_curr_state[3]_i_1\,
      D => \n_0_curr_state[3]_i_2\,
      Q => \^q\(3),
      R => '0'
    );
\rd_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rd_ctr_enable,
      D => \n_0_rd_address_rep[0]_i_1\,
      Q => \rd_address_reg__0\(0),
      R => rd_ctr_clear
    );
\rd_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rd_ctr_enable,
      D => \n_0_rd_address_rep[1]_i_1\,
      Q => \rd_address_reg__0\(1),
      R => rd_ctr_clear
    );
\rd_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rd_ctr_enable,
      D => \n_0_rd_address_rep[2]_i_1\,
      Q => \rd_address_reg__0\(2),
      R => rd_ctr_clear
    );
\rd_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rd_ctr_enable,
      D => \n_0_rd_address_rep[3]_i_3\,
      Q => \rd_address_reg__0\(3),
      R => rd_ctr_clear
    );
\rd_address_reg_rep[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rd_ctr_enable,
      D => \n_0_rd_address_rep[0]_i_1\,
      Q => rd_address(0),
      R => rd_ctr_clear
    );
\rd_address_reg_rep[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rd_ctr_enable,
      D => \n_0_rd_address_rep[1]_i_1\,
      Q => rd_address(1),
      R => rd_ctr_clear
    );
\rd_address_reg_rep[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rd_ctr_enable,
      D => \n_0_rd_address_rep[2]_i_1\,
      Q => rd_address(2),
      R => rd_ctr_clear
    );
\rd_address_reg_rep[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rd_ctr_enable,
      D => \n_0_rd_address_rep[3]_i_3\,
      Q => rd_address(3),
      R => rd_ctr_clear
    );
\rd_address_rep[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \rd_address_reg__0\(0),
      O => \n_0_rd_address_rep[0]_i_1\
    );
\rd_address_rep[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \rd_address_reg__0\(0),
      I1 => \rd_address_reg__0\(1),
      O => \n_0_rd_address_rep[1]_i_1\
    );
\rd_address_rep[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => \rd_address_reg__0\(2),
      I1 => \rd_address_reg__0\(1),
      I2 => \rd_address_reg__0\(0),
      O => \n_0_rd_address_rep[2]_i_1\
    );
\rd_address_rep[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(0),
      O => rd_ctr_clear
    );
\rd_address_rep[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      O => rd_ctr_enable
    );
\rd_address_rep[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => \rd_address_reg__0\(3),
      I1 => \rd_address_reg__0\(0),
      I2 => \rd_address_reg__0\(1),
      I3 => \rd_address_reg__0\(2),
      O => \n_0_rd_address_rep[3]_i_3\
    );
theBuffer_reg_0_15_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000002",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
    port map (
      ADDRA(4) => '0',
      ADDRA(3 downto 0) => rd_address(3 downto 0),
      ADDRB(4) => '0',
      ADDRB(3 downto 0) => rd_address(3 downto 0),
      ADDRC(4) => '0',
      ADDRC(3 downto 0) => rd_address(3 downto 0),
      ADDRD(4) => '0',
      ADDRD(3 downto 0) => \wr_address_reg__0\(3 downto 0),
      DIA(1 downto 0) => p_0_in(1 downto 0),
      DIB(1 downto 0) => p_0_in(3 downto 2),
      DIC(1 downto 0) => p_0_in(5 downto 4),
      DID(1) => '0',
      DID(0) => '0',
      DOA(1 downto 0) => \^d\(1 downto 0),
      DOB(1 downto 0) => \^d\(3 downto 2),
      DOC(1 downto 0) => \^d\(5 downto 4),
      DOD(1 downto 0) => NLW_theBuffer_reg_0_15_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk_IBUF_BUFG,
      WE => wr_enable
    );
theBuffer_reg_0_15_0_5_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0120"
    )
    port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => wr_enable
    );
theBuffer_reg_0_15_0_5_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA8AAA2A"
    )
    port map (
      I0 => I3(1),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => p_0_in(1)
    );
theBuffer_reg_0_15_0_5_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA8AAA2A"
    )
    port map (
      I0 => I3(0),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => p_0_in(0)
    );
theBuffer_reg_0_15_0_5_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA8AAA2A"
    )
    port map (
      I0 => I3(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => p_0_in(3)
    );
theBuffer_reg_0_15_0_5_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA8AAA2A"
    )
    port map (
      I0 => I3(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => p_0_in(2)
    );
theBuffer_reg_0_15_0_5_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA8AAA2A"
    )
    port map (
      I0 => I3(5),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => p_0_in(5)
    );
theBuffer_reg_0_15_0_5_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA8AAA2A"
    )
    port map (
      I0 => I3(4),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => p_0_in(4)
    );
theBuffer_reg_0_15_6_7: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
    port map (
      ADDRA(4) => '0',
      ADDRA(3 downto 0) => rd_address(3 downto 0),
      ADDRB(4) => '0',
      ADDRB(3 downto 0) => rd_address(3 downto 0),
      ADDRC(4) => '0',
      ADDRC(3 downto 0) => rd_address(3 downto 0),
      ADDRD(4) => '0',
      ADDRD(3 downto 0) => \wr_address_reg__0\(3 downto 0),
      DIA(1 downto 0) => p_0_in(7 downto 6),
      DIB(1) => '0',
      DIB(0) => '0',
      DIC(1) => '0',
      DIC(0) => '0',
      DID(1) => '0',
      DID(0) => '0',
      DOA(1 downto 0) => \^d\(7 downto 6),
      DOB(1 downto 0) => NLW_theBuffer_reg_0_15_6_7_DOB_UNCONNECTED(1 downto 0),
      DOC(1 downto 0) => NLW_theBuffer_reg_0_15_6_7_DOC_UNCONNECTED(1 downto 0),
      DOD(1 downto 0) => NLW_theBuffer_reg_0_15_6_7_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk_IBUF_BUFG,
      WE => wr_enable
    );
theBuffer_reg_0_15_6_7_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA8AAA2A"
    )
    port map (
      I0 => I3(7),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => p_0_in(7)
    );
theBuffer_reg_0_15_6_7_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA8AAA2A"
    )
    port map (
      I0 => I3(6),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      O => p_0_in(6)
    );
\wr_address[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \wr_address_reg__0\(0),
      O => \plusOp__0\(0)
    );
\wr_address[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \wr_address_reg__0\(0),
      I1 => \wr_address_reg__0\(1),
      O => \plusOp__0\(1)
    );
\wr_address[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => \wr_address_reg__0\(2),
      I1 => \wr_address_reg__0\(1),
      I2 => \wr_address_reg__0\(0),
      O => \plusOp__0\(2)
    );
\wr_address[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(3),
      I3 => \^q\(2),
      O => wr_ctr_clear
    );
\wr_address[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0110"
    )
    port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => \^q\(3),
      I3 => \^q\(0),
      O => wr_ctr_enable
    );
\wr_address[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => \wr_address_reg__0\(3),
      I1 => \wr_address_reg__0\(0),
      I2 => \wr_address_reg__0\(1),
      I3 => \wr_address_reg__0\(2),
      O => \plusOp__0\(3)
    );
\wr_address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => wr_ctr_enable,
      D => \plusOp__0\(0),
      Q => \wr_address_reg__0\(0),
      R => wr_ctr_clear
    );
\wr_address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => wr_ctr_enable,
      D => \plusOp__0\(1),
      Q => \wr_address_reg__0\(1),
      R => wr_ctr_clear
    );
\wr_address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => wr_ctr_enable,
      D => \plusOp__0\(2),
      Q => \wr_address_reg__0\(2),
      R => wr_ctr_clear
    );
\wr_address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => wr_ctr_enable,
      D => \plusOp__0\(3),
      Q => \wr_address_reg__0\(3),
      R => wr_ctr_clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Char_to_IQ is
  port (
    O1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    symbol_clk : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end Char_to_IQ;

architecture STRUCTURE of Char_to_IQ is
  signal \^o1\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \n_0_char_in_reg_reg[0]\ : STD_LOGIC;
  signal \n_0_char_in_reg_reg[2]\ : STD_LOGIC;
  signal \n_0_char_in_reg_reg[4]\ : STD_LOGIC;
  signal \n_0_char_in_reg_reg[6]\ : STD_LOGIC;
  signal \n_0_char_in_reg_reg[7]\ : STD_LOGIC;
  signal \n_0_diff_encode_out[0]_i_1\ : STD_LOGIC;
  signal \n_0_diff_encode_out[1]_i_1\ : STD_LOGIC;
  signal n_0_serI_i_1 : STD_LOGIC;
  signal n_0_serQ_i_1 : STD_LOGIC;
  signal \n_0_split_ctr[0]_i_1\ : STD_LOGIC;
  signal \n_0_split_ctr[1]_i_1\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal serI : STD_LOGIC;
  signal serQ : STD_LOGIC;
  signal split_ctr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \diff_encode_out[0]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \diff_encode_out[1]_i_1\ : label is "soft_lutpair19";
begin
  O1(1 downto 0) <= \^o1\(1 downto 0);
\char_in_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      D => D(0),
      Q => \n_0_char_in_reg_reg[0]\,
      R => '0'
    );
\char_in_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      D => D(1),
      Q => p_0_in,
      R => '0'
    );
\char_in_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      D => D(2),
      Q => \n_0_char_in_reg_reg[2]\,
      R => '0'
    );
\char_in_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      D => D(3),
      Q => p_1_in,
      R => '0'
    );
\char_in_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      D => D(4),
      Q => \n_0_char_in_reg_reg[4]\,
      R => '0'
    );
\char_in_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      D => D(5),
      Q => p_2_in,
      R => '0'
    );
\char_in_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      D => D(6),
      Q => \n_0_char_in_reg_reg[6]\,
      R => '0'
    );
\char_in_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => E(0),
      D => D(7),
      Q => \n_0_char_in_reg_reg[7]\,
      R => '0'
    );
\diff_encode_out[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B81D"
    )
    port map (
      I0 => \^o1\(0),
      I1 => serQ,
      I2 => \^o1\(1),
      I3 => serI,
      O => \n_0_diff_encode_out[0]_i_1\
    );
\diff_encode_out[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E247"
    )
    port map (
      I0 => \^o1\(0),
      I1 => serI,
      I2 => \^o1\(1),
      I3 => serQ,
      O => \n_0_diff_encode_out[1]_i_1\
    );
\diff_encode_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => \n_0_diff_encode_out[0]_i_1\,
      Q => \^o1\(0),
      R => '0'
    );
\diff_encode_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => \n_0_diff_encode_out[1]_i_1\,
      Q => \^o1\(1),
      R => '0'
    );
serI_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => p_0_in,
      I1 => p_2_in,
      I2 => split_ctr(0),
      I3 => p_1_in,
      I4 => split_ctr(1),
      I5 => \n_0_char_in_reg_reg[7]\,
      O => n_0_serI_i_1
    );
serI_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => n_0_serI_i_1,
      Q => serI,
      R => '0'
    );
serQ_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => \n_0_char_in_reg_reg[0]\,
      I1 => \n_0_char_in_reg_reg[4]\,
      I2 => split_ctr(0),
      I3 => \n_0_char_in_reg_reg[2]\,
      I4 => split_ctr(1),
      I5 => \n_0_char_in_reg_reg[6]\,
      O => n_0_serQ_i_1
    );
serQ_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => n_0_serQ_i_1,
      Q => serQ,
      R => '0'
    );
\split_ctr[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666666606606666"
    )
    port map (
      I0 => split_ctr(0),
      I1 => symbol_clk,
      I2 => Q(1),
      I3 => Q(0),
      I4 => Q(2),
      I5 => Q(3),
      O => \n_0_split_ctr[0]_i_1\
    );
\split_ctr[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"006A"
    )
    port map (
      I0 => split_ctr(1),
      I1 => symbol_clk,
      I2 => split_ctr(0),
      I3 => E(0),
      O => \n_0_split_ctr[1]_i_1\
    );
\split_ctr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_split_ctr[0]_i_1\,
      Q => split_ctr(0),
      R => '0'
    );
\split_ctr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_split_ctr[1]_i_1\,
      Q => split_ctr(1),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ClockDivider is
  port (
    symbol_clk : out STD_LOGIC;
    clk_IBUF_BUFG : in STD_LOGIC
  );
end ClockDivider;

architecture STRUCTURE of ClockDivider is
  signal CDcount_reg : STD_LOGIC_VECTOR ( 12 downto 3 );
  signal \n_0_CDcount[0]_i_1\ : STD_LOGIC;
  signal \n_0_CDcount[0]_i_3\ : STD_LOGIC;
  signal \n_0_CDcount[0]_i_4\ : STD_LOGIC;
  signal \n_0_CDcount[0]_i_5\ : STD_LOGIC;
  signal \n_0_CDcount[0]_i_6\ : STD_LOGIC;
  signal \n_0_CDcount[0]_i_7\ : STD_LOGIC;
  signal \n_0_CDcount[0]_i_8\ : STD_LOGIC;
  signal \n_0_CDcount[12]_i_2\ : STD_LOGIC;
  signal \n_0_CDcount[4]_i_2\ : STD_LOGIC;
  signal \n_0_CDcount[4]_i_3\ : STD_LOGIC;
  signal \n_0_CDcount[4]_i_4\ : STD_LOGIC;
  signal \n_0_CDcount[4]_i_5\ : STD_LOGIC;
  signal \n_0_CDcount[8]_i_2\ : STD_LOGIC;
  signal \n_0_CDcount[8]_i_3\ : STD_LOGIC;
  signal \n_0_CDcount[8]_i_4\ : STD_LOGIC;
  signal \n_0_CDcount[8]_i_5\ : STD_LOGIC;
  signal \n_0_CDcount_reg[0]\ : STD_LOGIC;
  signal \n_0_CDcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_0_CDcount_reg[1]\ : STD_LOGIC;
  signal \n_0_CDcount_reg[2]\ : STD_LOGIC;
  signal \n_0_CDcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_0_CDcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_1_CDcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_1_CDcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_1_CDcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_2_CDcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_2_CDcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_2_CDcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_3_CDcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_3_CDcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_3_CDcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_4_CDcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_4_CDcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_4_CDcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_5_CDcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_5_CDcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_5_CDcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_6_CDcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_6_CDcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_6_CDcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_7_CDcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_7_CDcount_reg[12]_i_1\ : STD_LOGIC;
  signal \n_7_CDcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_7_CDcount_reg[8]_i_1\ : STD_LOGIC;
  signal \NLW_CDcount_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_CDcount_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
begin
\CDcount[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A8A8A8AA"
    )
    port map (
      I0 => CDcount_reg(12),
      I1 => CDcount_reg(10),
      I2 => CDcount_reg(11),
      I3 => \n_0_CDcount[0]_i_3\,
      I4 => \n_0_CDcount[0]_i_4\,
      O => \n_0_CDcount[0]_i_1\
    );
\CDcount[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => CDcount_reg(6),
      I1 => CDcount_reg(5),
      I2 => CDcount_reg(3),
      I3 => CDcount_reg(4),
      O => \n_0_CDcount[0]_i_3\
    );
\CDcount[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => CDcount_reg(9),
      I1 => CDcount_reg(8),
      I2 => CDcount_reg(7),
      O => \n_0_CDcount[0]_i_4\
    );
\CDcount[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CDcount_reg(3),
      O => \n_0_CDcount[0]_i_5\
    );
\CDcount[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_CDcount_reg[2]\,
      O => \n_0_CDcount[0]_i_6\
    );
\CDcount[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_CDcount_reg[1]\,
      O => \n_0_CDcount[0]_i_7\
    );
\CDcount[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \n_0_CDcount_reg[0]\,
      O => \n_0_CDcount[0]_i_8\
    );
\CDcount[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CDcount_reg(12),
      O => \n_0_CDcount[12]_i_2\
    );
\CDcount[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CDcount_reg(7),
      O => \n_0_CDcount[4]_i_2\
    );
\CDcount[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CDcount_reg(6),
      O => \n_0_CDcount[4]_i_3\
    );
\CDcount[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CDcount_reg(5),
      O => \n_0_CDcount[4]_i_4\
    );
\CDcount[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CDcount_reg(4),
      O => \n_0_CDcount[4]_i_5\
    );
\CDcount[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CDcount_reg(11),
      O => \n_0_CDcount[8]_i_2\
    );
\CDcount[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CDcount_reg(10),
      O => \n_0_CDcount[8]_i_3\
    );
\CDcount[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CDcount_reg(9),
      O => \n_0_CDcount[8]_i_4\
    );
\CDcount[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => CDcount_reg(8),
      O => \n_0_CDcount[8]_i_5\
    );
\CDcount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_7_CDcount_reg[0]_i_2\,
      Q => \n_0_CDcount_reg[0]\,
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[0]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_CDcount_reg[0]_i_2\,
      CO(2) => \n_1_CDcount_reg[0]_i_2\,
      CO(1) => \n_2_CDcount_reg[0]_i_2\,
      CO(0) => \n_3_CDcount_reg[0]_i_2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \n_4_CDcount_reg[0]_i_2\,
      O(2) => \n_5_CDcount_reg[0]_i_2\,
      O(1) => \n_6_CDcount_reg[0]_i_2\,
      O(0) => \n_7_CDcount_reg[0]_i_2\,
      S(3) => \n_0_CDcount[0]_i_5\,
      S(2) => \n_0_CDcount[0]_i_6\,
      S(1) => \n_0_CDcount[0]_i_7\,
      S(0) => \n_0_CDcount[0]_i_8\
    );
\CDcount_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_5_CDcount_reg[8]_i_1\,
      Q => CDcount_reg(10),
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_4_CDcount_reg[8]_i_1\,
      Q => CDcount_reg(11),
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_7_CDcount_reg[12]_i_1\,
      Q => CDcount_reg(12),
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[12]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_CDcount_reg[8]_i_1\,
      CO(3 downto 0) => \NLW_CDcount_reg[12]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_CDcount_reg[12]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \n_7_CDcount_reg[12]_i_1\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_CDcount[12]_i_2\
    );
\CDcount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_6_CDcount_reg[0]_i_2\,
      Q => \n_0_CDcount_reg[1]\,
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_5_CDcount_reg[0]_i_2\,
      Q => \n_0_CDcount_reg[2]\,
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_4_CDcount_reg[0]_i_2\,
      Q => CDcount_reg(3),
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_7_CDcount_reg[4]_i_1\,
      Q => CDcount_reg(4),
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[4]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_CDcount_reg[0]_i_2\,
      CO(3) => \n_0_CDcount_reg[4]_i_1\,
      CO(2) => \n_1_CDcount_reg[4]_i_1\,
      CO(1) => \n_2_CDcount_reg[4]_i_1\,
      CO(0) => \n_3_CDcount_reg[4]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_CDcount_reg[4]_i_1\,
      O(2) => \n_5_CDcount_reg[4]_i_1\,
      O(1) => \n_6_CDcount_reg[4]_i_1\,
      O(0) => \n_7_CDcount_reg[4]_i_1\,
      S(3) => \n_0_CDcount[4]_i_2\,
      S(2) => \n_0_CDcount[4]_i_3\,
      S(1) => \n_0_CDcount[4]_i_4\,
      S(0) => \n_0_CDcount[4]_i_5\
    );
\CDcount_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_6_CDcount_reg[4]_i_1\,
      Q => CDcount_reg(5),
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_5_CDcount_reg[4]_i_1\,
      Q => CDcount_reg(6),
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_4_CDcount_reg[4]_i_1\,
      Q => CDcount_reg(7),
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_7_CDcount_reg[8]_i_1\,
      Q => CDcount_reg(8),
      R => \n_0_CDcount[0]_i_1\
    );
\CDcount_reg[8]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_CDcount_reg[4]_i_1\,
      CO(3) => \n_0_CDcount_reg[8]_i_1\,
      CO(2) => \n_1_CDcount_reg[8]_i_1\,
      CO(1) => \n_2_CDcount_reg[8]_i_1\,
      CO(0) => \n_3_CDcount_reg[8]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_CDcount_reg[8]_i_1\,
      O(2) => \n_5_CDcount_reg[8]_i_1\,
      O(1) => \n_6_CDcount_reg[8]_i_1\,
      O(0) => \n_7_CDcount_reg[8]_i_1\,
      S(3) => \n_0_CDcount[8]_i_2\,
      S(2) => \n_0_CDcount[8]_i_3\,
      S(1) => \n_0_CDcount[8]_i_4\,
      S(0) => \n_0_CDcount[8]_i_5\
    );
\CDcount_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_6_CDcount_reg[8]_i_1\,
      Q => CDcount_reg(9),
      R => \n_0_CDcount[0]_i_1\
    );
slow_tick_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_CDcount[0]_i_1\,
      Q => symbol_clk,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity IQ_to_Char is
  port (
    tx_start_tick : out STD_LOGIC;
    O1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    symbol_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end IQ_to_Char;

architecture STRUCTURE of IQ_to_Char is
  signal NUL_flag : STD_LOGIC;
  signal STX_flag : STD_LOGIC;
  signal curr_state : STD_LOGIC;
  signal n_0_NUL_flag_i_2 : STD_LOGIC;
  signal n_0_NUL_flag_reg : STD_LOGIC;
  signal n_0_STX_flag_reg : STD_LOGIC;
  signal n_0_curr_state_i_1 : STD_LOGIC;
  signal \n_0_shift_counter[0]_i_1\ : STD_LOGIC;
  signal \n_0_shift_counter[1]_i_1\ : STD_LOGIC;
  signal \n_0_shift_counter_reg[0]\ : STD_LOGIC;
  signal \n_0_shift_counter_reg[1]\ : STD_LOGIC;
  signal \n_0_shift_reg_reg[6]\ : STD_LOGIC;
  signal \n_0_shift_reg_reg[7]\ : STD_LOGIC;
  signal \n_0_symb_dec_out[0]_inv_i_1\ : STD_LOGIC;
  signal \n_0_symb_dec_out[1]_inv_i_1\ : STD_LOGIC;
  signal n_0_tx_start_tick_i_1 : STD_LOGIC;
  signal p_2_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal shift_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal symb_dec_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of NUL_flag_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of STX_flag_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \shift_counter[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \shift_counter[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \symb_dec_out[0]_inv_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \symb_dec_out[1]_inv_i_1\ : label is "soft_lutpair4";
begin
NUL_flag_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => \n_0_shift_reg_reg[6]\,
      I1 => n_0_NUL_flag_i_2,
      I2 => shift_reg(1),
      O => NUL_flag
    );
NUL_flag_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => shift_reg(0),
      I1 => \n_0_shift_reg_reg[7]\,
      I2 => shift_reg(4),
      I3 => shift_reg(5),
      I4 => shift_reg(2),
      I5 => shift_reg(3),
      O => n_0_NUL_flag_i_2
    );
NUL_flag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => NUL_flag,
      Q => n_0_NUL_flag_reg,
      R => '0'
    );
STX_flag_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => \n_0_shift_reg_reg[6]\,
      I1 => n_0_NUL_flag_i_2,
      I2 => shift_reg(1),
      O => STX_flag
    );
STX_flag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => STX_flag,
      Q => n_0_STX_flag_reg,
      R => '0'
    );
curr_state_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
    port map (
      I0 => n_0_NUL_flag_reg,
      I1 => curr_state,
      I2 => n_0_STX_flag_reg,
      O => n_0_curr_state_i_1
    );
curr_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => n_0_curr_state_i_1,
      Q => curr_state,
      R => '0'
    );
\output_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => n_0_tx_start_tick_i_1,
      D => shift_reg(0),
      Q => O1(0),
      R => '0'
    );
\output_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => n_0_tx_start_tick_i_1,
      D => shift_reg(1),
      Q => O1(1),
      R => '0'
    );
\output_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => n_0_tx_start_tick_i_1,
      D => shift_reg(2),
      Q => O1(2),
      R => '0'
    );
\output_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => n_0_tx_start_tick_i_1,
      D => shift_reg(3),
      Q => O1(3),
      R => '0'
    );
\output_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => n_0_tx_start_tick_i_1,
      D => shift_reg(4),
      Q => O1(4),
      R => '0'
    );
\output_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => n_0_tx_start_tick_i_1,
      D => shift_reg(5),
      Q => O1(5),
      R => '0'
    );
\output_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => n_0_tx_start_tick_i_1,
      D => \n_0_shift_reg_reg[6]\,
      Q => O1(6),
      R => '0'
    );
\output_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => n_0_tx_start_tick_i_1,
      D => \n_0_shift_reg_reg[7]\,
      Q => O1(7),
      R => '0'
    );
\shift_counter[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
    port map (
      I0 => \n_0_shift_counter_reg[0]\,
      I1 => symbol_clk,
      I2 => curr_state,
      O => \n_0_shift_counter[0]_i_1\
    );
\shift_counter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A00"
    )
    port map (
      I0 => \n_0_shift_counter_reg[1]\,
      I1 => symbol_clk,
      I2 => \n_0_shift_counter_reg[0]\,
      I3 => curr_state,
      O => \n_0_shift_counter[1]_i_1\
    );
\shift_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_shift_counter[0]_i_1\,
      Q => \n_0_shift_counter_reg[0]\,
      R => '0'
    );
\shift_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_shift_counter[1]_i_1\,
      Q => \n_0_shift_counter_reg[1]\,
      R => '0'
    );
\shift_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => p_2_out(0),
      Q => shift_reg(0),
      R => '0'
    );
\shift_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => p_2_out(1),
      Q => shift_reg(1),
      R => '0'
    );
\shift_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => shift_reg(0),
      Q => shift_reg(2),
      R => '0'
    );
\shift_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => shift_reg(1),
      Q => shift_reg(3),
      R => '0'
    );
\shift_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => shift_reg(2),
      Q => shift_reg(4),
      R => '0'
    );
\shift_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => shift_reg(3),
      Q => shift_reg(5),
      R => '0'
    );
\shift_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => shift_reg(4),
      Q => \n_0_shift_reg_reg[6]\,
      R => '0'
    );
\shift_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => shift_reg(5),
      Q => \n_0_shift_reg_reg[7]\,
      R => '0'
    );
\symb_dec_in_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => Q(0),
      Q => symb_dec_in(0),
      R => '0'
    );
\symb_dec_in_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => Q(1),
      Q => symb_dec_in(1),
      R => '0'
    );
\symb_dec_in_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => symb_dec_in(0),
      Q => symb_dec_in(2),
      R => '0'
    );
\symb_dec_in_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => symb_dec_in(1),
      Q => symb_dec_in(3),
      R => '0'
    );
\symb_dec_out[0]_inv_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B81D"
    )
    port map (
      I0 => symb_dec_in(0),
      I1 => symb_dec_in(2),
      I2 => symb_dec_in(1),
      I3 => symb_dec_in(3),
      O => \n_0_symb_dec_out[0]_inv_i_1\
    );
\symb_dec_out[1]_inv_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E247"
    )
    port map (
      I0 => symb_dec_in(0),
      I1 => symb_dec_in(3),
      I2 => symb_dec_in(1),
      I3 => symb_dec_in(2),
      O => \n_0_symb_dec_out[1]_inv_i_1\
    );
\symb_dec_out_reg[0]_inv\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => \n_0_symb_dec_out[0]_inv_i_1\,
      Q => p_2_out(1),
      R => '0'
    );
\symb_dec_out_reg[1]_inv\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => symbol_clk,
      D => \n_0_symb_dec_out[1]_inv_i_1\,
      Q => p_2_out(0),
      R => '0'
    );
tx_start_tick_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => symbol_clk,
      I1 => curr_state,
      I2 => \n_0_shift_counter_reg[1]\,
      I3 => \n_0_shift_counter_reg[0]\,
      O => n_0_tx_start_tick_i_1
    );
tx_start_tick_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => n_0_tx_start_tick_i_1,
      Q => tx_start_tick,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SerialRx is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    O1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    O2 : out STD_LOGIC;
    clk_IBUF_BUFG : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end SerialRx;

architecture STRUCTURE of SerialRx is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \bit_ctr_reg__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal curr_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \n_0_FSM_sequential_curr_state[0]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_sequential_curr_state[1]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_sequential_curr_state[2]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_sequential_curr_state[2]_i_2\ : STD_LOGIC;
  signal \n_0_bit_ctr[0]_i_1\ : STD_LOGIC;
  signal n_0_rx_sample_i_1 : STD_LOGIC;
  signal n_0_rx_sample_reg : STD_LOGIC;
  signal \n_0_rx_sync_reg[0]\ : STD_LOGIC;
  signal \n_0_rx_sync_reg[1]\ : STD_LOGIC;
  signal \n_0_tick_ctr[7]_i_2\ : STD_LOGIC;
  signal \n_0_tick_ctr[7]_i_3\ : STD_LOGIC;
  signal \n_0_tick_ctr[8]_i_2\ : STD_LOGIC;
  signal \n_0_tick_ctr[9]_i_1\ : STD_LOGIC;
  signal \n_0_tick_ctr[9]_i_3\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal rx_output : STD_LOGIC;
  signal rx_reg : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal rx_reg_full : STD_LOGIC;
  signal rx_shift : STD_LOGIC;
  signal tick_ctr : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal tick_ctr_0 : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_curr_state[0]_i_2\ : label is "soft_lutpair21";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_curr_state_reg[0]\ : label is "yes";
  attribute KEEP of \FSM_sequential_curr_state_reg[1]\ : label is "yes";
  attribute KEEP of \FSM_sequential_curr_state_reg[2]\ : label is "yes";
  attribute SOFT_HLUTNM of \bit_ctr[1]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \bit_ctr[2]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \bit_ctr[3]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \tick_ctr[0]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \tick_ctr[2]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \tick_ctr[3]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \tick_ctr[6]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \tick_ctr[7]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \tick_ctr[7]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \tick_ctr[8]_i_2\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \tick_ctr[9]_i_2\ : label is "soft_lutpair23";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  \out\(2 downto 0) <= curr_state(2 downto 0);
\FSM_sequential_curr_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4511FFFF45110000"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(1),
      I2 => rx_reg_full,
      I3 => curr_state(0),
      I4 => \n_0_FSM_sequential_curr_state[2]_i_2\,
      I5 => curr_state(0),
      O => \n_0_FSM_sequential_curr_state[0]_i_1\
    );
\FSM_sequential_curr_state[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => \bit_ctr_reg__0\(0),
      I1 => \bit_ctr_reg__0\(1),
      I2 => \bit_ctr_reg__0\(3),
      I3 => \bit_ctr_reg__0\(2),
      O => rx_reg_full
    );
\FSM_sequential_curr_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FF0200"
    )
    port map (
      I0 => curr_state(0),
      I1 => curr_state(2),
      I2 => curr_state(1),
      I3 => \n_0_FSM_sequential_curr_state[2]_i_2\,
      I4 => curr_state(1),
      O => \n_0_FSM_sequential_curr_state[1]_i_1\
    );
\FSM_sequential_curr_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FF0200"
    )
    port map (
      I0 => curr_state(1),
      I1 => curr_state(2),
      I2 => curr_state(0),
      I3 => \n_0_FSM_sequential_curr_state[2]_i_2\,
      I4 => curr_state(2),
      O => \n_0_FSM_sequential_curr_state[2]_i_1\
    );
\FSM_sequential_curr_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0055FEAA0055FEFF"
    )
    port map (
      I0 => curr_state(1),
      I1 => rx_reg_full,
      I2 => n_0_rx_sample_reg,
      I3 => curr_state(0),
      I4 => curr_state(2),
      I5 => \n_0_rx_sync_reg[0]\,
      O => \n_0_FSM_sequential_curr_state[2]_i_2\
    );
\FSM_sequential_curr_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_FSM_sequential_curr_state[0]_i_1\,
      Q => curr_state(0),
      R => '0'
    );
\FSM_sequential_curr_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_FSM_sequential_curr_state[1]_i_1\,
      Q => curr_state(1),
      R => '0'
    );
\FSM_sequential_curr_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_FSM_sequential_curr_state[2]_i_1\,
      Q => curr_state(2),
      R => '0'
    );
\bit_ctr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \bit_ctr_reg__0\(0),
      O => \n_0_bit_ctr[0]_i_1\
    );
\bit_ctr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \bit_ctr_reg__0\(1),
      I1 => \bit_ctr_reg__0\(0),
      O => plusOp(1)
    );
\bit_ctr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => \bit_ctr_reg__0\(2),
      I1 => \bit_ctr_reg__0\(0),
      I2 => \bit_ctr_reg__0\(1),
      O => plusOp(2)
    );
\bit_ctr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => \bit_ctr_reg__0\(3),
      I1 => \bit_ctr_reg__0\(1),
      I2 => \bit_ctr_reg__0\(0),
      I3 => \bit_ctr_reg__0\(2),
      O => plusOp(3)
    );
\bit_ctr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => \n_0_bit_ctr[0]_i_1\,
      Q => \bit_ctr_reg__0\(0),
      R => \n_0_tick_ctr[9]_i_1\
    );
\bit_ctr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => plusOp(1),
      Q => \bit_ctr_reg__0\(1),
      R => \n_0_tick_ctr[9]_i_1\
    );
\bit_ctr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => plusOp(2),
      Q => \bit_ctr_reg__0\(2),
      R => \n_0_tick_ctr[9]_i_1\
    );
\bit_ctr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => plusOp(3),
      Q => \bit_ctr_reg__0\(3),
      R => \n_0_tick_ctr[9]_i_1\
    );
\curr_state[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \^q\(6),
      I1 => \^q\(4),
      O => O2
    );
\curr_state[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
    port map (
      I0 => \^q\(5),
      I1 => \^q\(7),
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \^q\(3),
      I5 => \^q\(0),
      O => O1
    );
\rx_data[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => curr_state(1),
      I1 => curr_state(2),
      I2 => curr_state(0),
      O => rx_output
    );
\rx_data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_output,
      D => rx_reg(1),
      Q => \^q\(0),
      R => '0'
    );
\rx_data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_output,
      D => rx_reg(2),
      Q => \^q\(1),
      R => '0'
    );
\rx_data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_output,
      D => rx_reg(3),
      Q => \^q\(2),
      R => '0'
    );
\rx_data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_output,
      D => rx_reg(4),
      Q => \^q\(3),
      R => '0'
    );
\rx_data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_output,
      D => rx_reg(5),
      Q => \^q\(4),
      R => '0'
    );
\rx_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_output,
      D => rx_reg(6),
      Q => \^q\(5),
      R => '0'
    );
\rx_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_output,
      D => rx_reg(7),
      Q => \^q\(6),
      R => '0'
    );
\rx_data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_output,
      D => rx_reg(8),
      Q => \^q\(7),
      R => '0'
    );
\rx_reg[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      O => rx_shift
    );
\rx_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => rx_reg(2),
      Q => rx_reg(1),
      R => '0'
    );
\rx_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => rx_reg(3),
      Q => rx_reg(2),
      R => '0'
    );
\rx_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => rx_reg(4),
      Q => rx_reg(3),
      R => '0'
    );
\rx_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => rx_reg(5),
      Q => rx_reg(4),
      R => '0'
    );
\rx_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => rx_reg(6),
      Q => rx_reg(5),
      R => '0'
    );
\rx_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => rx_reg(7),
      Q => rx_reg(6),
      R => '0'
    );
\rx_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => rx_reg(8),
      Q => rx_reg(7),
      R => '0'
    );
\rx_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => rx_reg(9),
      Q => rx_reg(8),
      R => '0'
    );
\rx_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => rx_shift,
      D => \n_0_rx_sync_reg[0]\,
      Q => rx_reg(9),
      R => '0'
    );
rx_sample_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \n_0_tick_ctr[7]_i_2\,
      O => n_0_rx_sample_i_1
    );
rx_sample_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => n_0_rx_sample_i_1,
      Q => n_0_rx_sample_reg,
      R => \n_0_tick_ctr[9]_i_1\
    );
\rx_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_rx_sync_reg[1]\,
      Q => \n_0_rx_sync_reg[0]\,
      R => '0'
    );
\rx_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => D(0),
      Q => \n_0_rx_sync_reg[1]\,
      R => '0'
    );
\tick_ctr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_tick_ctr[7]_i_2\,
      I1 => tick_ctr(0),
      O => tick_ctr_0(0)
    );
\tick_ctr[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"82"
    )
    port map (
      I0 => \n_0_tick_ctr[7]_i_2\,
      I1 => tick_ctr(1),
      I2 => tick_ctr(0),
      O => tick_ctr_0(1)
    );
\tick_ctr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
    port map (
      I0 => tick_ctr(0),
      I1 => tick_ctr(1),
      I2 => tick_ctr(2),
      O => tick_ctr_0(2)
    );
\tick_ctr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA80002"
    )
    port map (
      I0 => \n_0_tick_ctr[7]_i_2\,
      I1 => tick_ctr(2),
      I2 => tick_ctr(1),
      I3 => tick_ctr(0),
      I4 => tick_ctr(3),
      O => tick_ctr_0(3)
    );
\tick_ctr[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000002"
    )
    port map (
      I0 => \n_0_tick_ctr[7]_i_2\,
      I1 => tick_ctr(3),
      I2 => tick_ctr(0),
      I3 => tick_ctr(1),
      I4 => tick_ctr(2),
      I5 => tick_ctr(4),
      O => tick_ctr_0(4)
    );
\tick_ctr[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA9"
    )
    port map (
      I0 => tick_ctr(5),
      I1 => tick_ctr(3),
      I2 => tick_ctr(0),
      I3 => tick_ctr(1),
      I4 => tick_ctr(2),
      I5 => tick_ctr(4),
      O => tick_ctr_0(5)
    );
\tick_ctr[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
    port map (
      I0 => tick_ctr(6),
      I1 => tick_ctr(5),
      I2 => tick_ctr(4),
      I3 => \n_0_tick_ctr[8]_i_2\,
      O => tick_ctr_0(6)
    );
\tick_ctr[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000002"
    )
    port map (
      I0 => \n_0_tick_ctr[7]_i_2\,
      I1 => tick_ctr(5),
      I2 => tick_ctr(4),
      I3 => \n_0_tick_ctr[8]_i_2\,
      I4 => tick_ctr(6),
      I5 => tick_ctr(7),
      O => tick_ctr_0(7)
    );
\tick_ctr[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => tick_ctr(9),
      I1 => tick_ctr(8),
      I2 => \n_0_tick_ctr[8]_i_2\,
      I3 => \n_0_tick_ctr[7]_i_3\,
      O => \n_0_tick_ctr[7]_i_2\
    );
\tick_ctr[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => tick_ctr(5),
      I1 => tick_ctr(4),
      I2 => tick_ctr(7),
      I3 => tick_ctr(6),
      O => \n_0_tick_ctr[7]_i_3\
    );
\tick_ctr[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA9"
    )
    port map (
      I0 => tick_ctr(8),
      I1 => tick_ctr(5),
      I2 => tick_ctr(4),
      I3 => tick_ctr(7),
      I4 => tick_ctr(6),
      I5 => \n_0_tick_ctr[8]_i_2\,
      O => tick_ctr_0(8)
    );
\tick_ctr[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => tick_ctr(3),
      I1 => tick_ctr(0),
      I2 => tick_ctr(1),
      I3 => tick_ctr(2),
      O => \n_0_tick_ctr[8]_i_2\
    );
\tick_ctr[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      O => \n_0_tick_ctr[9]_i_1\
    );
\tick_ctr[9]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => tick_ctr(9),
      I1 => \n_0_tick_ctr[9]_i_3\,
      O => tick_ctr_0(9)
    );
\tick_ctr[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => tick_ctr(5),
      I1 => tick_ctr(4),
      I2 => tick_ctr(7),
      I3 => tick_ctr(6),
      I4 => \n_0_tick_ctr[8]_i_2\,
      I5 => tick_ctr(8),
      O => \n_0_tick_ctr[9]_i_3\
    );
\tick_ctr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => tick_ctr_0(0),
      Q => tick_ctr(0),
      R => \n_0_tick_ctr[9]_i_1\
    );
\tick_ctr_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => tick_ctr_0(1),
      Q => tick_ctr(1),
      S => \n_0_tick_ctr[9]_i_1\
    );
\tick_ctr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => tick_ctr_0(2),
      Q => tick_ctr(2),
      R => \n_0_tick_ctr[9]_i_1\
    );
\tick_ctr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => tick_ctr_0(3),
      Q => tick_ctr(3),
      R => \n_0_tick_ctr[9]_i_1\
    );
\tick_ctr_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => tick_ctr_0(4),
      Q => tick_ctr(4),
      S => \n_0_tick_ctr[9]_i_1\
    );
\tick_ctr_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => tick_ctr_0(5),
      Q => tick_ctr(5),
      S => \n_0_tick_ctr[9]_i_1\
    );
\tick_ctr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => tick_ctr_0(6),
      Q => tick_ctr(6),
      R => \n_0_tick_ctr[9]_i_1\
    );
\tick_ctr_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => tick_ctr_0(7),
      Q => tick_ctr(7),
      S => \n_0_tick_ctr[9]_i_1\
    );
\tick_ctr_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => tick_ctr_0(8),
      Q => tick_ctr(8),
      S => \n_0_tick_ctr[9]_i_1\
    );
\tick_ctr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => tick_ctr_0(9),
      Q => tick_ctr(9),
      R => \n_0_tick_ctr[9]_i_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SerialTx is
  port (
    O2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    O1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_start_tick : in STD_LOGIC
  );
end SerialTx;

architecture STRUCTURE of SerialTx is
  signal br_cnt : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal br_cnt_0 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal br_tick : STD_LOGIC;
  signal curr_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal minusOp : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \n_0_FSM_sequential_curr_state[0]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_sequential_curr_state[1]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_sequential_curr_state[1]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_sequential_curr_state[2]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_sequential_curr_state[2]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_sequential_curr_state[2]_i_3\ : STD_LOGIC;
  signal \n_0_br_cnt[5]_i_2\ : STD_LOGIC;
  signal \n_0_br_cnt[9]_i_2\ : STD_LOGIC;
  signal \n_0_br_cnt[9]_i_3\ : STD_LOGIC;
  signal \n_0_br_cnt[9]_i_4\ : STD_LOGIC;
  signal n_0_br_tick_i_2 : STD_LOGIC;
  signal n_0_br_tick_reg : STD_LOGIC;
  signal \n_0_tx_ctr[1]_i_1\ : STD_LOGIC;
  signal \n_0_tx_ctr[3]_i_2\ : STD_LOGIC;
  signal \n_0_tx_reg[0]_i_1\ : STD_LOGIC;
  signal \n_0_tx_reg[1]_i_1\ : STD_LOGIC;
  signal \n_0_tx_reg[2]_i_1\ : STD_LOGIC;
  signal \n_0_tx_reg[3]_i_1\ : STD_LOGIC;
  signal \n_0_tx_reg[4]_i_1\ : STD_LOGIC;
  signal \n_0_tx_reg[5]_i_1\ : STD_LOGIC;
  signal \n_0_tx_reg[6]_i_1\ : STD_LOGIC;
  signal \n_0_tx_reg[7]_i_1\ : STD_LOGIC;
  signal \n_0_tx_reg[7]_i_2\ : STD_LOGIC;
  signal \n_0_tx_reg[8]_i_1\ : STD_LOGIC;
  signal tx : STD_LOGIC_VECTOR ( 8 downto 1 );
  signal \tx_ctr_reg__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal tx_empty : STD_LOGIC;
  signal tx_load : STD_LOGIC;
  signal tx_shift : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_curr_state[2]_i_4\ : label is "soft_lutpair9";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_curr_state_reg[0]\ : label is "yes";
  attribute KEEP of \FSM_sequential_curr_state_reg[1]\ : label is "yes";
  attribute KEEP of \FSM_sequential_curr_state_reg[2]\ : label is "yes";
  attribute SOFT_HLUTNM of \br_cnt[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \br_cnt[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \br_cnt[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \br_cnt[5]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \br_cnt[6]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \br_cnt[7]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \br_cnt[8]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \br_cnt[9]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \tx_ctr[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \tx_ctr[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \tx_ctr[3]_i_3\ : label is "soft_lutpair9";
begin
\FSM_sequential_curr_state[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"003FBBBF003F0004"
    )
    port map (
      I0 => tx_start_tick,
      I1 => curr_state(2),
      I2 => curr_state(1),
      I3 => curr_state(0),
      I4 => \n_0_FSM_sequential_curr_state[2]_i_2__0\,
      I5 => curr_state(0),
      O => \n_0_FSM_sequential_curr_state[0]_i_1__0\
    );
\FSM_sequential_curr_state[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF0BF400"
    )
    port map (
      I0 => tx_start_tick,
      I1 => curr_state(2),
      I2 => \n_0_FSM_sequential_curr_state[2]_i_2__0\,
      I3 => \n_0_FSM_sequential_curr_state[1]_i_2\,
      I4 => curr_state(1),
      O => \n_0_FSM_sequential_curr_state[1]_i_1__0\
    );
\FSM_sequential_curr_state[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0D50"
    )
    port map (
      I0 => curr_state(2),
      I1 => tx_start_tick,
      I2 => curr_state(1),
      I3 => curr_state(0),
      O => \n_0_FSM_sequential_curr_state[1]_i_2\
    );
\FSM_sequential_curr_state[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF0BF400"
    )
    port map (
      I0 => tx_start_tick,
      I1 => curr_state(2),
      I2 => \n_0_FSM_sequential_curr_state[2]_i_2__0\,
      I3 => \n_0_FSM_sequential_curr_state[2]_i_3\,
      I4 => curr_state(2),
      O => \n_0_FSM_sequential_curr_state[2]_i_1__0\
    );
\FSM_sequential_curr_state[2]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E0FFFFFAFA"
    )
    port map (
      I0 => curr_state(2),
      I1 => tx_empty,
      I2 => curr_state(1),
      I3 => n_0_br_tick_reg,
      I4 => tx_start_tick,
      I5 => curr_state(0),
      O => \n_0_FSM_sequential_curr_state[2]_i_2__0\
    );
\FSM_sequential_curr_state[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"44A2"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => tx_start_tick,
      I3 => curr_state(1),
      O => \n_0_FSM_sequential_curr_state[2]_i_3\
    );
\FSM_sequential_curr_state[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => \tx_ctr_reg__0\(2),
      I1 => \tx_ctr_reg__0\(0),
      I2 => \tx_ctr_reg__0\(1),
      I3 => \tx_ctr_reg__0\(3),
      O => tx_empty
    );
\FSM_sequential_curr_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_FSM_sequential_curr_state[0]_i_1__0\,
      Q => curr_state(0),
      R => '0'
    );
\FSM_sequential_curr_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_FSM_sequential_curr_state[1]_i_1__0\,
      Q => curr_state(1),
      R => '0'
    );
\FSM_sequential_curr_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_FSM_sequential_curr_state[2]_i_1__0\,
      Q => curr_state(2),
      R => '0'
    );
\br_cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_br_cnt[9]_i_3\,
      I1 => br_cnt(0),
      O => br_cnt_0(0)
    );
\br_cnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
    port map (
      I0 => \n_0_br_cnt[9]_i_3\,
      I1 => br_cnt(0),
      I2 => br_cnt(1),
      O => br_cnt_0(1)
    );
\br_cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
    port map (
      I0 => \n_0_br_cnt[9]_i_3\,
      I1 => br_cnt(0),
      I2 => br_cnt(1),
      I3 => br_cnt(2),
      O => br_cnt_0(2)
    );
\br_cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
    port map (
      I0 => \n_0_br_cnt[9]_i_3\,
      I1 => br_cnt(1),
      I2 => br_cnt(0),
      I3 => br_cnt(2),
      I4 => br_cnt(3),
      O => br_cnt_0(3)
    );
\br_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
    port map (
      I0 => \n_0_br_cnt[9]_i_3\,
      I1 => br_cnt(2),
      I2 => br_cnt(0),
      I3 => br_cnt(1),
      I4 => br_cnt(3),
      I5 => br_cnt(4),
      O => br_cnt_0(4)
    );
\br_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FF000008000000"
    )
    port map (
      I0 => br_cnt(4),
      I1 => br_cnt(2),
      I2 => \n_0_br_cnt[5]_i_2\,
      I3 => br_cnt(3),
      I4 => \n_0_br_cnt[9]_i_3\,
      I5 => br_cnt(5),
      O => br_cnt_0(5)
    );
\br_cnt[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => br_cnt(1),
      I1 => br_cnt(0),
      O => \n_0_br_cnt[5]_i_2\
    );
\br_cnt[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
    port map (
      I0 => \n_0_br_cnt[9]_i_2\,
      I1 => \n_0_br_cnt[9]_i_3\,
      I2 => br_cnt(6),
      O => br_cnt_0(6)
    );
\br_cnt[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
    port map (
      I0 => br_cnt(6),
      I1 => \n_0_br_cnt[9]_i_2\,
      I2 => \n_0_br_cnt[9]_i_3\,
      I3 => br_cnt(7),
      O => br_cnt_0(7)
    );
\br_cnt[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F008000"
    )
    port map (
      I0 => br_cnt(7),
      I1 => \n_0_br_cnt[9]_i_2\,
      I2 => br_cnt(6),
      I3 => \n_0_br_cnt[9]_i_3\,
      I4 => br_cnt(8),
      O => br_cnt_0(8)
    );
\br_cnt[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
    port map (
      I0 => br_cnt(8),
      I1 => br_cnt(6),
      I2 => \n_0_br_cnt[9]_i_2\,
      I3 => br_cnt(7),
      I4 => \n_0_br_cnt[9]_i_3\,
      I5 => br_cnt(9),
      O => br_cnt_0(9)
    );
\br_cnt[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => br_cnt(5),
      I1 => br_cnt(3),
      I2 => br_cnt(1),
      I3 => br_cnt(0),
      I4 => br_cnt(2),
      I5 => br_cnt(4),
      O => \n_0_br_cnt[9]_i_2\
    );
\br_cnt[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFBF"
    )
    port map (
      I0 => \n_0_br_cnt[9]_i_4\,
      I1 => br_cnt(1),
      I2 => br_cnt(0),
      I3 => br_cnt(3),
      I4 => br_cnt(2),
      O => \n_0_br_cnt[9]_i_3\
    );
\br_cnt[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF7FFFFFFFFFFFF"
    )
    port map (
      I0 => br_cnt(8),
      I1 => br_cnt(9),
      I2 => br_cnt(7),
      I3 => br_cnt(4),
      I4 => br_cnt(5),
      I5 => br_cnt(6),
      O => \n_0_br_cnt[9]_i_4\
    );
\br_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_cnt_0(0),
      Q => br_cnt(0),
      R => '0'
    );
\br_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_cnt_0(1),
      Q => br_cnt(1),
      R => '0'
    );
\br_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_cnt_0(2),
      Q => br_cnt(2),
      R => '0'
    );
\br_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_cnt_0(3),
      Q => br_cnt(3),
      R => '0'
    );
\br_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_cnt_0(4),
      Q => br_cnt(4),
      R => '0'
    );
\br_cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_cnt_0(5),
      Q => br_cnt(5),
      R => '0'
    );
\br_cnt_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_cnt_0(6),
      Q => br_cnt(6),
      R => '0'
    );
\br_cnt_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_cnt_0(7),
      Q => br_cnt(7),
      R => '0'
    );
\br_cnt_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_cnt_0(8),
      Q => br_cnt(8),
      R => '0'
    );
\br_cnt_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_cnt_0(9),
      Q => br_cnt(9),
      R => '0'
    );
br_tick_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
    port map (
      I0 => br_cnt(3),
      I1 => br_cnt(2),
      I2 => br_cnt(1),
      I3 => br_cnt(0),
      I4 => n_0_br_tick_i_2,
      O => br_tick
    );
br_tick_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000000000000"
    )
    port map (
      I0 => br_cnt(9),
      I1 => br_cnt(8),
      I2 => br_cnt(4),
      I3 => br_cnt(7),
      I4 => br_cnt(6),
      I5 => br_cnt(5),
      O => n_0_br_tick_i_2
    );
br_tick_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => br_tick,
      Q => n_0_br_tick_reg,
      R => '0'
    );
\tx_ctr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \tx_ctr_reg__0\(0),
      O => minusOp(0)
    );
\tx_ctr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \tx_ctr_reg__0\(0),
      I1 => \tx_ctr_reg__0\(1),
      O => \n_0_tx_ctr[1]_i_1\
    );
\tx_ctr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => \tx_ctr_reg__0\(2),
      I1 => \tx_ctr_reg__0\(1),
      I2 => \tx_ctr_reg__0\(0),
      O => minusOp(2)
    );
\tx_ctr[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      O => tx_load
    );
\tx_ctr[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888888880"
    )
    port map (
      I0 => tx_shift,
      I1 => n_0_br_tick_reg,
      I2 => \tx_ctr_reg__0\(3),
      I3 => \tx_ctr_reg__0\(1),
      I4 => \tx_ctr_reg__0\(0),
      I5 => \tx_ctr_reg__0\(2),
      O => \n_0_tx_ctr[3]_i_2\
    );
\tx_ctr[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
    port map (
      I0 => \tx_ctr_reg__0\(3),
      I1 => \tx_ctr_reg__0\(2),
      I2 => \tx_ctr_reg__0\(0),
      I3 => \tx_ctr_reg__0\(1),
      O => minusOp(3)
    );
\tx_ctr[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => curr_state(0),
      I1 => curr_state(1),
      I2 => curr_state(2),
      O => tx_shift
    );
\tx_ctr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_ctr[3]_i_2\,
      D => minusOp(0),
      Q => \tx_ctr_reg__0\(0),
      R => tx_load
    );
\tx_ctr_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_ctr[3]_i_2\,
      D => \n_0_tx_ctr[1]_i_1\,
      Q => \tx_ctr_reg__0\(1),
      S => tx_load
    );
\tx_ctr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_ctr[3]_i_2\,
      D => minusOp(2),
      Q => \tx_ctr_reg__0\(2),
      R => tx_load
    );
\tx_ctr_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_ctr[3]_i_2\,
      D => minusOp(3),
      Q => \tx_ctr_reg__0\(3),
      S => tx_load
    );
\tx_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EF00"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      I3 => tx(1),
      O => \n_0_tx_reg[0]_i_1\
    );
\tx_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF1000"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      I3 => O1(0),
      I4 => tx(2),
      O => \n_0_tx_reg[1]_i_1\
    );
\tx_reg[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF1000"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      I3 => O1(1),
      I4 => tx(3),
      O => \n_0_tx_reg[2]_i_1\
    );
\tx_reg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF1000"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      I3 => O1(2),
      I4 => tx(4),
      O => \n_0_tx_reg[3]_i_1\
    );
\tx_reg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF1000"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      I3 => O1(3),
      I4 => tx(5),
      O => \n_0_tx_reg[4]_i_1\
    );
\tx_reg[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF1000"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      I3 => O1(4),
      I4 => tx(6),
      O => \n_0_tx_reg[5]_i_1\
    );
\tx_reg[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF1000"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      I3 => O1(5),
      I4 => tx(7),
      O => \n_0_tx_reg[6]_i_1\
    );
\tx_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF10"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      I3 => n_0_br_tick_reg,
      O => \n_0_tx_reg[7]_i_1\
    );
\tx_reg[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF1000"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      I3 => O1(6),
      I4 => tx(8),
      O => \n_0_tx_reg[7]_i_2\
    );
\tx_reg[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEFFF10EF00"
    )
    port map (
      I0 => curr_state(2),
      I1 => curr_state(0),
      I2 => curr_state(1),
      I3 => tx(8),
      I4 => O1(7),
      I5 => n_0_br_tick_reg,
      O => \n_0_tx_reg[8]_i_1\
    );
\tx_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_reg[7]_i_1\,
      D => \n_0_tx_reg[0]_i_1\,
      Q => O2(0),
      R => '0'
    );
\tx_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_reg[7]_i_1\,
      D => \n_0_tx_reg[1]_i_1\,
      Q => tx(1),
      R => '0'
    );
\tx_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_reg[7]_i_1\,
      D => \n_0_tx_reg[2]_i_1\,
      Q => tx(2),
      R => '0'
    );
\tx_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_reg[7]_i_1\,
      D => \n_0_tx_reg[3]_i_1\,
      Q => tx(3),
      R => '0'
    );
\tx_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_reg[7]_i_1\,
      D => \n_0_tx_reg[4]_i_1\,
      Q => tx(4),
      R => '0'
    );
\tx_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_reg[7]_i_1\,
      D => \n_0_tx_reg[5]_i_1\,
      Q => tx(5),
      R => '0'
    );
\tx_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_reg[7]_i_1\,
      D => \n_0_tx_reg[6]_i_1\,
      Q => tx(6),
      R => '0'
    );
\tx_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => \n_0_tx_reg[7]_i_1\,
      D => \n_0_tx_reg[7]_i_2\,
      Q => tx(7),
      R => '0'
    );
\tx_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_tx_reg[8]_i_1\,
      Q => tx(8),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mux7seg is
  port (
    an_OBUF : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_IBUF_BUFG : in STD_LOGIC
  );
end mux7seg;

architecture STRUCTURE of mux7seg is
  signal CE : STD_LOGIC;
  signal adcount : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal cdcount_reg : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal clear : STD_LOGIC;
  signal \n_0_adcount[0]_i_1\ : STD_LOGIC;
  signal \n_0_adcount[1]_i_1\ : STD_LOGIC;
  signal \n_0_cdcount[0]_i_3\ : STD_LOGIC;
  signal \n_0_cdcount[0]_i_4\ : STD_LOGIC;
  signal \n_0_cdcount[0]_i_5\ : STD_LOGIC;
  signal \n_0_cdcount[0]_i_6\ : STD_LOGIC;
  signal \n_0_cdcount[0]_i_7\ : STD_LOGIC;
  signal \n_0_cdcount[0]_i_8\ : STD_LOGIC;
  signal \n_0_cdcount[0]_i_9\ : STD_LOGIC;
  signal \n_0_cdcount[12]_i_2\ : STD_LOGIC;
  signal \n_0_cdcount[12]_i_3\ : STD_LOGIC;
  signal \n_0_cdcount[12]_i_4\ : STD_LOGIC;
  signal \n_0_cdcount[12]_i_5\ : STD_LOGIC;
  signal \n_0_cdcount[16]_i_2\ : STD_LOGIC;
  signal \n_0_cdcount[16]_i_3\ : STD_LOGIC;
  signal \n_0_cdcount[4]_i_2\ : STD_LOGIC;
  signal \n_0_cdcount[4]_i_3\ : STD_LOGIC;
  signal \n_0_cdcount[4]_i_4\ : STD_LOGIC;
  signal \n_0_cdcount[4]_i_5\ : STD_LOGIC;
  signal \n_0_cdcount[8]_i_2\ : STD_LOGIC;
  signal \n_0_cdcount[8]_i_3\ : STD_LOGIC;
  signal \n_0_cdcount[8]_i_4\ : STD_LOGIC;
  signal \n_0_cdcount[8]_i_5\ : STD_LOGIC;
  signal \n_0_cdcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_0_cdcount_reg[12]_i_1\ : STD_LOGIC;
  signal \n_0_cdcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_0_cdcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_1_cdcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_1_cdcount_reg[12]_i_1\ : STD_LOGIC;
  signal \n_1_cdcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_1_cdcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_2_cdcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_2_cdcount_reg[12]_i_1\ : STD_LOGIC;
  signal \n_2_cdcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_2_cdcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_3_cdcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_3_cdcount_reg[12]_i_1\ : STD_LOGIC;
  signal \n_3_cdcount_reg[16]_i_1\ : STD_LOGIC;
  signal \n_3_cdcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_3_cdcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_4_cdcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_4_cdcount_reg[12]_i_1\ : STD_LOGIC;
  signal \n_4_cdcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_4_cdcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_5_cdcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_5_cdcount_reg[12]_i_1\ : STD_LOGIC;
  signal \n_5_cdcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_5_cdcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_6_cdcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_6_cdcount_reg[12]_i_1\ : STD_LOGIC;
  signal \n_6_cdcount_reg[16]_i_1\ : STD_LOGIC;
  signal \n_6_cdcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_6_cdcount_reg[8]_i_1\ : STD_LOGIC;
  signal \n_7_cdcount_reg[0]_i_2\ : STD_LOGIC;
  signal \n_7_cdcount_reg[12]_i_1\ : STD_LOGIC;
  signal \n_7_cdcount_reg[16]_i_1\ : STD_LOGIC;
  signal \n_7_cdcount_reg[4]_i_1\ : STD_LOGIC;
  signal \n_7_cdcount_reg[8]_i_1\ : STD_LOGIC;
  signal \NLW_cdcount_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_cdcount_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \adcount[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \adcount[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \an_OBUF[0]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \an_OBUF[1]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \an_OBUF[2]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \an_OBUF[3]_inst_i_1\ : label is "soft_lutpair2";
begin
CE_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => clear,
      Q => CE,
      R => '0'
    );
\adcount[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => CE,
      I1 => adcount(0),
      O => \n_0_adcount[0]_i_1\
    );
\adcount[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => adcount(0),
      I1 => CE,
      I2 => adcount(1),
      O => \n_0_adcount[1]_i_1\
    );
\adcount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_adcount[0]_i_1\,
      Q => adcount(0),
      R => '0'
    );
\adcount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_0_adcount[1]_i_1\,
      Q => adcount(1),
      R => '0'
    );
\an_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => adcount(0),
      I1 => adcount(1),
      O => an_OBUF(0)
    );
\an_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => adcount(1),
      I1 => adcount(0),
      O => an_OBUF(1)
    );
\an_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => adcount(0),
      I1 => adcount(1),
      O => an_OBUF(2)
    );
\an_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => adcount(0),
      I1 => adcount(1),
      O => an_OBUF(3)
    );
\cdcount[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => \n_0_cdcount[0]_i_3\,
      I1 => \n_0_cdcount[0]_i_4\,
      I2 => \n_0_cdcount[0]_i_5\,
      O => clear
    );
\cdcount[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => cdcount_reg(6),
      I1 => cdcount_reg(8),
      I2 => cdcount_reg(12),
      I3 => cdcount_reg(2),
      I4 => cdcount_reg(3),
      I5 => cdcount_reg(5),
      O => \n_0_cdcount[0]_i_3\
    );
\cdcount[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => cdcount_reg(7),
      I1 => cdcount_reg(0),
      I2 => cdcount_reg(17),
      I3 => cdcount_reg(15),
      I4 => cdcount_reg(14),
      I5 => cdcount_reg(1),
      O => \n_0_cdcount[0]_i_4\
    );
\cdcount[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => cdcount_reg(4),
      I1 => cdcount_reg(11),
      I2 => cdcount_reg(10),
      I3 => cdcount_reg(16),
      I4 => cdcount_reg(9),
      I5 => cdcount_reg(13),
      O => \n_0_cdcount[0]_i_5\
    );
\cdcount[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(3),
      O => \n_0_cdcount[0]_i_6\
    );
\cdcount[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(2),
      O => \n_0_cdcount[0]_i_7\
    );
\cdcount[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(1),
      O => \n_0_cdcount[0]_i_8\
    );
\cdcount[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => cdcount_reg(0),
      O => \n_0_cdcount[0]_i_9\
    );
\cdcount[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(15),
      O => \n_0_cdcount[12]_i_2\
    );
\cdcount[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(14),
      O => \n_0_cdcount[12]_i_3\
    );
\cdcount[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(13),
      O => \n_0_cdcount[12]_i_4\
    );
\cdcount[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(12),
      O => \n_0_cdcount[12]_i_5\
    );
\cdcount[16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(17),
      O => \n_0_cdcount[16]_i_2\
    );
\cdcount[16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(16),
      O => \n_0_cdcount[16]_i_3\
    );
\cdcount[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(7),
      O => \n_0_cdcount[4]_i_2\
    );
\cdcount[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(6),
      O => \n_0_cdcount[4]_i_3\
    );
\cdcount[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(5),
      O => \n_0_cdcount[4]_i_4\
    );
\cdcount[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(4),
      O => \n_0_cdcount[4]_i_5\
    );
\cdcount[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(11),
      O => \n_0_cdcount[8]_i_2\
    );
\cdcount[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(10),
      O => \n_0_cdcount[8]_i_3\
    );
\cdcount[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(9),
      O => \n_0_cdcount[8]_i_4\
    );
\cdcount[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cdcount_reg(8),
      O => \n_0_cdcount[8]_i_5\
    );
\cdcount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_7_cdcount_reg[0]_i_2\,
      Q => cdcount_reg(0),
      R => clear
    );
\cdcount_reg[0]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_cdcount_reg[0]_i_2\,
      CO(2) => \n_1_cdcount_reg[0]_i_2\,
      CO(1) => \n_2_cdcount_reg[0]_i_2\,
      CO(0) => \n_3_cdcount_reg[0]_i_2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \n_4_cdcount_reg[0]_i_2\,
      O(2) => \n_5_cdcount_reg[0]_i_2\,
      O(1) => \n_6_cdcount_reg[0]_i_2\,
      O(0) => \n_7_cdcount_reg[0]_i_2\,
      S(3) => \n_0_cdcount[0]_i_6\,
      S(2) => \n_0_cdcount[0]_i_7\,
      S(1) => \n_0_cdcount[0]_i_8\,
      S(0) => \n_0_cdcount[0]_i_9\
    );
\cdcount_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_5_cdcount_reg[8]_i_1\,
      Q => cdcount_reg(10),
      R => clear
    );
\cdcount_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_4_cdcount_reg[8]_i_1\,
      Q => cdcount_reg(11),
      R => clear
    );
\cdcount_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_7_cdcount_reg[12]_i_1\,
      Q => cdcount_reg(12),
      R => clear
    );
\cdcount_reg[12]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_cdcount_reg[8]_i_1\,
      CO(3) => \n_0_cdcount_reg[12]_i_1\,
      CO(2) => \n_1_cdcount_reg[12]_i_1\,
      CO(1) => \n_2_cdcount_reg[12]_i_1\,
      CO(0) => \n_3_cdcount_reg[12]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_cdcount_reg[12]_i_1\,
      O(2) => \n_5_cdcount_reg[12]_i_1\,
      O(1) => \n_6_cdcount_reg[12]_i_1\,
      O(0) => \n_7_cdcount_reg[12]_i_1\,
      S(3) => \n_0_cdcount[12]_i_2\,
      S(2) => \n_0_cdcount[12]_i_3\,
      S(1) => \n_0_cdcount[12]_i_4\,
      S(0) => \n_0_cdcount[12]_i_5\
    );
\cdcount_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_6_cdcount_reg[12]_i_1\,
      Q => cdcount_reg(13),
      R => clear
    );
\cdcount_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_5_cdcount_reg[12]_i_1\,
      Q => cdcount_reg(14),
      R => clear
    );
\cdcount_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_4_cdcount_reg[12]_i_1\,
      Q => cdcount_reg(15),
      R => clear
    );
\cdcount_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_7_cdcount_reg[16]_i_1\,
      Q => cdcount_reg(16),
      R => clear
    );
\cdcount_reg[16]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_cdcount_reg[12]_i_1\,
      CO(3 downto 1) => \NLW_cdcount_reg[16]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \n_3_cdcount_reg[16]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 2) => \NLW_cdcount_reg[16]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \n_6_cdcount_reg[16]_i_1\,
      O(0) => \n_7_cdcount_reg[16]_i_1\,
      S(3) => '0',
      S(2) => '0',
      S(1) => \n_0_cdcount[16]_i_2\,
      S(0) => \n_0_cdcount[16]_i_3\
    );
\cdcount_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_6_cdcount_reg[16]_i_1\,
      Q => cdcount_reg(17),
      R => clear
    );
\cdcount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_6_cdcount_reg[0]_i_2\,
      Q => cdcount_reg(1),
      R => clear
    );
\cdcount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_5_cdcount_reg[0]_i_2\,
      Q => cdcount_reg(2),
      R => clear
    );
\cdcount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_4_cdcount_reg[0]_i_2\,
      Q => cdcount_reg(3),
      R => clear
    );
\cdcount_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_7_cdcount_reg[4]_i_1\,
      Q => cdcount_reg(4),
      R => clear
    );
\cdcount_reg[4]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_cdcount_reg[0]_i_2\,
      CO(3) => \n_0_cdcount_reg[4]_i_1\,
      CO(2) => \n_1_cdcount_reg[4]_i_1\,
      CO(1) => \n_2_cdcount_reg[4]_i_1\,
      CO(0) => \n_3_cdcount_reg[4]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_cdcount_reg[4]_i_1\,
      O(2) => \n_5_cdcount_reg[4]_i_1\,
      O(1) => \n_6_cdcount_reg[4]_i_1\,
      O(0) => \n_7_cdcount_reg[4]_i_1\,
      S(3) => \n_0_cdcount[4]_i_2\,
      S(2) => \n_0_cdcount[4]_i_3\,
      S(1) => \n_0_cdcount[4]_i_4\,
      S(0) => \n_0_cdcount[4]_i_5\
    );
\cdcount_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_6_cdcount_reg[4]_i_1\,
      Q => cdcount_reg(5),
      R => clear
    );
\cdcount_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_5_cdcount_reg[4]_i_1\,
      Q => cdcount_reg(6),
      R => clear
    );
\cdcount_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_4_cdcount_reg[4]_i_1\,
      Q => cdcount_reg(7),
      R => clear
    );
\cdcount_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_7_cdcount_reg[8]_i_1\,
      Q => cdcount_reg(8),
      R => clear
    );
\cdcount_reg[8]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_cdcount_reg[4]_i_1\,
      CO(3) => \n_0_cdcount_reg[8]_i_1\,
      CO(2) => \n_1_cdcount_reg[8]_i_1\,
      CO(1) => \n_2_cdcount_reg[8]_i_1\,
      CO(0) => \n_3_cdcount_reg[8]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_cdcount_reg[8]_i_1\,
      O(2) => \n_5_cdcount_reg[8]_i_1\,
      O(1) => \n_6_cdcount_reg[8]_i_1\,
      O(0) => \n_7_cdcount_reg[8]_i_1\,
      S(3) => \n_0_cdcount[8]_i_2\,
      S(2) => \n_0_cdcount[8]_i_3\,
      S(1) => \n_0_cdcount[8]_i_4\,
      S(0) => \n_0_cdcount[8]_i_5\
    );
\cdcount_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \n_6_cdcount_reg[8]_i_1\,
      Q => cdcount_reg(9),
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ModemRx is
  port (
    O1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    symbol_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end ModemRx;

architecture STRUCTURE of ModemRx is
  signal output_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal tx_start_tick : STD_LOGIC;
begin
IQ_Deserializer: entity work.IQ_to_Char
    port map (
      O1(7 downto 0) => output_reg(7 downto 0),
      Q(1 downto 0) => Q(1 downto 0),
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      symbol_clk => symbol_clk,
      tx_start_tick => tx_start_tick
    );
Transmitter: entity work.SerialTx
    port map (
      O1(7 downto 0) => output_reg(7 downto 0),
      O2(0) => O1(0),
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      tx_start_tick => tx_start_tick
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ModemTx is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    symbol_clk : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end ModemTx;

architecture STRUCTURE of ModemTx is
  signal curr_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal n_0_Receiver : STD_LOGIC;
  signal n_12_Receiver : STD_LOGIC;
  signal n_1_Receiver : STD_LOGIC;
  signal n_2_Receiver : STD_LOGIC;
  signal n_3_Receiver : STD_LOGIC;
  signal rx_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ser_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ser_start : STD_LOGIC;
begin
CharBuffer: entity work.BufferFSM
    port map (
      D(7 downto 0) => ser_data(7 downto 0),
      E(0) => ser_start,
      I1 => n_12_Receiver,
      I2 => n_3_Receiver,
      I3(7 downto 0) => rx_data(7 downto 0),
      Q(3 downto 0) => curr_state(3 downto 0),
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      \out\(2) => n_0_Receiver,
      \out\(1) => n_1_Receiver,
      \out\(0) => n_2_Receiver,
      symbol_clk => symbol_clk
    );
IQ_Serializer: entity work.Char_to_IQ
    port map (
      D(7 downto 0) => ser_data(7 downto 0),
      E(0) => ser_start,
      O1(1 downto 0) => Q(1 downto 0),
      Q(3 downto 0) => curr_state(3 downto 0),
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      symbol_clk => symbol_clk
    );
Receiver: entity work.SerialRx
    port map (
      D(0) => D(0),
      O1 => n_3_Receiver,
      O2 => n_12_Receiver,
      Q(7 downto 0) => rx_data(7 downto 0),
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      \out\(2) => n_0_Receiver,
      \out\(1) => n_1_Receiver,
      \out\(0) => n_2_Receiver
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity lab1top is
  port (
    clk : in STD_LOGIC;
    RsRx : in STD_LOGIC;
    RsTx : out STD_LOGIC;
    seg : out STD_LOGIC_VECTOR ( 0 to 6 );
    an : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of lab1top : entity is true;
end lab1top;

architecture STRUCTURE of lab1top is
  signal RsRx_IBUF : STD_LOGIC;
  signal RsTx_OBUF : STD_LOGIC;
  signal an_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal n_0_ModemTransmitter : STD_LOGIC;
  signal n_1_ModemTransmitter : STD_LOGIC;
  signal symbol_clk : STD_LOGIC;
begin
Display: entity work.mux7seg
    port map (
      an_OBUF(3 downto 0) => an_OBUF(3 downto 0),
      clk_IBUF_BUFG => clk_IBUF_BUFG
    );
ModemReceiver: entity work.ModemRx
    port map (
      O1(0) => RsTx_OBUF,
      Q(1) => n_0_ModemTransmitter,
      Q(0) => n_1_ModemTransmitter,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      symbol_clk => symbol_clk
    );
ModemTransmitter: entity work.ModemTx
    port map (
      D(0) => RsRx_IBUF,
      Q(1) => n_0_ModemTransmitter,
      Q(0) => n_1_ModemTransmitter,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      symbol_clk => symbol_clk
    );
RsRx_IBUF_inst: unisim.vcomponents.IBUF
    port map (
      I => RsRx,
      O => RsRx_IBUF
    );
RsTx_OBUF_inst: unisim.vcomponents.OBUF
    port map (
      I => RsTx_OBUF,
      O => RsTx
    );
SymbolClk: entity work.ClockDivider
    port map (
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      symbol_clk => symbol_clk
    );
\an_OBUF[0]_inst\: unisim.vcomponents.OBUF
    port map (
      I => an_OBUF(0),
      O => an(0)
    );
\an_OBUF[1]_inst\: unisim.vcomponents.OBUF
    port map (
      I => an_OBUF(1),
      O => an(1)
    );
\an_OBUF[2]_inst\: unisim.vcomponents.OBUF
    port map (
      I => an_OBUF(2),
      O => an(2)
    );
\an_OBUF[3]_inst\: unisim.vcomponents.OBUF
    port map (
      I => an_OBUF(3),
      O => an(3)
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
    port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
    port map (
      I => clk,
      O => clk_IBUF
    );
\seg_OBUF[0]_inst\: unisim.vcomponents.OBUF
    port map (
      I => '0',
      O => seg(0)
    );
\seg_OBUF[1]_inst\: unisim.vcomponents.OBUF
    port map (
      I => '0',
      O => seg(1)
    );
\seg_OBUF[2]_inst\: unisim.vcomponents.OBUF
    port map (
      I => '0',
      O => seg(2)
    );
\seg_OBUF[3]_inst\: unisim.vcomponents.OBUF
    port map (
      I => '0',
      O => seg(3)
    );
\seg_OBUF[4]_inst\: unisim.vcomponents.OBUF
    port map (
      I => '0',
      O => seg(4)
    );
\seg_OBUF[5]_inst\: unisim.vcomponents.OBUF
    port map (
      I => '0',
      O => seg(5)
    );
\seg_OBUF[6]_inst\: unisim.vcomponents.OBUF
    port map (
      I => '1',
      O => seg(6)
    );
end STRUCTURE;
