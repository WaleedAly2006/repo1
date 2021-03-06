//
// Module UART_V.uart_top.struct
//
// Created:
//          by - user.group (host.domain)
//          at - 12:39:57 04/12/2005
//
// Generated by Mentor Graphics' HDL Designer(TM) 2005.1
//

`resetall
`timescale 1ns/10ps
module uart_top( 
   // 3-bit address bus
   addr, 
   clk,     // 10 MHz clock
   cs,      // chip select
   datin,   // 8-bit data in bus from cpu
   nrw,     // read(0), write(1)
   rst,     // reset(0)
   sin,     // serial input
   datout,  // 8-bit data out bus to cpu
   int,     // interrupt (1)
   sout     // serial output
);


// Internal Declarations

input  [2:0] addr;
input        clk;
input        cs;
input  [7:0] datin;
input        nrw;
input        rst;
input        sin;
output [7:0] datout;
output       int;
output       sout;


wire [2:0]  addr;
wire        clk;
wire        cs;
wire [7:0]  datin; // 8-bit data in bus from cpu
wire        nrw;
wire        rst;
wire        sin;
wire [7:0]  datout; // 8-bit data out bus to cpu
wire        int;
wire        sout;

// Local declarations

// Internal signal declarations
wire       clear_flags;
wire       clk_div_en;
wire       clr_int_en;
wire [7:0] div_data;
wire       enable_rcv_clk;
wire       enable_write;
wire       enable_xmit_clk;
wire       sample;
wire [7:0] ser_if_data;
wire [1:0] ser_if_select;
wire       start_xmit;
wire       xmitdt_en;


// Instances 
address_decode U_3( 
   .addr          (addr), 
   .clk           (clk), 
   .rst           (rst), 
   .clk_div_en    (clk_div_en), 
   .clr_int_en    (clr_int_en), 
   .ser_if_select (ser_if_select), 
   .xmitdt_en     (xmitdt_en)
); 

clock_divider U_2( 
   .addr            (addr[0]), 
   .clk             (clk), 
   .clk_div_en      (clk_div_en), 
   .datin           (datin), 
   .enable_rcv_clk  (enable_rcv_clk), 
   .enable_write    (enable_write), 
   .enable_xmit_clk (enable_xmit_clk), 
   .rst             (rst), 
   .div_data        (div_data), 
   .sample          (sample)
); 

cpu_interface U_1( 
   .clk          (clk), 
   .clk_div_en   (clk_div_en), 
   .clr_int_en   (clr_int_en), 
   .cs           (cs), 
   .div_data     (div_data), 
   .nrw          (nrw), 
   .rst          (rst), 
   .ser_if_data  (ser_if_data), 
   .xmitdt_en    (xmitdt_en), 
   .clear_flags  (clear_flags), 
   .datout       (datout), 
   .enable_write (enable_write), 
   .start_xmit   (start_xmit)
); 

serial_interface U_4( 
   .clear_flags     (clear_flags), 
   .clk             (clk), 
   .datin           (datin), 
   .enable_write    (enable_write), 
   .rst             (rst), 
   .sample          (sample), 
   .ser_if_select   (ser_if_select), 
   .sin             (sin), 
   .start_xmit      (start_xmit), 
   .xmitdt_en       (xmitdt_en), 
   .enable_rcv_clk  (enable_rcv_clk), 
   .enable_xmit_clk (enable_xmit_clk), 
   .int             (int), 
   .ser_if_data     (ser_if_data), 
   .sout            (sout)
); 


endmodule // uart_top

