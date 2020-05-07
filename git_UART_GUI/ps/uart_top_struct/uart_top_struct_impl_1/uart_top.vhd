
-- 
-- Definition of  uart_top
-- 
--      05/07/20 12:44:34
--      
--      Precision RTL Synthesis, 64-bit 2017.2.0.12
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- Library use clause for technology cells
library unisim ;
use unisim.vcomponents.all;

entity uart_top is 
   port (
      addr : IN std_logic_vector (2 DOWNTO 0) ;
      clk : IN std_logic ;
      cs : IN std_logic ;
      datin : IN std_logic_vector (7 DOWNTO 0) ;
      nrw : IN std_logic ;
      rst : IN std_logic ;
      sin : IN std_logic ;
      datout : OUT std_logic_vector (7 DOWNTO 0) ;
      int : OUT std_logic ;
      sout : OUT std_logic) ;
end uart_top ;

architecture struct of uart_top is 
   component git_uart_gui_address_decode
      port (
         addr : IN std_logic_vector (2 DOWNTO 0) ;
         clk : IN std_logic ;
         rst : IN std_logic ;
         clk_div_en : OUT std_logic ;
         clr_int_en : OUT std_logic ;
         ser_if_select : OUT std_logic_vector (1 DOWNTO 0) ;
         xmitdt_en : OUT std_logic) ;
   end component ;
   component git_uart_gui_clock_divider
      port (
         addr : IN std_logic ;
         clk : IN std_logic ;
         clk_div_en : IN std_logic ;
         datin : IN std_logic_vector (7 DOWNTO 0) ;
         enable_rcv_clk : IN std_logic ;
         enable_write : IN std_logic ;
         enable_xmit_clk : IN std_logic ;
         rst : IN std_logic ;
         div_data : OUT std_logic_vector (7 DOWNTO 0) ;
         sample : OUT std_logic) ;
   end component ;
   component git_uart_gui_cpu_interface
      port (
         clk : IN std_logic ;
         clk_div_en : IN std_logic ;
         clr_int_en : IN std_logic ;
         cs : IN std_logic ;
         div_data : IN std_logic_vector (7 DOWNTO 0) ;
         nrw : IN std_logic ;
         rst : IN std_logic ;
         ser_if_data : IN std_logic_vector (7 DOWNTO 0) ;
         xmitdt_en : IN std_logic ;
         clear_flags : OUT std_logic ;
         datout : OUT std_logic_vector (7 DOWNTO 0) ;
         enable_write : OUT std_logic ;
         start_xmit : OUT std_logic) ;
   end component ;
   component git_uart_gui_serial_interface
      port (
         clear_flags : IN std_logic ;
         clk : IN std_logic ;
         datin : IN std_logic_vector (7 DOWNTO 0) ;
         enable_write : IN std_logic ;
         rst : IN std_logic ;
         sample : IN std_logic ;
         ser_if_select : IN std_logic_vector (1 DOWNTO 0) ;
         sin : IN std_logic ;
         start_xmit : IN std_logic ;
         xmitdt_en : IN std_logic ;
         enable_rcv_clk : OUT std_logic ;
         enable_xmit_clk : OUT std_logic ;
         int : OUT std_logic ;
         ser_if_data : OUT std_logic_vector (7 DOWNTO 0) ;
         sout : OUT std_logic) ;
   end component ;
   signal datout_1_0: std_logic_vector (7 DOWNTO 0) ;
   
   signal int_1_0, sout_1_0, clear_flags, clk_div_en, clr_int_en: std_logic
    ;
   
   signal div_data: std_logic_vector (7 DOWNTO 0) ;
   
   signal enable_rcv_clk, enable_write, enable_xmit_clk, sample: std_logic
    ;
   
   signal ser_if_data: std_logic_vector (7 DOWNTO 0) ;
   
   signal ser_if_select: std_logic_vector (1 DOWNTO 0) ;
   
   signal start_xmit, xmitdt_en: std_logic ;
   
   signal addr_int: std_logic_vector (2 DOWNTO 0) ;
   
   signal clk_int, cs_int: std_logic ;
   
   signal datin_int: std_logic_vector (7 DOWNTO 0) ;
   
   signal nrw_int, rst_int, sin_int: std_logic ;

