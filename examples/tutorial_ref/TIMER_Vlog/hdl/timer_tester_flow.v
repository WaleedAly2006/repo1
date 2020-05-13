//
// Module TIMER_Vlog.Timer_tester.flow
//
// Created:
//          by - user.group (host.domain)
//          at - 11:46:33 04/12/2005
//
// Generated by Mentor Graphics' HDL Designer(TM) 2005.1
//

`resetall
`timescale 1ns/10ps
module Timer_tester( 
   alarm, 
   high, 
   low, 
   clk, 
   d, 
   reset, 
   start, 
   stop
);

// Internal Declarations
// Internal Declarations

input        alarm;
input  [3:0] high;
input  [3:0] low;
output       clk;
output [9:0] d;
output       reset;
output       start;
output       stop;


wire alarm;
wire [3:0] high;
wire [3:0] low;
reg clk;
reg [9:0] d;
reg reset;
reg start;
reg stop;

// Module declarations
// Module declarations
integer j;
reg [9:0] d_var ;
reg [3:0] b_var;
reg [3:0] high_temp;
reg [3:0] low_temp;
// Wait for specified no. of clock cycles.
task wait_clock;
  input clk_ticks;
  integer clk_ticks;
  repeat(clk_ticks) @(posedge clk);
endtask

/////////////////////////////////////////////////////////////////
// Flowchart SetVar
initial 
begin : setvar_flowchart_proc
   b_var = 4'b0;
   d_var = 10'b0;
end

/////////////////////////////////////////////////////////////////
// Flowchart Monitor
initial 
begin : monitor_flowchart_proc
   // Initialization
   stop=0;
   start=0;
   reset=0;
   d=4'b0;
   wait_clock(2);
   reset=1;
   wait_clock(6);
   reset=0;
   for (j=0;j<=9;j=j+1) begin
      d_var=10'b0;
      d_var[j]=1;
      d=d_var;
      wait_clock(4);
      if ((high!=b_var)&&(low!=b_var)) begin
         $display ("Decoder or Load failure.");
      end
      b_var=b_var+1'b1;
   end
   d=10'b0000001000;
   wait_clock(4);
   start=1;
   wait_clock(4);
   start=0;
   d=10'b0;
   wait_clock(8);
   stop=1;
   wait_clock(1);
   //Store high and low values
   high_temp=high;
   low_temp=low;
   wait_clock(3);

   if ((high==high_temp)
            && (low==low_temp)) begin
      $display("Count suspended correctly");
   end
   else
   begin
      $display("Count did not suspend");
   end
   wait_clock(4);
   stop=0;
      wait ((high==4'd0)&&(low==4'd0));
   wait_clock(4);
   if (alarm==1) begin
      $display("Alarm asserted correctly");
   end
   else
   begin
      $display("No alarm");
   end

   // Report completion
   stop=1;
   wait_clock(2);
   stop=0;
   wait_clock(4);
   $display("Timer test completed");
   $stop;
end

/////////////////////////////////////////////////////////////////
// Flowchart ClockGen
initial 
begin : clockgen_flowchart_proc

   // Local declarations
      parameter clk_prd = 50;

   clk = 0;
   forever begin
      #clk_prd clk = ~clk;
   end
end

endmodule // Timer_tester
// Timer_tester
