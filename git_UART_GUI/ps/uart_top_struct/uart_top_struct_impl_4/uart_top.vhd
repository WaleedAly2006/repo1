
-- 
-- Definition of  uart_top
-- 
--      06/23/20 09:01:21
--      
--      Precision RTL Synthesis, 64-bit 2017.2.0.12
-- 

   library IEEE;library altera_mf;library lpm;library altera;
   use IEEE.STD_LOGIC_1164.ALL;
   use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;
-- Library use clause for technology cells
library arriav ;
use arriav.arriav_components.all;

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
   signal sout_dup_0, clear_flags, enable_write, enable_xmit_clk, start_xmit
   : std_logic ;
   
   signal U_1_U_0_current_state: std_logic_vector (1 DOWNTO 1) ;
   
   signal U_2_divlsb: std_logic_vector (7 DOWNTO 0) ;
   
   signal U_2_divmsb: std_logic_vector (7 DOWNTO 0) ;
   
   signal U_2_clk_cnt: std_logic_vector (15 DOWNTO 1) ;
   
   signal U_2_rtlc5n88: std_logic_vector (15 DOWNTO 0) ;
   
   signal U_2_rtlcn516: std_logic_vector (15 DOWNTO 0) ;
   
   signal U_4_done_rcving, U_4_done_xmitting: std_logic ;
   
   signal U_4_rcv_bit_cnt: std_logic_vector (2 DOWNTO 0) ;
   
   signal U_4_recvdt: std_logic_vector (7 DOWNTO 0) ;
   
   signal U_4_status: std_logic_vector (3 DOWNTO 0) ;
   
   signal U_4_xmitdt: std_logic_vector (7 DOWNTO 0) ;
   
   signal U_4_U_0_xmit_bit_cnt: std_logic_vector (2 DOWNTO 0) ;
   
   signal U_4_U_0_xmit_current_state: std_logic_vector (5 DOWNTO 1) ;
   
   signal U_4_U_0_rcv_current_state: std_logic_vector (6 DOWNTO 1) ;
   
   signal nx21277z19, nx21277z18, nx21277z17, nx21277z16, nx21277z15, 
      nx21277z14, nx21277z13, nx21277z12, nx21277z11, nx21277z10, nx21277z9, 
      nx21277z8, nx21277z7, nx21277z6, nx21277z5, nx512z14, nx512z13, 
      nx512z12, nx512z11, nx512z10, nx512z9, nx512z8, nx512z7, nx512z6, 
      nx512z5, nx512z4, nx512z3, nx512z2, nx65051z2, nx63057z4, nx63057z3: 
   std_logic ;
   
   signal addr_int: std_logic_vector (2 DOWNTO 0) ;
   
   signal clk_int, cs_int: std_logic ;
   
   signal datin_int: std_logic_vector (7 DOWNTO 0) ;
   
   signal nrw_int, rst_int, sin_int: std_logic ;
   
   signal datout_dup_0: std_logic_vector (7 DOWNTO 0) ;
   
   signal int_dup_0, ser_if_data_3, ser_if_data_2, ser_if_data_1, 
      ser_if_data_0, nx7741z3, U_1_U_0_GND, nx9735z2, nx8738z1, nx9735z1, 
      nx7741z1, nx6744z1, U_2_PWR, nx64054z3, nx17214z1, nx9427z1, nx64054z2, 
      NOT_U_4_read_bit, nx19766z1, nx30972z1, nx29975z1, nx28978z1, 
      nx27981z1, nx26984z1, nx25987z1, nx24990z1, nx23993z1, nx23993z2, 
      nx24990z2, nx25987z2, nx26984z2, nx27981z2, nx28978z2, nx29975z2, 
      U_4_U_1_xmitting_reg_3n3ss1, U_4_U_1_rcving_reg_3n3ss1, 
      U_4_U_1_done_rcving_reg_3n3ss1, nx48030z1, nx14061z1, nx15058z1, 
      nx19046z1, nx16055z1, nx17052z1, nx3309z1, nx1315z1, nx318z1, 
      nx64857z1, nx13064z1, nx18049z1, nx4306z1, nx16055z2, nx318z2, 
      nx3650z1, NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_1_dup_49, 
      NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_2_dup_50, 
      U_4_U_0_modgen_counter_xmit_bit_cnt_inc_d_2, nx46356z1, nx47353z1, 
      nx48350z1, nx35193z1, nx36190z1, nx37187z1, nx35948z3, nx19046z7, 
      nx19046z8, nx19046z9, nx17052z3, nx19046z6, nx19046z5, nx19046z4, 
      nx19046z3, nx19046z2, nx17052z2, nx21277z38, nx21277z35, nx21277z32, 
      nx21277z29, nx21277z26, nx21277z23, nx21277z20, nx35948z2, nx35948z4, 
      nx512z15, nx21277z1, NOT_U_1_U_0_GND, nx7741z2, NOT_cs_int, nx64054z4, 
      nx20043z1, nx64857z2, nx63860z1, nx50810z1, nx35948z1: std_logic ;

