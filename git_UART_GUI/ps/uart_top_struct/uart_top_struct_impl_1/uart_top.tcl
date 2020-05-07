#
# Generated by Precision RTL Synthesis 64-bit 2017.2.0.12 (Release Production Release, compiled Mon Jan  1 23:50:57 PST 2018)
#

## Setup project
file delete -force {vivado_impl_1/vivado_impl_1.ppr}
create_project vivado_impl_1 {vivado_impl_1} -part xazu3eg-sfva625-1-i
set_property design_mode GateLvl [current_fileset]
add_file -scan_for_includes {vivado_impl_1}
set_property top uart_top [current_fileset]
read_verilog {uart_top.v}
link_design
read_xdc {uart_top.xdc}


## Report project
report_property [current_project]
report_property [current_fileset]
report_property [current_fileset -constrset]

## P&R

if { [catch {opt_design -sweep -propconst -quiet} result] } {
  return -code error -errorinfo "can not run opt_design exiting ... $result"
}
if { [catch {place_design} result] } {
  return -code error -errorinfo "can not run place_design exiting ... $result"
}
if { [catch {route_design} result] } {
  return -code error -errorinfo "can not run route_design exiting ... $result"
}
## Output files and reports
write_checkpoint {vivado_impl_1/uart_top_routed.dcp}
write_xdef {vivado_impl_1/routed_uart_top.xdef}
report_timing -path_type full_clock_expanded -sort_by group -nworst 30 -file {vivado_impl_1/uart_top_timing.twr}
report_timing -path_type full_clock_expanded -sort_by group -rise_from * -rise_to * -file {vivado_impl_1/uart_top_short_timing.twr}
report_timing -path_type full_clock_expanded -sort_by group -fall_from * -fall_to * -file {vivado_impl_1/uart_top_short_timing.twr} -append
report_timing -path_type full_clock_expanded -sort_by group -rise_from * -fall_to * -file {vivado_impl_1/uart_top_short_timing.twr} -append
report_timing -path_type full_clock_expanded -sort_by group -fall_from * -rise_to * -file {vivado_impl_1/uart_top_short_timing.twr} -append
report_timing_summary -file {vivado_impl_1/uart_top_sum_timing.twr}
report_utilization -file {vivado_impl_1/uart_top_utilization.rpt}
report_clock_utilization -file {vivado_impl_1/uart_top_clock_utilization.rpt}
report_io -file {vivado_impl_1/uart_top_io.rpt}
exit