begin
   U_3 : git_uart_gui_address_decode port map ( addr(2)=>addr_int(2), 
      addr(1)=>addr_int(1), addr(0)=>addr_int(0), clk=>clk_int, rst=>rst_int, 
      clk_div_en=>clk_div_en, clr_int_en=>clr_int_en, ser_if_select(1)=>
      ser_if_select(1), ser_if_select(0)=>ser_if_select(0), xmitdt_en=>
      xmitdt_en);
   U_2 : git_uart_gui_clock_divider port map ( addr=>addr_int(0), clk=>
      clk_int, clk_div_en=>clk_div_en, datin(7)=>datin_int(7), datin(6)=>
      datin_int(6), datin(5)=>datin_int(5), datin(4)=>datin_int(4), datin(3)
      =>datin_int(3), datin(2)=>datin_int(2), datin(1)=>datin_int(1), 
      datin(0)=>datin_int(0), enable_rcv_clk=>enable_rcv_clk, enable_write=>
      enable_write, enable_xmit_clk=>enable_xmit_clk, rst=>rst_int, 
      div_data(7)=>div_data(7), div_data(6)=>div_data(6), div_data(5)=>
      div_data(5), div_data(4)=>div_data(4), div_data(3)=>div_data(3), 
      div_data(2)=>div_data(2), div_data(1)=>div_data(1), div_data(0)=>
      div_data(0), sample=>sample);
   U_1 : git_uart_gui_cpu_interface port map ( clk=>clk_int, clk_div_en=>
      clk_div_en, clr_int_en=>clr_int_en, cs=>cs_int, div_data(7)=>
      div_data(7), div_data(6)=>div_data(6), div_data(5)=>div_data(5), 
      div_data(4)=>div_data(4), div_data(3)=>div_data(3), div_data(2)=>
      div_data(2), div_data(1)=>div_data(1), div_data(0)=>div_data(0), nrw=>
      nrw_int, rst=>rst_int, ser_if_data(7)=>ser_if_data(7), ser_if_data(6)
      =>ser_if_data(6), ser_if_data(5)=>ser_if_data(5), ser_if_data(4)=>
      ser_if_data(4), ser_if_data(3)=>ser_if_data(3), ser_if_data(2)=>
      ser_if_data(2), ser_if_data(1)=>ser_if_data(1), ser_if_data(0)=>
      ser_if_data(0), xmitdt_en=>xmitdt_en, clear_flags=>clear_flags, 
      datout(7)=>datout_1_0(7), datout(6)=>datout_1_0(6), datout(5)=>
      datout_1_0(5), datout(4)=>datout_1_0(4), datout(3)=>datout_1_0(3), 
      datout(2)=>datout_1_0(2), datout(1)=>datout_1_0(1), datout(0)=>
      datout_1_0(0), enable_write=>enable_write, start_xmit=>start_xmit);
   U_4 : git_uart_gui_serial_interface port map ( clear_flags=>clear_flags, 
      clk=>clk_int, datin(7)=>datin_int(7), datin(6)=>datin_int(6), datin(5)
      =>datin_int(5), datin(4)=>datin_int(4), datin(3)=>datin_int(3), 
      datin(2)=>datin_int(2), datin(1)=>datin_int(1), datin(0)=>datin_int(0), 
      enable_write=>enable_write, rst=>rst_int, sample=>sample, 
      ser_if_select(1)=>ser_if_select(1), ser_if_select(0)=>ser_if_select(0), 
      sin=>sin_int, start_xmit=>start_xmit, xmitdt_en=>xmitdt_en, 
      enable_rcv_clk=>enable_rcv_clk, enable_xmit_clk=>enable_xmit_clk, int
      =>int_1_0, ser_if_data(7)=>ser_if_data(7), ser_if_data(6)=>
      ser_if_data(6), ser_if_data(5)=>ser_if_data(5), ser_if_data(4)=>
      ser_if_data(4), ser_if_data(3)=>ser_if_data(3), ser_if_data(2)=>
      ser_if_data(2), ser_if_data(1)=>ser_if_data(1), ser_if_data(0)=>
      ser_if_data(0), sout=>sout_1_0);
   sout_obuf : OBUF port map ( O=>sout, I=>sout_1_0);
   int_obuf : OBUF port map ( O=>int, I=>int_1_0);
   datout_obuf_0 : OBUF port map ( O=>datout(0), I=>datout_1_0(0));
   datout_obuf_1 : OBUF port map ( O=>datout(1), I=>datout_1_0(1));
   datout_obuf_2 : OBUF port map ( O=>datout(2), I=>datout_1_0(2));
   datout_obuf_3 : OBUF port map ( O=>datout(3), I=>datout_1_0(3));
   datout_obuf_4 : OBUF port map ( O=>datout(4), I=>datout_1_0(4));
   datout_obuf_5 : OBUF port map ( O=>datout(5), I=>datout_1_0(5));
   datout_obuf_6 : OBUF port map ( O=>datout(6), I=>datout_1_0(6));
   datout_obuf_7 : OBUF port map ( O=>datout(7), I=>datout_1_0(7));
   sin_ibuf : IBUF port map ( O=>sin_int, I=>sin);
   rst_ibuf : IBUF port map ( O=>rst_int, I=>rst);
   nrw_ibuf : IBUF port map ( O=>nrw_int, I=>nrw);
   datin_ibuf_0 : IBUF port map ( O=>datin_int(0), I=>datin(0));
   datin_ibuf_1 : IBUF port map ( O=>datin_int(1), I=>datin(1));
   datin_ibuf_2 : IBUF port map ( O=>datin_int(2), I=>datin(2));
   datin_ibuf_3 : IBUF port map ( O=>datin_int(3), I=>datin(3));
   datin_ibuf_4 : IBUF port map ( O=>datin_int(4), I=>datin(4));
   datin_ibuf_5 : IBUF port map ( O=>datin_int(5), I=>datin(5));
   datin_ibuf_6 : IBUF port map ( O=>datin_int(6), I=>datin(6));
   datin_ibuf_7 : IBUF port map ( O=>datin_int(7), I=>datin(7));
   cs_ibuf : IBUF port map ( O=>cs_int, I=>cs);
   clk_ibuf : IBUF port map ( O=>clk_int, I=>clk);
   addr_ibuf_0 : IBUF port map ( O=>addr_int(0), I=>addr(0));
   addr_ibuf_1 : IBUF port map ( O=>addr_int(1), I=>addr(1));
   addr_ibuf_2 : IBUF port map ( O=>addr_int(2), I=>addr(2));
end struct ;