begin
   nx512z14 <= NOT nx512z15;
   U_1_U_0_GND <= '0';
   U_2_PWR <= '1';
   addr_ibuf_2 : arriav_io_ibuf port map ( o=>addr_int(2), i=>addr(2));
   addr_ibuf_1 : arriav_io_ibuf port map ( o=>addr_int(1), i=>addr(1));
   addr_ibuf_0 : arriav_io_ibuf port map ( o=>addr_int(0), i=>addr(0));
   clk_ibuf : arriav_io_ibuf port map ( o=>clk_int, i=>clk);
   cs_ibuf : arriav_io_ibuf port map ( o=>cs_int, i=>cs);
   datin_ibuf_7 : arriav_io_ibuf port map ( o=>datin_int(7), i=>datin(7));
   datin_ibuf_6 : arriav_io_ibuf port map ( o=>datin_int(6), i=>datin(6));
   datin_ibuf_5 : arriav_io_ibuf port map ( o=>datin_int(5), i=>datin(5));
   datin_ibuf_4 : arriav_io_ibuf port map ( o=>datin_int(4), i=>datin(4));
   datin_ibuf_3 : arriav_io_ibuf port map ( o=>datin_int(3), i=>datin(3));
   datin_ibuf_2 : arriav_io_ibuf port map ( o=>datin_int(2), i=>datin(2));
   datin_ibuf_1 : arriav_io_ibuf port map ( o=>datin_int(1), i=>datin(1));
   datin_ibuf_0 : arriav_io_ibuf port map ( o=>datin_int(0), i=>datin(0));
   nrw_ibuf : arriav_io_ibuf port map ( o=>nrw_int, i=>nrw);
   rst_ibuf : arriav_io_ibuf port map ( o=>rst_int, i=>rst);
   sin_ibuf : arriav_io_ibuf port map ( o=>sin_int, i=>sin);
   datout_obuf_7 : arriav_io_obuf port map ( o=>datout(7), i=>
      datout_dup_0(7));
   datout_obuf_6 : arriav_io_obuf port map ( o=>datout(6), i=>
      datout_dup_0(6));
   datout_obuf_5 : arriav_io_obuf port map ( o=>datout(5), i=>
      datout_dup_0(5));
   datout_obuf_4 : arriav_io_obuf port map ( o=>datout(4), i=>
      datout_dup_0(4));
   datout_obuf_3 : arriav_io_obuf port map ( o=>datout(3), i=>
      datout_dup_0(3));
   datout_obuf_2 : arriav_io_obuf port map ( o=>datout(2), i=>
      datout_dup_0(2));
   datout_obuf_1 : arriav_io_obuf port map ( o=>datout(1), i=>
      datout_dup_0(1));
   datout_obuf_0 : arriav_io_obuf port map ( o=>datout(0), i=>
      datout_dup_0(0));
   int_obuf : arriav_io_obuf port map ( o=>int, i=>int_dup_0);
   sout_obuf : arriav_io_obuf port map ( o=>sout, i=>sout_dup_0);
   NOT_U_1_U_0_GND <= NOT U_1_U_0_GND;
   NOT_cs_int <= NOT cs_int;
   sout_dup_0 <= NOT nx50810z1;
   U_2_rtlc5_166_dec_4_ix21277z60650 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(0), cout=>nx21277z19, datad=>
      U_2_divlsb(0), dataf=>U_2_PWR, cin=>U_1_U_0_GND);
   U_2_rtlc5_166_dec_4_ix21277z60649 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(1), cout=>nx21277z18, datad=>
      U_2_divlsb(1), dataf=>U_2_PWR, cin=>nx21277z19);
   U_2_rtlc5_166_dec_4_ix21277z60648 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(2), cout=>nx21277z17, datad=>
      U_2_divlsb(2), dataf=>U_2_PWR, cin=>nx21277z18);
   U_2_rtlc5_166_dec_4_ix21277z60647 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(3), cout=>nx21277z16, datad=>
      U_2_divlsb(3), dataf=>U_2_PWR, cin=>nx21277z17);
   U_2_rtlc5_166_dec_4_ix21277z60646 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(4), cout=>nx21277z15, datad=>
      U_2_divlsb(4), dataf=>U_2_PWR, cin=>nx21277z16);
   U_2_rtlc5_166_dec_4_ix21277z60645 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(5), cout=>nx21277z14, datad=>
      U_2_divlsb(5), dataf=>U_2_PWR, cin=>nx21277z15);
   U_2_rtlc5_166_dec_4_ix21277z60644 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(6), cout=>nx21277z13, datad=>
      U_2_divlsb(6), dataf=>U_2_PWR, cin=>nx21277z14);
   U_2_rtlc5_166_dec_4_ix21277z60643 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(7), cout=>nx21277z12, datad=>
      U_2_divlsb(7), dataf=>U_2_PWR, cin=>nx21277z13);
   U_2_rtlc5_166_dec_4_ix21277z60642 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(8), cout=>nx21277z11, datad=>
      U_2_divmsb(0), dataf=>U_2_PWR, cin=>nx21277z12);
   U_2_rtlc5_166_dec_4_ix21277z60641 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(9), cout=>nx21277z10, datad=>
      U_2_divmsb(1), dataf=>U_2_PWR, cin=>nx21277z11);
   U_2_rtlc5_166_dec_4_ix21277z60640 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(10), cout=>nx21277z9, datad=>
      U_2_divmsb(2), dataf=>U_2_PWR, cin=>nx21277z10);
   U_2_rtlc5_166_dec_4_ix21277z60639 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(11), cout=>nx21277z8, datad=>
      U_2_divmsb(3), dataf=>U_2_PWR, cin=>nx21277z9);
   U_2_rtlc5_166_dec_4_ix21277z60638 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(12), cout=>nx21277z7, datad=>
      U_2_divmsb(4), dataf=>U_2_PWR, cin=>nx21277z8);
   U_2_rtlc5_166_dec_4_ix21277z60637 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(13), cout=>nx21277z6, datad=>
      U_2_divmsb(5), dataf=>U_2_PWR, cin=>nx21277z7);
   U_2_rtlc5_166_dec_4_ix21277z60636 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(14), cout=>nx21277z5, datad=>
      U_2_divmsb(6), dataf=>U_2_PWR, cin=>nx21277z6);
   U_2_rtlc5_166_dec_4_ix21277z60634 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlc5n88(15), datad=>U_2_divmsb(7), dataf=>
      U_2_PWR, cin=>nx21277z5);
   U_2_modgen_inc_5_ix512z60645 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(0), cout=>nx512z13, datad=>nx512z14, 
      dataf=>U_2_PWR, cin=>U_1_U_0_GND);
   U_2_modgen_inc_5_ix512z60644 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(1), cout=>nx512z12, datad=>
      U_2_clk_cnt(1), dataf=>U_1_U_0_GND, cin=>nx512z13);
   U_2_modgen_inc_5_ix512z60643 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(2), cout=>nx512z11, datad=>
      U_2_clk_cnt(2), dataf=>U_1_U_0_GND, cin=>nx512z12);
   U_2_modgen_inc_5_ix512z60642 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(3), cout=>nx512z10, datad=>
      U_2_clk_cnt(3), dataf=>U_1_U_0_GND, cin=>nx512z11);
   U_2_modgen_inc_5_ix512z60641 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(4), cout=>nx512z9, datad=>
      U_2_clk_cnt(4), dataf=>U_1_U_0_GND, cin=>nx512z10);
   U_2_modgen_inc_5_ix512z60640 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(5), cout=>nx512z8, datad=>
      U_2_clk_cnt(5), dataf=>U_1_U_0_GND, cin=>nx512z9);
   U_2_modgen_inc_5_ix512z60639 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(6), cout=>nx512z7, datad=>
      U_2_clk_cnt(6), dataf=>U_1_U_0_GND, cin=>nx512z8);
   U_2_modgen_inc_5_ix512z60638 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(7), cout=>nx512z6, datad=>
      U_2_clk_cnt(7), dataf=>U_1_U_0_GND, cin=>nx512z7);
   U_2_modgen_inc_5_ix512z60637 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(8), cout=>nx512z5, datad=>
      U_2_clk_cnt(8), dataf=>U_1_U_0_GND, cin=>nx512z6);
   U_2_modgen_inc_5_ix512z60636 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(9), cout=>nx512z4, datad=>
      U_2_clk_cnt(9), dataf=>U_1_U_0_GND, cin=>nx512z5);
   U_2_modgen_inc_5_ix512z60635 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(10), cout=>nx512z3, datad=>
      U_2_clk_cnt(10), dataf=>U_1_U_0_GND, cin=>nx512z4);
   U_2_modgen_inc_5_ix512z60634 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(11), cout=>nx512z2, datad=>
      U_2_clk_cnt(11), dataf=>U_1_U_0_GND, cin=>nx512z3);
   U_2_modgen_inc_5_ix512z60633 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(12), cout=>nx65051z2, datad=>
      U_2_clk_cnt(12), dataf=>U_1_U_0_GND, cin=>nx512z2);
   U_2_modgen_inc_5_ix65051z60633 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(13), cout=>nx63057z4, datad=>
      U_2_clk_cnt(13), dataf=>U_1_U_0_GND, cin=>nx65051z2);
   U_2_modgen_inc_5_ix63057z60634 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(14), cout=>nx63057z3, datad=>
      U_2_clk_cnt(14), dataf=>U_1_U_0_GND, cin=>nx63057z4);
   U_2_modgen_inc_5_ix63057z60633 : arriav_lcell_comb
      generic map (lut_mask => X"000000ff0000ff00") 
       port map ( sumout=>U_2_rtlcn516(15), datad=>U_2_clk_cnt(15), dataf=>
      U_1_U_0_GND, cin=>nx63057z3);
   ix29832z60633 : arriav_lcell_comb
      generic map (lut_mask => X"3330302200303022",
         extended_lut => "on") 
       port map ( combout=>datout_dup_0(7), dataa=>U_2_divlsb(7), datab=>
      addr_int(1), datac=>U_2_divmsb(7), datad=>addr_int(0), datae=>
      addr_int(2), dataf=>U_4_recvdt(7), datag=>U_4_xmitdt(7));
   ix30829z60633 : arriav_lcell_comb
      generic map (lut_mask => X"3330302200303022",
         extended_lut => "on") 
       port map ( combout=>datout_dup_0(6), dataa=>U_2_divlsb(6), datab=>
      addr_int(1), datac=>U_2_divmsb(6), datad=>addr_int(0), datae=>
      addr_int(2), dataf=>U_4_recvdt(6), datag=>U_4_xmitdt(6));
   ix31826z60633 : arriav_lcell_comb
      generic map (lut_mask => X"3330302200303022",
         extended_lut => "on") 
       port map ( combout=>datout_dup_0(5), dataa=>U_2_divlsb(5), datab=>
      addr_int(1), datac=>U_2_divmsb(5), datad=>addr_int(0), datae=>
      addr_int(2), dataf=>U_4_recvdt(5), datag=>U_4_xmitdt(5));
   ix32823z60633 : arriav_lcell_comb
      generic map (lut_mask => X"3330302200303022",
         extended_lut => "on") 
       port map ( combout=>datout_dup_0(4), dataa=>U_2_divlsb(4), datab=>
      addr_int(1), datac=>U_2_divmsb(4), datad=>addr_int(0), datae=>
      addr_int(2), dataf=>U_4_recvdt(4), datag=>U_4_xmitdt(4));
   ix35948z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0f0f5f5f3f0c7f4c",
         extended_lut => "on") 
       port map ( combout=>nx35948z1, dataa=>U_4_U_0_xmit_bit_cnt(0), datab
      =>U_4_U_0_xmit_current_state(3), datac=>nx35948z2, datad=>
      U_4_U_0_xmit_current_state(1), datae=>nx35948z3, dataf=>
      U_4_U_0_xmit_current_state(2), datag=>nx35948z4);
   ix36190z60633 : arriav_lcell_comb
      generic map (lut_mask => X"33a3a3a3aaaaa3a3",
         extended_lut => "on") 
       port map ( combout=>nx36190z1, dataa=>U_4_rcv_bit_cnt(1), datab=>
      NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_1_dup_49, datac=>
      nx64054z4, datad=>U_2_clk_cnt(15), datae=>U_4_U_0_rcv_current_state(1), 
      dataf=>nx16055z2, datag=>nx17052z2);
   ix37187z60633 : arriav_lcell_comb
      generic map (lut_mask => X"33a3a3a3aaaaa3a3",
         extended_lut => "on") 
       port map ( combout=>nx37187z1, dataa=>U_4_rcv_bit_cnt(2), datab=>
      NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_2_dup_50, datac=>
      nx64054z4, datad=>U_2_clk_cnt(15), datae=>U_4_U_0_rcv_current_state(1), 
      dataf=>nx16055z2, datag=>nx17052z2);
   ix35948z60635 : arriav_lcell_comb
      generic map (lut_mask => X"fffc00b8ff3000b8",
         extended_lut => "on") 
       port map ( combout=>nx35948z3, dataa=>U_4_xmitdt(2), datab=>
      U_4_U_0_xmit_bit_cnt(1), datac=>U_4_xmitdt(0), datad=>
      U_4_U_0_xmit_bit_cnt(0), datae=>U_4_U_0_xmit_bit_cnt(2), dataf=>
      U_4_xmitdt(6), datag=>U_4_xmitdt(4));
   ix19046z60637 : arriav_lcell_comb
      generic map (lut_mask => X"a0a080a8fafaeafe",
         extended_lut => "on") 
       port map ( combout=>nx19046z5, dataa=>U_2_divlsb(6), datab=>
      U_2_divlsb(4), datac=>nx19046z6, datad=>U_2_clk_cnt(3), datae=>
      nx19046z7, dataf=>U_2_clk_cnt(5), datag=>U_2_divlsb(5));
   ix19046z60636 : arriav_lcell_comb
      generic map (lut_mask => X"c0c080c8fcfcecfe",
         extended_lut => "on") 
       port map ( combout=>nx19046z4, dataa=>U_2_divlsb(7), datab=>
      U_2_divmsb(1), datac=>nx19046z5, datad=>U_2_clk_cnt(6), datae=>
      nx19046z8, dataf=>U_2_clk_cnt(8), datag=>U_2_divmsb(0));
   ix19046z60635 : arriav_lcell_comb
      generic map (lut_mask => X"a0a080a8fafaeafe",
         extended_lut => "on") 
       port map ( combout=>nx19046z3, dataa=>U_2_divmsb(4), datab=>
      U_2_divmsb(2), datac=>nx19046z4, datad=>U_2_clk_cnt(9), datae=>
      nx19046z9, dataf=>U_2_clk_cnt(11), datag=>U_2_divmsb(3));
   ix17052z60634 : arriav_lcell_comb
      generic map (lut_mask => X"a0a080a8fafaeafe",
         extended_lut => "on") 
       port map ( combout=>nx17052z2, dataa=>U_2_divmsb(7), datab=>
      U_2_divmsb(5), datac=>nx19046z3, datad=>U_2_clk_cnt(12), datae=>
      nx17052z3, dataf=>U_2_clk_cnt(14), datag=>U_2_divmsb(6));
   U_2_reg_clk_cnt_1 : dffeas port map ( q=>U_2_clk_cnt(1), d=>
      U_2_rtlcn516(1), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_2 : dffeas port map ( q=>U_2_clk_cnt(2), d=>
      U_2_rtlcn516(2), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_3 : dffeas port map ( q=>U_2_clk_cnt(3), d=>
      U_2_rtlcn516(3), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_4 : dffeas port map ( q=>U_2_clk_cnt(4), d=>
      U_2_rtlcn516(4), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_5 : dffeas port map ( q=>U_2_clk_cnt(5), d=>
      U_2_rtlcn516(5), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_6 : dffeas port map ( q=>U_2_clk_cnt(6), d=>
      U_2_rtlcn516(6), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_7 : dffeas port map ( q=>U_2_clk_cnt(7), d=>
      U_2_rtlcn516(7), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_8 : dffeas port map ( q=>U_2_clk_cnt(8), d=>
      U_2_rtlcn516(8), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_9 : dffeas port map ( q=>U_2_clk_cnt(9), d=>
      U_2_rtlcn516(9), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_10 : dffeas port map ( q=>U_2_clk_cnt(10), d=>
      U_2_rtlcn516(10), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_11 : dffeas port map ( q=>U_2_clk_cnt(11), d=>
      U_2_rtlcn516(11), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_12 : dffeas port map ( q=>U_2_clk_cnt(12), d=>
      U_2_rtlcn516(12), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_13 : dffeas port map ( q=>U_2_clk_cnt(13), d=>
      U_2_rtlcn516(13), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_14 : dffeas port map ( q=>U_2_clk_cnt(14), d=>
      U_2_rtlcn516(14), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_2_reg_clk_cnt_15 : dffeas port map ( q=>U_2_clk_cnt(15), d=>
      U_2_rtlcn516(15), clk=>clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>
      U_2_PWR, asdata=>U_1_U_0_GND, sclr=>nx64054z2, sload=>U_1_U_0_GND);
   U_4_U_0_modgen_counter_rcv_bit_cnt_reg_q_2 : dffeas port map ( q=>
      U_4_rcv_bit_cnt(2), d=>nx37187z1, clk=>clk_int, ena=>U_2_PWR, clrn=>
      rst_int, prn=>U_2_PWR, asdata=>U_1_U_0_GND);
   U_4_U_0_modgen_counter_rcv_bit_cnt_reg_q_1 : dffeas port map ( q=>
      U_4_rcv_bit_cnt(1), d=>nx36190z1, clk=>clk_int, ena=>U_2_PWR, clrn=>
      rst_int, prn=>U_2_PWR, asdata=>U_1_U_0_GND);
   U_4_U_0_modgen_counter_rcv_bit_cnt_reg_q_0 : dffeas port map ( q=>
      U_4_rcv_bit_cnt(0), d=>nx35193z1, clk=>clk_int, ena=>U_2_PWR, clrn=>
      rst_int, prn=>U_2_PWR, asdata=>U_1_U_0_GND);
   U_4_U_0_modgen_counter_xmit_bit_cnt_reg_q_2 : dffeas port map ( q=>
      U_4_U_0_xmit_bit_cnt(2), d=>nx48350z1, clk=>clk_int, ena=>U_2_PWR, 
      clrn=>rst_int, prn=>U_2_PWR, asdata=>U_1_U_0_GND);
   U_4_U_0_modgen_counter_xmit_bit_cnt_reg_q_1 : dffeas port map ( q=>
      U_4_U_0_xmit_bit_cnt(1), d=>nx47353z1, clk=>clk_int, ena=>U_2_PWR, 
      clrn=>rst_int, prn=>U_2_PWR, asdata=>U_1_U_0_GND);
   U_4_U_0_modgen_counter_xmit_bit_cnt_reg_q_0 : dffeas port map ( q=>
      U_4_U_0_xmit_bit_cnt(0), d=>nx46356z1, clk=>clk_int, ena=>U_2_PWR, 
      clrn=>rst_int, prn=>U_2_PWR, asdata=>U_1_U_0_GND);
   U_2_reg_clk_cnt_0 : dffeas port map ( q=>nx512z15, d=>nx21277z1, clk=>
      clk_int, ena=>U_2_PWR, clrn=>rst_int, prn=>U_2_PWR, asdata=>
      NOT_U_1_U_0_GND);
   ix33820z60633 : arriav_lcell_comb
      generic map (lut_mask => X"fffdfefc03010200") 
       port map ( combout=>datout_dup_0(3), dataa=>addr_int(0), datab=>
      addr_int(1), datac=>addr_int(2), datad=>U_2_divmsb(3), datae=>
      U_2_divlsb(3), dataf=>ser_if_data_3);
   ix34817z60633 : arriav_lcell_comb
      generic map (lut_mask => X"fffdfefc03010200") 
       port map ( combout=>datout_dup_0(2), dataa=>addr_int(0), datab=>
      addr_int(1), datac=>addr_int(2), datad=>U_2_divmsb(2), datae=>
      U_2_divlsb(2), dataf=>ser_if_data_2);
   ix35814z60633 : arriav_lcell_comb
      generic map (lut_mask => X"fffdfefc03010200") 
       port map ( combout=>datout_dup_0(1), dataa=>addr_int(0), datab=>
      addr_int(1), datac=>addr_int(2), datad=>U_2_divmsb(1), datae=>
      U_2_divlsb(1), dataf=>ser_if_data_1);
   ix36811z60633 : arriav_lcell_comb
      generic map (lut_mask => X"fffdfefc03010200") 
       port map ( combout=>datout_dup_0(0), dataa=>addr_int(0), datab=>
      addr_int(1), datac=>addr_int(2), datad=>U_2_divmsb(0), datae=>
      U_2_divlsb(0), dataf=>ser_if_data_0);
   ix8346z60633 : arriav_lcell_comb
      generic map (lut_mask => X"ffffffffffff0000") 
       port map ( combout=>int_dup_0, datae=>U_4_status(2), dataf=>
      U_4_status(3));
   ix33820z60634 : arriav_lcell_comb
      generic map (lut_mask => X"7060302050401000") 
       port map ( combout=>ser_if_data_3, dataa=>addr_int(0), datab=>
      addr_int(1), datac=>addr_int(2), datad=>U_4_xmitdt(3), datae=>
      U_4_status(3), dataf=>U_4_recvdt(3));
   ix34817z60634 : arriav_lcell_comb
      generic map (lut_mask => X"7060302050401000") 
       port map ( combout=>ser_if_data_2, dataa=>addr_int(0), datab=>
      addr_int(1), datac=>addr_int(2), datad=>U_4_xmitdt(2), datae=>
      U_4_status(2), dataf=>U_4_recvdt(2));
   ix35814z60634 : arriav_lcell_comb
      generic map (lut_mask => X"7060302050401000") 
       port map ( combout=>ser_if_data_1, dataa=>addr_int(0), datab=>
      addr_int(1), datac=>addr_int(2), datad=>U_4_xmitdt(1), datae=>
      U_4_status(1), dataf=>U_4_recvdt(1));
   ix36811z60634 : arriav_lcell_comb
      generic map (lut_mask => X"7060302050401000") 
       port map ( combout=>ser_if_data_0, dataa=>addr_int(0), datab=>
      addr_int(1), datac=>addr_int(2), datad=>U_4_xmitdt(0), datae=>
      U_4_status(0), dataf=>U_4_recvdt(0));
   ix7741z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffffff00ffffffff") 
       port map ( combout=>nx7741z3, datad=>addr_int(0), datae=>addr_int(1), 
      dataf=>addr_int(2));
   ix9735z60634 : arriav_lcell_comb
      generic map (lut_mask => X"f0ffffffffffffff") 
       port map ( combout=>nx9735z2, datac=>nrw_int, datad=>addr_int(0), 
      datae=>addr_int(1), dataf=>addr_int(2));
   ix8738z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0f0f00000f0f0f00") 
       port map ( combout=>nx8738z1, datac=>cs_int, datad=>
      U_1_U_0_current_state(1), datae=>clear_flags, dataf=>nx9735z2);
   ix9735z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0f0f000300030003") 
       port map ( combout=>nx9735z1, datab=>nrw_int, datac=>cs_int, datad=>
      nx7741z2, datae=>U_1_U_0_current_state(1), dataf=>nx9735z2);
   ix7741z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0f0f000c030f000c") 
       port map ( combout=>nx7741z1, datab=>nrw_int, datac=>cs_int, datad=>
      nx7741z2, datae=>enable_write, dataf=>nx7741z3);
   ix6744z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0f000f000f0c0f00") 
       port map ( combout=>nx6744z1, datab=>nrw_int, datac=>cs_int, datad=>
      start_xmit, datae=>enable_write, dataf=>nx7741z3);
   ix64054z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffffffff000033f3") 
       port map ( combout=>nx64054z3, datab=>sin_int, datac=>nx64054z4, 
      datad=>U_4_U_0_rcv_current_state(2), datae=>U_4_done_rcving, dataf=>
      enable_xmit_clk);
   ix17214z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0000000f00000000") 
       port map ( combout=>nx17214z1, datac=>addr_int(0), datad=>addr_int(1), 
      datae=>addr_int(2), dataf=>enable_write);
   ix9427z60633 : arriav_lcell_comb
      generic map (lut_mask => X"000000f000000000") 
       port map ( combout=>nx9427z1, datac=>addr_int(0), datad=>addr_int(1), 
      datae=>addr_int(2), dataf=>enable_write);
   ix64054z60633 : arriav_lcell_comb
      generic map (lut_mask => X"00fff0fff0ffffff") 
       port map ( combout=>nx64054z2, datac=>U_2_clk_cnt(15), datad=>
      nx64054z3, datae=>U_2_rtlc5n88(15), dataf=>nx21277z20);
   ix30972z60634 : arriav_lcell_comb
      generic map (lut_mask => X"0300ffff0000ffff") 
       port map ( combout=>NOT_U_4_read_bit, datab=>addr_int(0), datac=>
      addr_int(1), datad=>addr_int(2), datae=>U_4_U_0_rcv_current_state(1), 
      dataf=>enable_write);
   ix19766z60633 : arriav_lcell_comb
      generic map (lut_mask => X"000f000000000000") 
       port map ( combout=>nx19766z1, datac=>addr_int(0), datad=>addr_int(1), 
      datae=>addr_int(2), dataf=>enable_write);
   ix30972z60633 : arriav_lcell_comb
      generic map (lut_mask => X"ccccccacccccccaa") 
       port map ( combout=>nx30972z1, dataa=>sin_int, datab=>U_4_recvdt(7), 
      datac=>U_2_clk_cnt(15), datad=>nx16055z2, datae=>NOT_U_4_read_bit, 
      dataf=>nx17052z2);
   ix29975z60633 : arriav_lcell_comb
      generic map (lut_mask => X"ccccccacccccccaa") 
       port map ( combout=>nx29975z1, dataa=>sin_int, datab=>U_4_recvdt(6), 
      datac=>U_2_clk_cnt(15), datad=>nx29975z2, datae=>NOT_U_4_read_bit, 
      dataf=>nx17052z2);
   ix28978z60633 : arriav_lcell_comb
      generic map (lut_mask => X"ccccccacccccccaa") 
       port map ( combout=>nx28978z1, dataa=>sin_int, datab=>U_4_recvdt(5), 
      datac=>U_2_clk_cnt(15), datad=>nx28978z2, datae=>NOT_U_4_read_bit, 
      dataf=>nx17052z2);
   ix27981z60633 : arriav_lcell_comb
      generic map (lut_mask => X"ccccccacccccccaa") 
       port map ( combout=>nx27981z1, dataa=>sin_int, datab=>U_4_recvdt(4), 
      datac=>U_2_clk_cnt(15), datad=>nx27981z2, datae=>NOT_U_4_read_bit, 
      dataf=>nx17052z2);
   ix26984z60633 : arriav_lcell_comb
      generic map (lut_mask => X"ccccccacccccccaa") 
       port map ( combout=>nx26984z1, dataa=>sin_int, datab=>U_4_recvdt(3), 
      datac=>U_2_clk_cnt(15), datad=>nx26984z2, datae=>NOT_U_4_read_bit, 
      dataf=>nx17052z2);
   ix25987z60633 : arriav_lcell_comb
      generic map (lut_mask => X"ccccccacccccccaa") 
       port map ( combout=>nx25987z1, dataa=>sin_int, datab=>U_4_recvdt(2), 
      datac=>U_2_clk_cnt(15), datad=>nx25987z2, datae=>NOT_U_4_read_bit, 
      dataf=>nx17052z2);
   ix24990z60633 : arriav_lcell_comb
      generic map (lut_mask => X"ccccccacccccccaa") 
       port map ( combout=>nx24990z1, dataa=>sin_int, datab=>U_4_recvdt(1), 
      datac=>U_2_clk_cnt(15), datad=>nx24990z2, datae=>NOT_U_4_read_bit, 
      dataf=>nx17052z2);
   ix23993z60633 : arriav_lcell_comb
      generic map (lut_mask => X"ccccccacccccccaa") 
       port map ( combout=>nx23993z1, dataa=>sin_int, datab=>U_4_recvdt(0), 
      datac=>U_2_clk_cnt(15), datad=>nx23993z2, datae=>NOT_U_4_read_bit, 
      dataf=>nx17052z2);
   ix23993z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffffffffffffff00") 
       port map ( combout=>nx23993z2, datad=>U_4_rcv_bit_cnt(0), datae=>
      U_4_rcv_bit_cnt(1), dataf=>U_4_rcv_bit_cnt(2));
   ix24990z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffffffffffff00ff") 
       port map ( combout=>nx24990z2, datad=>U_4_rcv_bit_cnt(0), datae=>
      U_4_rcv_bit_cnt(1), dataf=>U_4_rcv_bit_cnt(2));
   ix25987z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffffffffff00ffff") 
       port map ( combout=>nx25987z2, datad=>U_4_rcv_bit_cnt(0), datae=>
      U_4_rcv_bit_cnt(1), dataf=>U_4_rcv_bit_cnt(2));
   ix26984z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffffffff00ffffff") 
       port map ( combout=>nx26984z2, datad=>U_4_rcv_bit_cnt(0), datae=>
      U_4_rcv_bit_cnt(1), dataf=>U_4_rcv_bit_cnt(2));
   ix27981z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffffff00ffffffff") 
       port map ( combout=>nx27981z2, datad=>U_4_rcv_bit_cnt(0), datae=>
      U_4_rcv_bit_cnt(1), dataf=>U_4_rcv_bit_cnt(2));
   ix28978z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffff00ffffffffff") 
       port map ( combout=>nx28978z2, datad=>U_4_rcv_bit_cnt(0), datae=>
      U_4_rcv_bit_cnt(1), dataf=>U_4_rcv_bit_cnt(2));
   ix29975z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ff00ffffffffffff") 
       port map ( combout=>nx29975z2, datad=>U_4_rcv_bit_cnt(0), datae=>
      U_4_rcv_bit_cnt(1), dataf=>U_4_rcv_bit_cnt(2));
   ix37659z60633 : arriav_lcell_comb
      generic map (lut_mask => X"00000000ffff0000") 
       port map ( combout=>U_4_U_1_xmitting_reg_3n3ss1, datae=>
      enable_xmit_clk, dataf=>clear_flags);
   ix37346z60633 : arriav_lcell_comb
      generic map (lut_mask => X"00000000000000f0") 
       port map ( combout=>U_4_U_1_rcving_reg_3n3ss1, datac=>nx64054z4, 
      datad=>U_4_U_0_rcv_current_state(2), datae=>U_4_done_rcving, dataf=>
      clear_flags);
   ix12643z60633 : arriav_lcell_comb
      generic map (lut_mask => X"00000000ffff0000") 
       port map ( combout=>U_4_U_1_done_rcving_reg_3n3ss1, datae=>
      U_4_done_rcving, dataf=>clear_flags);
   ix48030z60633 : arriav_lcell_comb
      generic map (lut_mask => X"00000000ffffff00") 
       port map ( combout=>nx48030z1, datad=>U_4_status(2), datae=>
      U_4_done_xmitting, dataf=>clear_flags);
   ix14061z60633 : arriav_lcell_comb
      generic map (lut_mask => X"00ee000e000e0000") 
       port map ( combout=>nx14061z1, dataa=>U_4_U_0_rcv_current_state(5), 
      datab=>U_4_U_0_rcv_current_state(6), datac=>U_2_clk_cnt(14), datad=>
      U_2_clk_cnt(15), datae=>U_2_divmsb(7), dataf=>nx19046z2);
   ix15058z60633 : arriav_lcell_comb
      generic map (lut_mask => X"f000fc00f0f0fcfc") 
       port map ( combout=>nx15058z1, datab=>U_4_U_0_rcv_current_state(1), 
      datac=>U_4_U_0_rcv_current_state(5), datad=>U_2_clk_cnt(15), datae=>
      nx16055z2, dataf=>nx17052z2);
   ix19046z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0000a8fc000000a8") 
       port map ( combout=>nx19046z1, dataa=>nx19046z2, datab=>
      U_4_U_0_rcv_current_state(1), datac=>U_4_U_0_rcv_current_state(4), 
      datad=>U_2_clk_cnt(14), datae=>U_2_clk_cnt(15), dataf=>U_2_divmsb(7));
   ix16055z60633 : arriav_lcell_comb
      generic map (lut_mask => X"fe00fc00fefefcfc") 
       port map ( combout=>nx16055z1, dataa=>U_4_U_0_rcv_current_state(1), 
      datab=>U_4_U_0_rcv_current_state(3), datac=>
      U_4_U_0_rcv_current_state(4), datad=>U_2_clk_cnt(15), datae=>nx16055z2, 
      dataf=>nx17052z2);
   ix17052z60633 : arriav_lcell_comb
      generic map (lut_mask => X"3030ff3030303030") 
       port map ( combout=>nx17052z1, datab=>sin_int, datac=>
      U_4_U_0_rcv_current_state(2), datad=>U_4_U_0_rcv_current_state(3), 
      datae=>U_2_clk_cnt(15), dataf=>nx17052z2);
   ix20043z60633 : arriav_lcell_comb
      generic map (lut_mask => X"000000000f0fff0f") 
       port map ( combout=>nx20043z1, datac=>sin_int, datad=>nx64054z4, 
      datae=>U_4_U_0_rcv_current_state(2), dataf=>U_4_done_rcving);
   ix3309z60633 : arriav_lcell_comb
      generic map (lut_mask => X"f000fc00f0f0fcfc") 
       port map ( combout=>nx3309z1, datab=>U_4_U_0_xmit_current_state(3), 
      datac=>U_4_U_0_xmit_current_state(5), datad=>U_2_clk_cnt(15), datae=>
      nx318z2, dataf=>nx17052z2);
   ix1315z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0000a8fc000000a8") 
       port map ( combout=>nx1315z1, dataa=>nx19046z2, datab=>
      U_4_U_0_xmit_current_state(2), datac=>U_4_U_0_xmit_current_state(3), 
      datad=>U_2_clk_cnt(14), datae=>U_2_clk_cnt(15), dataf=>U_2_divmsb(7));
   ix318z60633 : arriav_lcell_comb
      generic map (lut_mask => X"fe00ee00fefeeeee") 
       port map ( combout=>nx318z1, dataa=>U_4_U_0_xmit_current_state(1), 
      datab=>U_4_U_0_xmit_current_state(2), datac=>
      U_4_U_0_xmit_current_state(3), datad=>U_2_clk_cnt(15), datae=>nx318z2, 
      dataf=>nx17052z2);
   ix64857z60633 : arriav_lcell_comb
      generic map (lut_mask => X"33f300f033330000") 
       port map ( combout=>nx64857z1, datab=>nx64857z2, datac=>
      U_4_U_0_xmit_current_state(1), datad=>U_2_clk_cnt(15), datae=>
      start_xmit, dataf=>nx17052z2);
   ix63860z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0000ffff0000ff00") 
       port map ( combout=>nx63860z1, datad=>nx64857z2, datae=>
      U_4_U_0_xmit_current_state(4), dataf=>start_xmit);
   ix13064z60633 : arriav_lcell_comb
      generic map (lut_mask => X"cc00ccc0ccc0cccc") 
       port map ( combout=>nx13064z1, datab=>U_4_U_0_rcv_current_state(6), 
      datac=>U_2_clk_cnt(14), datad=>U_2_clk_cnt(15), datae=>U_2_divmsb(7), 
      dataf=>nx19046z2);
   ix18049z60633 : arriav_lcell_comb
      generic map (lut_mask => X"000000000000ffff") 
       port map ( combout=>nx18049z1, datae=>sin_int, dataf=>nx64054z4);
   ix4306z60633 : arriav_lcell_comb
      generic map (lut_mask => X"00cc000c000c0000") 
       port map ( combout=>nx4306z1, datab=>U_4_U_0_xmit_current_state(5), 
      datac=>U_2_clk_cnt(14), datad=>U_2_clk_cnt(15), datae=>U_2_divmsb(7), 
      dataf=>nx19046z2);
   ix16055z60634 : arriav_lcell_comb
      generic map (lut_mask => X"00ffffffffffffff") 
       port map ( combout=>nx16055z2, datad=>U_4_rcv_bit_cnt(0), datae=>
      U_4_rcv_bit_cnt(1), dataf=>U_4_rcv_bit_cnt(2));
   ix318z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffffffffffffff00") 
       port map ( combout=>nx318z2, datad=>U_4_U_0_xmit_bit_cnt(0), datae=>
      U_4_U_0_xmit_bit_cnt(1), dataf=>U_4_U_0_xmit_bit_cnt(2));
   ix3650z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0000ffff0000ff00") 
       port map ( combout=>nx3650z1, datad=>U_4_U_0_xmit_current_state(1), 
      datae=>U_4_U_0_xmit_current_state(4), dataf=>enable_xmit_clk);
   ix36190z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffff00ff00ffffff") 
       port map ( combout=>
      NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_1_dup_49, datad=>
      nx64054z4, datae=>U_4_rcv_bit_cnt(0), dataf=>U_4_rcv_bit_cnt(1));
   ix37187z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ff0f0f0f0fffffff") 
       port map ( combout=>
      NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_2_dup_50, datac=>
      nx64054z4, datad=>U_4_rcv_bit_cnt(0), datae=>U_4_rcv_bit_cnt(1), dataf
      =>U_4_rcv_bit_cnt(2));
   ix48350z60634 : arriav_lcell_comb
      generic map (lut_mask => X"00ffffffff000000") 
       port map ( combout=>U_4_U_0_modgen_counter_xmit_bit_cnt_inc_d_2, 
      datad=>U_4_U_0_xmit_bit_cnt(0), datae=>U_4_U_0_xmit_bit_cnt(1), dataf
      =>U_4_U_0_xmit_bit_cnt(2));
   ix21277z60633 : arriav_lcell_comb
      generic map (lut_mask => X"0f00cf00cf00ff00") 
       port map ( combout=>nx21277z1, datab=>U_2_clk_cnt(15), datac=>
      U_2_rtlcn516(0), datad=>nx64054z3, datae=>U_2_rtlc5n88(15), dataf=>
      nx21277z20);
   ix46356z60633 : arriav_lcell_comb
      generic map (lut_mask => X"fc000cc0fc00fc00") 
       port map ( combout=>nx46356z1, datab=>nx64857z2, datac=>
      U_4_U_0_xmit_current_state(2), datad=>U_4_U_0_xmit_bit_cnt(0), datae=>
      U_2_clk_cnt(15), dataf=>nx17052z2);
   ix47353z60633 : arriav_lcell_comb
      generic map (lut_mask => X"ee002a80ee00ee00") 
       port map ( combout=>nx47353z1, dataa=>nx64857z2, datab=>
      U_4_U_0_xmit_current_state(2), datac=>U_4_U_0_xmit_bit_cnt(0), datad=>
      U_4_U_0_xmit_bit_cnt(1), datae=>U_2_clk_cnt(15), dataf=>nx17052z2);
   ix48350z60633 : arriav_lcell_comb
      generic map (lut_mask => X"e0a8e020e0e0e0e0") 
       port map ( combout=>nx48350z1, dataa=>nx64857z2, datab=>
      U_4_U_0_xmit_current_state(2), datac=>U_4_U_0_xmit_bit_cnt(2), datad=>
      U_2_clk_cnt(15), datae=>U_4_U_0_modgen_counter_xmit_bit_cnt_inc_d_2, 
      dataf=>nx17052z2);
   ix35193z60633 : arriav_lcell_comb
      generic map (lut_mask => X"28e0e0e02828e0e0") 
       port map ( combout=>nx35193z1, dataa=>nx64054z4, datab=>
      U_4_U_0_rcv_current_state(1), datac=>U_4_rcv_bit_cnt(0), datad=>
      U_2_clk_cnt(15), datae=>nx16055z2, dataf=>nx17052z2);
   ix19046z60639 : arriav_lcell_comb
      generic map (lut_mask => X"0000ffffffff0000") 
       port map ( combout=>nx19046z7, datae=>U_2_clk_cnt(4), dataf=>
      U_2_divlsb(5));
   ix19046z60640 : arriav_lcell_comb
      generic map (lut_mask => X"0000ffffffff0000") 
       port map ( combout=>nx19046z8, datae=>U_2_clk_cnt(7), dataf=>
      U_2_divmsb(0));
   ix19046z60641 : arriav_lcell_comb
      generic map (lut_mask => X"0000ffffffff0000") 
       port map ( combout=>nx19046z9, datae=>U_2_clk_cnt(10), dataf=>
      U_2_divmsb(3));
   ix17052z60635 : arriav_lcell_comb
      generic map (lut_mask => X"0000ffffffff0000") 
       port map ( combout=>nx17052z3, datae=>U_2_clk_cnt(13), dataf=>
      U_2_divmsb(6));
   ix19046z60638 : arriav_lcell_comb
      generic map (lut_mask => X"bf3f2f0f0b030200") 
       port map ( combout=>nx19046z6, dataa=>nx512z15, datab=>U_2_clk_cnt(1), 
      datac=>U_2_clk_cnt(2), datad=>U_2_divlsb(1), datae=>U_2_divlsb(2), 
      dataf=>U_2_divlsb(3));
   ix19046z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ff3f0f033f0f0300") 
       port map ( combout=>nx19046z2, datab=>U_2_clk_cnt(12), datac=>
      U_2_clk_cnt(13), datad=>U_2_divmsb(5), datae=>U_2_divmsb(6), dataf=>
      nx19046z3);
   ix21277z60657 : arriav_lcell_comb
      generic map (lut_mask => X"bf3f2f0f0b030200") 
       port map ( combout=>nx21277z38, dataa=>nx512z15, datab=>
      U_2_clk_cnt(1), datac=>U_2_clk_cnt(2), datad=>U_2_rtlc5n88(0), datae=>
      U_2_rtlc5n88(1), dataf=>U_2_rtlc5n88(2));
   ix21277z60656 : arriav_lcell_comb
      generic map (lut_mask => X"ff3f0f033f0f0300") 
       port map ( combout=>nx21277z35, datab=>U_2_clk_cnt(3), datac=>
      U_2_clk_cnt(4), datad=>U_2_rtlc5n88(3), datae=>U_2_rtlc5n88(4), dataf
      =>nx21277z38);
   ix21277z60655 : arriav_lcell_comb
      generic map (lut_mask => X"ff3f0f033f0f0300") 
       port map ( combout=>nx21277z32, datab=>U_2_clk_cnt(5), datac=>
      U_2_clk_cnt(6), datad=>U_2_rtlc5n88(5), datae=>U_2_rtlc5n88(6), dataf
      =>nx21277z35);
   ix21277z60654 : arriav_lcell_comb
      generic map (lut_mask => X"ff3f0f033f0f0300") 
       port map ( combout=>nx21277z29, datab=>U_2_clk_cnt(7), datac=>
      U_2_clk_cnt(8), datad=>U_2_rtlc5n88(7), datae=>U_2_rtlc5n88(8), dataf
      =>nx21277z32);
   ix21277z60653 : arriav_lcell_comb
      generic map (lut_mask => X"ff3f0f033f0f0300") 
       port map ( combout=>nx21277z26, datab=>U_2_clk_cnt(9), datac=>
      U_2_clk_cnt(10), datad=>U_2_rtlc5n88(9), datae=>U_2_rtlc5n88(10), 
      dataf=>nx21277z29);
   ix21277z60652 : arriav_lcell_comb
      generic map (lut_mask => X"ff3f0f033f0f0300") 
       port map ( combout=>nx21277z23, datab=>U_2_clk_cnt(11), datac=>
      U_2_clk_cnt(12), datad=>U_2_rtlc5n88(11), datae=>U_2_rtlc5n88(12), 
      dataf=>nx21277z26);
   ix21277z60651 : arriav_lcell_comb
      generic map (lut_mask => X"ff3f0f033f0f0300") 
       port map ( combout=>nx21277z20, datab=>U_2_clk_cnt(13), datac=>
      U_2_clk_cnt(14), datad=>U_2_rtlc5n88(13), datae=>U_2_rtlc5n88(14), 
      dataf=>nx21277z23);
   ix35948z60634 : arriav_lcell_comb
      generic map (lut_mask => X"ffffff0000ff0000") 
       port map ( combout=>nx35948z2, datad=>U_4_U_0_xmit_bit_cnt(1), datae
      =>U_4_xmitdt(1), dataf=>U_4_xmitdt(3));
   ix35948z60636 : arriav_lcell_comb
      generic map (lut_mask => X"ffffff0f0fff0f0f") 
       port map ( combout=>nx35948z4, datac=>U_4_U_0_xmit_bit_cnt(0), datad
      =>U_4_U_0_xmit_bit_cnt(1), datae=>U_4_xmitdt(5), dataf=>U_4_xmitdt(7)
   );
   U_1_U_0_reg_current_state_4 : dffeas port map ( q=>start_xmit, d=>
      nx6744z1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_1_U_0_reg_current_state_3 : dffeas port map ( q=>enable_write, d=>
      nx7741z1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_1_U_0_reg_current_state_2 : dffeas port map ( q=>clear_flags, d=>
      nx8738z1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_1_U_0_reg_current_state_1 : dffeas port map ( q=>
      U_1_U_0_current_state(1), d=>nx9735z1, clk=>clk_int, clrn=>rst_int, 
      prn=>U_2_PWR);
   U_1_U_0_reg_current_state_0 : dffeas port map ( q=>nx7741z2, d=>
      NOT_cs_int, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divmsb_7 : dffeas port map ( q=>U_2_divmsb(7), d=>datin_int(7), 
      clk=>clk_int, ena=>nx9427z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divmsb_6 : dffeas port map ( q=>U_2_divmsb(6), d=>datin_int(6), 
      clk=>clk_int, ena=>nx9427z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divmsb_5 : dffeas port map ( q=>U_2_divmsb(5), d=>datin_int(5), 
      clk=>clk_int, ena=>nx9427z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divmsb_4 : dffeas port map ( q=>U_2_divmsb(4), d=>datin_int(4), 
      clk=>clk_int, ena=>nx9427z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divmsb_3 : dffeas port map ( q=>U_2_divmsb(3), d=>datin_int(3), 
      clk=>clk_int, ena=>nx9427z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divmsb_2 : dffeas port map ( q=>U_2_divmsb(2), d=>datin_int(2), 
      clk=>clk_int, ena=>nx9427z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divmsb_1 : dffeas port map ( q=>U_2_divmsb(1), d=>datin_int(1), 
      clk=>clk_int, ena=>nx9427z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divmsb_0 : dffeas port map ( q=>U_2_divmsb(0), d=>datin_int(0), 
      clk=>clk_int, ena=>nx9427z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divlsb_7 : dffeas port map ( q=>U_2_divlsb(7), d=>datin_int(7), 
      clk=>clk_int, ena=>nx17214z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divlsb_6 : dffeas port map ( q=>U_2_divlsb(6), d=>datin_int(6), 
      clk=>clk_int, ena=>nx17214z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divlsb_5 : dffeas port map ( q=>U_2_divlsb(5), d=>datin_int(5), 
      clk=>clk_int, ena=>nx17214z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divlsb_4 : dffeas port map ( q=>U_2_divlsb(4), d=>datin_int(4), 
      clk=>clk_int, ena=>nx17214z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divlsb_3 : dffeas port map ( q=>U_2_divlsb(3), d=>datin_int(3), 
      clk=>clk_int, ena=>nx17214z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divlsb_2 : dffeas port map ( q=>U_2_divlsb(2), d=>datin_int(2), 
      clk=>clk_int, ena=>nx17214z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divlsb_1 : dffeas port map ( q=>U_2_divlsb(1), d=>datin_int(1), 
      clk=>clk_int, ena=>nx17214z1, clrn=>rst_int, prn=>U_2_PWR);
   U_2_reg_divlsb_0 : dffeas port map ( q=>U_2_divlsb(0), d=>datin_int(0), 
      clk=>clk_int, ena=>nx17214z1, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_xmitdt_7 : dffeas port map ( q=>U_4_xmitdt(7), d=>datin_int(7), 
      clk=>clk_int, ena=>nx19766z1, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_xmitdt_6 : dffeas port map ( q=>U_4_xmitdt(6), d=>datin_int(6), 
      clk=>clk_int, ena=>nx19766z1, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_xmitdt_5 : dffeas port map ( q=>U_4_xmitdt(5), d=>datin_int(5), 
      clk=>clk_int, ena=>nx19766z1, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_xmitdt_4 : dffeas port map ( q=>U_4_xmitdt(4), d=>datin_int(4), 
      clk=>clk_int, ena=>nx19766z1, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_xmitdt_3 : dffeas port map ( q=>U_4_xmitdt(3), d=>datin_int(3), 
      clk=>clk_int, ena=>nx19766z1, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_xmitdt_2 : dffeas port map ( q=>U_4_xmitdt(2), d=>datin_int(2), 
      clk=>clk_int, ena=>nx19766z1, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_xmitdt_1 : dffeas port map ( q=>U_4_xmitdt(1), d=>datin_int(1), 
      clk=>clk_int, ena=>nx19766z1, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_xmitdt_0 : dffeas port map ( q=>U_4_xmitdt(0), d=>datin_int(0), 
      clk=>clk_int, ena=>nx19766z1, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_recvdt_7 : dffeas port map ( q=>U_4_recvdt(7), d=>nx30972z1, clk
      =>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_recvdt_6 : dffeas port map ( q=>U_4_recvdt(6), d=>nx29975z1, clk
      =>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_recvdt_5 : dffeas port map ( q=>U_4_recvdt(5), d=>nx28978z1, clk
      =>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_recvdt_4 : dffeas port map ( q=>U_4_recvdt(4), d=>nx27981z1, clk
      =>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_recvdt_3 : dffeas port map ( q=>U_4_recvdt(3), d=>nx26984z1, clk
      =>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_recvdt_2 : dffeas port map ( q=>U_4_recvdt(2), d=>nx25987z1, clk
      =>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_recvdt_1 : dffeas port map ( q=>U_4_recvdt(1), d=>nx24990z1, clk
      =>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_reg_recvdt_0 : dffeas port map ( q=>U_4_recvdt(0), d=>nx23993z1, clk
      =>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_U_1_reg_rcving_reg : dffeas port map ( q=>U_4_status(1), d=>
      U_4_U_1_rcving_reg_3n3ss1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_U_1_reg_xmitting_reg : dffeas port map ( q=>U_4_status(0), d=>
      U_4_U_1_xmitting_reg_3n3ss1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR
   );
   U_4_U_1_reg_done_rcving_reg : dffeas port map ( q=>U_4_status(3), d=>
      U_4_U_1_done_rcving_reg_3n3ss1, clk=>clk_int, clrn=>rst_int, prn=>
      U_2_PWR);
   U_4_U_1_reg_done_xmitting_reg : dffeas port map ( q=>U_4_status(2), d=>
      nx48030z1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_rcv_current_state_7 : dffeas port map ( q=>U_4_done_rcving, d
      =>nx13064z1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_rcv_current_state_6 : dffeas port map ( q=>
      U_4_U_0_rcv_current_state(6), d=>nx14061z1, clk=>clk_int, clrn=>
      rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_rcv_current_state_5 : dffeas port map ( q=>
      U_4_U_0_rcv_current_state(5), d=>nx15058z1, clk=>clk_int, clrn=>
      rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_rcv_current_state_4 : dffeas port map ( q=>
      U_4_U_0_rcv_current_state(4), d=>nx16055z1, clk=>clk_int, clrn=>
      rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_rcv_current_state_3 : dffeas port map ( q=>
      U_4_U_0_rcv_current_state(3), d=>nx17052z1, clk=>clk_int, clrn=>
      rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_rcv_current_state_2 : dffeas port map ( q=>
      U_4_U_0_rcv_current_state(2), d=>nx18049z1, clk=>clk_int, clrn=>
      rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_rcv_current_state_1 : dffeas port map ( q=>
      U_4_U_0_rcv_current_state(1), d=>nx19046z1, clk=>clk_int, clrn=>
      rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_rcv_current_state_0 : dffeas port map ( q=>nx64054z4, d=>
      nx20043z1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_xmit_current_state_6 : dffeas port map ( q=>U_4_done_xmitting, 
      d=>nx4306z1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_xmit_current_state_5 : dffeas port map ( q=>
      U_4_U_0_xmit_current_state(5), d=>nx3309z1, clk=>clk_int, clrn=>
      rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_xmit_current_state_4 : dffeas port map ( q=>
      U_4_U_0_xmit_current_state(4), d=>U_4_done_xmitting, clk=>clk_int, 
      clrn=>rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_xmit_current_state_3 : dffeas port map ( q=>
      U_4_U_0_xmit_current_state(3), d=>nx1315z1, clk=>clk_int, clrn=>
      rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_xmit_current_state_2 : dffeas port map ( q=>
      U_4_U_0_xmit_current_state(2), d=>nx318z1, clk=>clk_int, clrn=>rst_int, 
      prn=>U_2_PWR);
   U_4_U_0_reg_xmit_current_state_1 : dffeas port map ( q=>
      U_4_U_0_xmit_current_state(1), d=>nx64857z1, clk=>clk_int, clrn=>
      rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_xmit_current_state_0 : dffeas port map ( q=>nx64857z2, d=>
      nx63860z1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_sout_cld : dffeas port map ( q=>nx50810z1, d=>nx35948z1, clk
      =>clk_int, clrn=>rst_int, prn=>U_2_PWR);
   U_4_U_0_reg_enable_xmit_clk_cld : dffeas port map ( q=>enable_xmit_clk, d
      =>nx3650z1, clk=>clk_int, clrn=>rst_int, prn=>U_2_PWR);
end struct ;

