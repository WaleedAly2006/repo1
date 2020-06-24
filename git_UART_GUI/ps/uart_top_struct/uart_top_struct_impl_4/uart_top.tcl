if { ![project_exists {uart_top}] } {
     project_new {uart_top}
} else {
     project_open {uart_top}
}
set_project_settings -cmp {uart_top}
if { ![project_settings_exist -sim uart_top] } {
        set_project_settings -sim uart_top
}
set_global_assignment -section_id {uart_top} -name {EDA_DESIGN_ENTRY_SYNTHESIS_TOOL} {PRECISION SYNTHESIS}
set_global_assignment -name {VQM_FILE} {uart_top.vqm}
set_global_assignment -name {USE_TIMEQUEST_TIMING_ANALYZER} {ON}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_USE_LMF} {mentor.lmf}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_INPUT_GND_NAME} {GND}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_INPUT_VCC_NAME} {VCC}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_SHOW_LMF_MAPPING_MESSAGES} {OFF}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_RUN_TOOL_AUTOMATICALLY} {OFF}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_INPUT_DATA_FORMAT} {VQM}
set_global_assignment -section_id {eda_design_synthesis} -name {EDA_OUTPUT_DATA_FORMAT} {VQM}
set_global_assignment -section_id {eda_simulation} -name {EDA_FLATTEN_BUSES} {OFF}
set_global_assignment -section_id {eda_simulation} -name {EDA_GENERATE_FUNCTIONAL_NETLIST} {ON}
set_global_assignment -section_id {eda_timing_analysis} -name {EDA_FLATTEN_BUSES} {OFF}
set_global_assignment -section_id {eda_design_synthesis} -name {AUTO_SHIFT_REGISTER_RECOGNITION} {OFF}
set_global_assignment -section_id {eda_design_synthesis} -name {AUTO_RAM_RECOGNITION} {OFF}
set_global_assignment -section_id {eda_design_synthesis} -name {AUTO_ROM_RECOGNITION} {OFF}
set_global_assignment -name {BLOCK_RAM_TO_MLAB_CELL_CONVERSION} {OFF}
set_global_assignment -name {READ_OR_WRITE_IN_BYTE_ADDRESS} {ON}
if { [file exists {uart_top_altera.prop}] } {
  source uart_top_altera.prop
}
set_global_assignment -name {FAMILY} {ARRIA V}
set_global_assignment -section_id {uart_top} -name {DEVICE} {5AGXBB1D4F31C5}
set_instance_assignment   -to {|clk} -name {FAST_INPUT_REGISTER} {OFF}
set_global_assignment -name {PROJECT_SHOW_ENTITY_NAME} {OFF}
set_global_assignment -name {SDC_FILE} {uart_top_pnr_constraints.sdc}
export_assignment_files
package require ::quartus::flow
if { [catch {execute_module -tool map} result] } {
  puts "Error running quartus_map $result"
} elseif { [catch {execute_module -tool fit} result] } {
  puts "Error running quartus_fit $result"
} elseif { [catch {execute_module -tool sta -args --do_report_timing} result] } {
  puts "Error running quartus_sta $result"
} elseif { [catch {execute_module -tool asm} result] } {
  puts "Error running quartus_asm $result"
}
project_close
