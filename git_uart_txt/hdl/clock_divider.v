//
// Module UART_TXT.clock_divider.rtl
//
// Created:
//          by - user.group (host.domain)
//          at - 19:13:31 4 Feb 2002
//
// Mentor Graphics' HDL Designer(TM)
//

// modify on local repo

`resetall
`timescale 1ns/10ps

module clock_divider( 
   addr, 
   clk, 
   clk_div_en, 
   datin, 
   enable_rcv_clk, 
   enable_write, 
   enable_xmit_clk, 
   rst, 
   div_data, 
   sample
);

// Internal Declarations

input        addr;
input        clk;
input        clk_div_en;
input  [7:0] datin;
input        enable_rcv_clk;
input        enable_write;
input        enable_xmit_clk;
input        rst;
output [7:0] div_data;
output       sample;

wire addr;
wire clk;
wire clk_div_en;
wire [7:0] datin;
wire enable_rcv_clk;
wire enable_write;
wire enable_xmit_clk;
wire rst;
reg [7:0] div_data;
reg sample;

// Module declarations
reg [15:0] div_msb_lsb, clk_cnt;

////////////////////////////////////////

always @ (posedge clk or negedge rst)
begin : clk_div_proc
   // Asynchronous Reset
   if (!rst) begin
      // Reset Actions
      div_msb_lsb <= 0;
      clk_cnt[15:1] <= 0;
      clk_cnt[0] <= 1;

   end
   else begin
      // Setup clock divisor values
      if (clk_div_en == 1 && enable_write == 1) begin
         if (~addr) begin
            div_msb_lsb[7:0] <= datin;
         end
         else begin
            div_msb_lsb[15:8] <= datin;
         end
      end
      // Generate divided clock
      if (enable_xmit_clk == 1 || enable_rcv_clk == 1) begin
         if (clk_cnt >= (div_msb_lsb - 1)) begin
            clk_cnt  <= 0;
         end
         else begin
            clk_cnt <= clk_cnt + 1;
         end
      end
      else begin
         clk_cnt[15:1]<=0;
         clk_cnt[0]<=1;
      end

   end
end

// Concurrent statements
always @(addr or div_msb_lsb or clk_cnt)
begin : output_div_and_sample_proc
   div_data = (addr==0) ? div_msb_lsb[7:0] : div_msb_lsb[15:8];
   sample = ( clk_cnt>= ({1'b0,  div_msb_lsb[15:1]} ) ) ? 1 : 0;
end

endmodule // clock_divider

