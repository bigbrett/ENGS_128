# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
debug::add_scope template.lib 1
set_msg_config -id {Common-41} -limit 4294967295
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7a35tcpg236-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.cache/wt [current_project]
set_property parent.project_path P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
add_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_3/Lab_3.sim/sim_1/behav/rrcos8-brom.coe
add_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_3/Lab_3.sim/sim_1/behav/rrcos8-fir-ip.coe
add_files -quiet P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/fir_compiler_0_synth_1/fir_compiler_0.dcp
set_property used_in_implementation false [get_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/fir_compiler_0_synth_1/fir_compiler_0.dcp]
add_files -quiet P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/dds_compiler_0_synth_1/dds_compiler_0.dcp
set_property used_in_implementation false [get_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/dds_compiler_0_synth_1/dds_compiler_0.dcp]
add_files -quiet P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/dds_compiler_1_synth_1/dds_compiler_1.dcp
set_property used_in_implementation false [get_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/dds_compiler_1_synth_1/dds_compiler_1.dcp]
read_ip P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci
set_property used_in_implementation false [get_files -all p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]
set_property used_in_implementation false [get_files -all p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.dcp]
set_property is_locked true [get_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci]

read_vhdl -library xil_defaultlib {
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/imports/sources_1/imports/imports/Lab1/SerialTx.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/imports/sources_1/imports/imports/Lab1/SerialRx.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/new/RRC_Pulse_Shaper.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/new/RRC_Matched_Filter.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/new/Modulator.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/imports/sources_1/new/IQ_to_Char.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/new/Demodulator.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/imports/sources_1/new/Char_to_IQ.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/imports/sources_1/imports/imports/Documents/BufferFSM.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/new/CRloop.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/imports/sources_1/imports/imports/Lab1/mux7seg.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/imports/sources_1/new/ModemTx.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/imports/sources_1/new/ModemRx.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/imports/sources_1/imports/Desktop/ClockDivider.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/imports/sources_1/imports/sources_1/imports/imports/Lab1/lab1top.vhd
}
read_xdc P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/constrs_1/imports/Lab1/Basys3_Master.xdc
set_property used_in_implementation false [get_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/constrs_1/imports/Lab1/Basys3_Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
catch { write_hwdef -file lab1top.hwdef }
synth_design -top lab1top -part xc7a35tcpg236-1 -fanout_limit 400 -fsm_extraction one_hot -keep_equivalent_registers -resource_sharing off -no_lc -shreg_min_size 5
write_checkpoint -noxdef lab1top.dcp
catch { report_utilization -file lab1top_utilization_synth.rpt -pb lab1top_utilization_synth.pb }
