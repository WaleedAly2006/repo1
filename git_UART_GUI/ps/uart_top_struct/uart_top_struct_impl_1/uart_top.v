//
// Verilog description for cell uart_top, 
// 05/07/20 12:44:34
//
// Precision RTL Synthesis, 64-bit 2017.2.0.12//


module uart_top ( addr, clk, cs, datin, nrw, rst, sin, datout, int, sout ) ;

    input [2:0]addr ;
    input clk ;
    input cs ;
    input [7:0]datin ;
    input nrw ;
    input rst ;
    input sin ;
    output [7:0]datout ;
    output int ;
    output sout ;

    wire [7:0]datout_1_0;
    wire int_1_0, sout_1_0, clear_flags, clk_div_en, clr_int_en;
    wire [7:0]div_data;
    wire enable_rcv_clk, enable_write, enable_xmit_clk, sample;
    wire [7:0]ser_if_data;
    wire [1:0]ser_if_select;
    wire start_xmit, xmitdt_en;
    wire [2:0]addr_int;
    wire clk_int, cs_int;
    wire [7:0]datin_int;
    wire nrw_int, rst_int, sin_int;



    git_uart_gui_address_decode U_3 (.addr ({addr_int[2],addr_int[1],addr_int[0]
                                }), .clk (clk_int), .rst (rst_int), .clk_div_en (
                                clk_div_en), .clr_int_en (clr_int_en), .ser_if_select (
                                {ser_if_select[1],ser_if_select[0]}), .xmitdt_en (
                                xmitdt_en)) ;
    git_uart_gui_clock_divider U_2 (.addr (addr_int[0]), .clk (clk_int), .clk_div_en (
                               clk_div_en), .datin ({datin_int[7],datin_int[6],
                               datin_int[5],datin_int[4],datin_int[3],
                               datin_int[2],datin_int[1],datin_int[0]}), .enable_rcv_clk (
                               enable_rcv_clk), .enable_write (enable_write), .enable_xmit_clk (
                               enable_xmit_clk), .rst (rst_int), .div_data ({
                               div_data[7],div_data[6],div_data[5],div_data[4],
                               div_data[3],div_data[2],div_data[1],div_data[0]})
                               , .sample (sample)) ;
    git_uart_gui_cpu_interface U_1 (.clk (clk_int), .clk_div_en (clk_div_en), .clr_int_en (
                               clr_int_en), .cs (cs_int), .div_data ({
                               div_data[7],div_data[6],div_data[5],div_data[4],
                               div_data[3],div_data[2],div_data[1],div_data[0]})
                               , .nrw (nrw_int), .rst (rst_int), .ser_if_data ({
                               ser_if_data[7],ser_if_data[6],ser_if_data[5],
                               ser_if_data[4],ser_if_data[3],ser_if_data[2],
                               ser_if_data[1],ser_if_data[0]}), .xmitdt_en (
                               xmitdt_en), .clear_flags (clear_flags), .datout (
                               {datout_1_0[7],datout_1_0[6],datout_1_0[5],
                               datout_1_0[4],datout_1_0[3],datout_1_0[2],
                               datout_1_0[1],datout_1_0[0]}), .enable_write (
                               enable_write), .start_xmit (start_xmit)) ;
    git_uart_gui_serial_interface U_4 (.clear_flags (clear_flags), .clk (clk_int
                                  ), .datin ({datin_int[7],datin_int[6],
                                  datin_int[5],datin_int[4],datin_int[3],
                                  datin_int[2],datin_int[1],datin_int[0]}), .enable_write (
                                  enable_write), .rst (rst_int), .sample (sample
                                  ), .ser_if_select ({ser_if_select[1],
                                  ser_if_select[0]}), .sin (sin_int), .start_xmit (
                                  start_xmit), .xmitdt_en (xmitdt_en), .enable_rcv_clk (
                                  enable_rcv_clk), .enable_xmit_clk (
                                  enable_xmit_clk), .int (int_1_0), .ser_if_data (
                                  {ser_if_data[7],ser_if_data[6],ser_if_data[5],
                                  ser_if_data[4],ser_if_data[3],ser_if_data[2],
                                  ser_if_data[1],ser_if_data[0]}), .sout (
                                  sout_1_0)) ;
    OBUF sout_obuf (.O (sout), .I (sout_1_0)) ;
    OBUF int_obuf (.O (int), .I (int_1_0)) ;
    OBUF \datout_obuf(0)  (.O (datout[0]), .I (datout_1_0[0])) ;
    OBUF \datout_obuf(1)  (.O (datout[1]), .I (datout_1_0[1])) ;
    OBUF \datout_obuf(2)  (.O (datout[2]), .I (datout_1_0[2])) ;
    OBUF \datout_obuf(3)  (.O (datout[3]), .I (datout_1_0[3])) ;
    OBUF \datout_obuf(4)  (.O (datout[4]), .I (datout_1_0[4])) ;
    OBUF \datout_obuf(5)  (.O (datout[5]), .I (datout_1_0[5])) ;
    OBUF \datout_obuf(6)  (.O (datout[6]), .I (datout_1_0[6])) ;
    OBUF \datout_obuf(7)  (.O (datout[7]), .I (datout_1_0[7])) ;
    IBUF sin_ibuf (.O (sin_int), .I (sin)) ;
    IBUF rst_ibuf (.O (rst_int), .I (rst)) ;
    IBUF nrw_ibuf (.O (nrw_int), .I (nrw)) ;
    IBUF \datin_ibuf(0)  (.O (datin_int[0]), .I (datin[0])) ;
    IBUF \datin_ibuf(1)  (.O (datin_int[1]), .I (datin[1])) ;
    IBUF \datin_ibuf(2)  (.O (datin_int[2]), .I (datin[2])) ;
    IBUF \datin_ibuf(3)  (.O (datin_int[3]), .I (datin[3])) ;
    IBUF \datin_ibuf(4)  (.O (datin_int[4]), .I (datin[4])) ;
    IBUF \datin_ibuf(5)  (.O (datin_int[5]), .I (datin[5])) ;
    IBUF \datin_ibuf(6)  (.O (datin_int[6]), .I (datin[6])) ;
    IBUF \datin_ibuf(7)  (.O (datin_int[7]), .I (datin[7])) ;
    IBUF cs_ibuf (.O (cs_int), .I (cs)) ;
    IBUF clk_ibuf (.O (clk_int), .I (clk)) ;
    IBUF \addr_ibuf(0)  (.O (addr_int[0]), .I (addr[0])) ;
    IBUF \addr_ibuf(1)  (.O (addr_int[1]), .I (addr[1])) ;
    IBUF \addr_ibuf(2)  (.O (addr_int[2]), .I (addr[2])) ;
