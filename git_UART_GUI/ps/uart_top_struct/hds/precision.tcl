## SETUP
puts "Info: HDL Designer Synthesis run started"

## Set current project and folder
if {[string length [info commands new_project]]} {
   new_project -name uart_top_struct -folder "C:/d_drive/Work/HDS_work/Projects/GIT/GIT_workspaces/repo3_from_hds/cloned_files/repo1/git_UART_GUI/ps/uart_top_struct"
} else {
   set_working_dir "C:/d_drive/Work/HDS_work/Projects/GIT/GIT_workspaces/repo3_from_hds/cloned_files/repo1/git_UART_GUI/ps/uart_top_struct"
}

## Implementation settings
MGS_Gui::notify_gui lock
setup_design -manufacturer "Xilinx" -family "Automotive Zynq Ultrascale+" -part "xazu3eg-sfva625" -speed "1-i" 
setup_design -vivado=true

## Design Settings
setup_design -addio=true
setup_design -safe_fsm_type=none
setup_design -retiming=false
if {[catch {setup_design -2004c_compile_mode=false}]} {
catch {setup_design -frontend_2004=false}
}

setup_design -vhdl=true
setup_design -verilog=true
setup_design -edif=true

## Read in source files
catch {source "C:/d_drive/Work/HDS_work/Projects/GIT/GIT_workspaces/repo3_from_hds/cloned_files/repo1/git_UART_GUI/ps/uart_top_struct/hds/add_files.tcl"}
MGS_Gui::notify_gui unlock

## Compile & Synthesize
MGS_Gui::notify_gui lock
if {[catch compile]} {
   MGS_Gui::notify_gui unlock
} elseif {[catch synthesize]} {
   MGS_Gui::notify_gui unlock
} else {
   MGS_Gui::notify_gui unlock
}

puts "Info: HDL Designer Synthesis run finished"


