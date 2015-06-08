proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Common-41} -limit 4294967295
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.cache/wt [current_project]
  set_property parent.project_path P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.xpr [current_project]
  set_property ip_repo_paths p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.cache/ip [current_project]
  set_property ip_output_repo p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.cache/ip [current_project]
  add_files -quiet P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/synth_1/lab1top.dcp
  add_files -quiet p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.dcp
  set_property netlist_only true [get_files p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.dcp]
  add_files -quiet P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/fir_compiler_0_synth_1/fir_compiler_0.dcp
  set_property netlist_only true [get_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/fir_compiler_0_synth_1/fir_compiler_0.dcp]
  add_files -quiet P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/dds_compiler_0_synth_1/dds_compiler_0.dcp
  set_property netlist_only true [get_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/dds_compiler_0_synth_1/dds_compiler_0.dcp]
  add_files -quiet P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/dds_compiler_1_synth_1/dds_compiler_1.dcp
  set_property netlist_only true [get_files P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.runs/dds_compiler_1_synth_1/dds_compiler_1.dcp]
  read_xdc -mode out_of_context -ref fir_compiler_0 -cells U0 p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/fir_compiler_0/fir_compiler_0_ooc.xdc
  set_property processing_order EARLY [get_files p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/fir_compiler_0/fir_compiler_0_ooc.xdc]
  read_xdc -mode out_of_context -ref dds_compiler_0 -cells U0 p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/dds_compiler_0_2/dds_compiler_0_ooc.xdc
  set_property processing_order EARLY [get_files p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/dds_compiler_0_2/dds_compiler_0_ooc.xdc]
  read_xdc -mode out_of_context -ref dds_compiler_1 -cells U0 p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/dds_compiler_1/dds_compiler_1_ooc.xdc
  set_property processing_order EARLY [get_files p:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/sources_1/ip/dds_compiler_1/dds_compiler_1_ooc.xdc]
  read_xdc P:/15spring/engs128/workspace/Brett_and_Matt/lab_workspace/Lab_4/Lab_4.srcs/constrs_1/imports/Lab1/Basys3_Master.xdc
  link_design -top lab1top -part xc7a35tcpg236-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force lab1top_opt.dcp
  catch {report_drc -file lab1top_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force lab1top_placed.dcp
  catch { report_io -file lab1top_io_placed.rpt }
  catch { report_clock_utilization -file lab1top_clock_utilization_placed.rpt }
  catch { report_utilization -file lab1top_utilization_placed.rpt -pb lab1top_utilization_placed.pb }
  catch { report_control_sets -verbose -file lab1top_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force lab1top_routed.dcp
  catch { report_drc -file lab1top_drc_routed.rpt -pb lab1top_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file lab1top_timing_summary_routed.rpt -rpx lab1top_timing_summary_routed.rpx }
  catch { report_power -file lab1top_power_routed.rpt -pb lab1top_power_summary_routed.pb }
  catch { report_route_status -file lab1top_route_status.rpt -pb lab1top_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