endmodule


(* RTLC_DUMMY_VIEW = "TRUE" *)
module git_uart_gui_serial_interface ( clear_flags, clk, datin, enable_write, 
                                       rst, sample, ser_if_select, sin, 
                                       start_xmit, xmitdt_en, enable_rcv_clk, 
                                       enable_xmit_clk, int, ser_if_data, sout
                                        ) ;

    input clear_flags ;
    input clk ;
    input [7:0]datin ;
    input enable_write ;
    input rst ;
    input sample ;
    input [1:0]ser_if_select ;
    input sin ;
    input start_xmit ;
    input xmitdt_en ;
    output enable_rcv_clk ;
    output enable_xmit_clk ;
    output int ;
    output [7:0]ser_if_data ;
    output sout ;




endmodule


(* RTLC_DUMMY_VIEW = "TRUE" *)
module git_uart_gui_cpu_interface ( clk, clk_div_en, clr_int_en, cs, div_data, 
                                    nrw, rst, ser_if_data, xmitdt_en, 
                                    clear_flags, datout, enable_write, 
                                    start_xmit ) ;

    input clk ;
    input clk_div_en ;
    input clr_int_en ;
    input cs ;
    input [7:0]div_data ;
    input nrw ;
    input rst ;
    input [7:0]ser_if_data ;
    input xmitdt_en ;
    output clear_flags ;
    output [7:0]datout ;
    output enable_write ;
    output start_xmit ;




endmodule


(* RTLC_DUMMY_VIEW = "TRUE" *)
module git_uart_gui_clock_divider ( addr, clk, clk_div_en, datin, enable_rcv_clk, 
                                    enable_write, enable_xmit_clk, rst, div_data, 
                                    sample ) ;

    input addr ;
    input clk ;
    input clk_div_en ;
    input [7:0]datin ;
    input enable_rcv_clk ;
    input enable_write ;
    input enable_xmit_clk ;
    input rst ;
    output [7:0]div_data ;
    output sample ;




endmodule


(* RTLC_DUMMY_VIEW = "TRUE" *)
module git_uart_gui_address_decode ( addr, clk, rst, clk_div_en, clr_int_en, 
                                     ser_if_select, xmitdt_en ) ;

    input [2:0]addr ;
    input clk ;
    input rst ;
    output clk_div_en ;
    output clr_int_en ;
    output [1:0]ser_if_select ;
    output xmitdt_en ;




endmodule

