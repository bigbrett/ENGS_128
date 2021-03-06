# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7a35tcpg236-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_1/Lab_1.cache/wt [current_project]
set_property parent.project_path P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_1/Lab_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib {
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_1/Lab_1.srcs/sources_1/imports/Documents/BufferFSM.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_1/Lab_1.srcs/sources_1/imports/Lab1/SerialRx.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_1/Lab_1.srcs/sources_1/imports/Lab1/SerialTx.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_1/Lab_1.srcs/sources_1/imports/Lab1/mux7seg.vhd
  P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_1/Lab_1.srcs/sources_1/imports/Lab1/lab1top.vhd
}
read_xdc P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_1/Lab_1.srcs/constrs_1/imports/Lab1/Basys3_Master.xdc
set_property used_in_implementation false [get_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_1/Lab_1.srcs/constrs_1/imports/Lab1/Basys3_Master.xdc]

catch { write_hwdef -file lab1top.hwdef }
synth_design -top lab1top -part xc7a35tcpg236-1
write_checkpoint -noxdef lab1top.dcp
catch { report_utilization -file lab1top_utilization_synth.rpt -pb lab1top_utilization_synth.pb }
