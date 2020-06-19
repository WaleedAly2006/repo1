//
// Module Sequencer_vlg.accumulator.flow
//
// Created:
//          by - user.group (host.domain)
//          at - 11:05:03 04/12/2005
//
// Generated by Mentor Graphics' HDL Designer(TM) 2005.1
//

`resetall
`timescale 1ns/10ps
module accumulator( 
   clock, 
   clr, 
   inc, 
   ip, 
   ld, 
   op
);


// Internal Declarations

input        clock;
input        clr;
input        inc;
input  [7:0] ip;
input        ld;
output [7:0] op;


wire clock;
wire clr;
wire inc;
wire [7:0] ip;
wire ld;
reg [7:0] op;

/////////////////////////////////////////////////////////////////
// Flowchart process0
always @ (posedge clock)
begin : process0_flowchart_proc
   if (clr) begin
      // Reset Actions
      op = 0;
   end
   else if ((ld == 1)) begin
      op = ip;
   end
   else if ((inc == 1)) begin
      op = op+1;
   end
   else
   begin
      op = op;
   end
end

endmodule // accumulator
