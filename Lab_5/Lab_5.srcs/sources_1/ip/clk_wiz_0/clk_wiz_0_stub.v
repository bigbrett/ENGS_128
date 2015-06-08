// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Wed May 13 18:27:52 2015
// Host        : M210-24 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_5/Lab_5.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(cm_clkin, cm_clkout1, cm_reset, cm_locked)
/* synthesis syn_black_box black_box_pad_pin="cm_clkin,cm_clkout1,cm_reset,cm_locked" */;
  input cm_clkin;
  output cm_clkout1;
  input cm_reset;
  output cm_locked;
endmodule
