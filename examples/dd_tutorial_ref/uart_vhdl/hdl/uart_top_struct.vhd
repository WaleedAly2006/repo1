--
-- VHDL Entity UART.uart_top.symbol
--
-- Created:
--          by - user.group (host.domain)
--          at - 13:04:23 27/02/2001
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.0
--
-- hds interface_start
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY uart_top IS
   PORT( 
      -- 3-bit address bus
      addr     : IN     std_logic_vector (2 DOWNTO 0);
      clk      : IN     std_logic; -- 10 MHz clock
      cs       : IN     std_logic; -- chip select
      -- 8-bit data in bus from cpu
      data_in  : IN     std_logic_vector (7 DOWNTO 0);
      nrw      : IN     std_logic; -- read(0), write(1)
      rst      : IN     std_logic; -- reset(0)
      sin      : IN     std_logic; -- serial input
      -- 8-bit data out bus to cpu
      data_out : OUT    std_logic_vector (7 DOWNTO 0);
      int      : OUT    std_logic; -- interrupt (1)
      sout     : OUT    std_logic -- serial output
   );

-- Declarations

END uart_top ;

-- hds interface_end
--
-- VHDL Architecture UART.uart_top.struct
--
-- Created:
--          by - user.group (host.domain)
--          at - 13:04:23 27/02/2001
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.0
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY UART;

ARCHITECTURE struct OF uart_top IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL clear_flags     : std_logic;
   SIGNAL clk_div_en      : std_logic;
   SIGNAL clr_int_en      : std_logic;
   SIGNAL div_data        : std_logic_vector(7 DOWNTO 0);
   SIGNAL enable_rcv_clk  : std_logic;
   SIGNAL enable_write    : std_logic;
   SIGNAL enable_xmit_clk : std_logic;
   SIGNAL sample          : std_logic;
   SIGNAL ser_if_data     : std_logic_vector(7 DOWNTO 0);
   SIGNAL ser_if_select   : std_logic_vector(1 DOWNTO 0);
   SIGNAL start_xmit      : std_logic;
   SIGNAL xmitdt_en       : std_logic;


   -- Component Declarations
   COMPONENT address_decode
   PORT (
      addr          : IN     std_logic_vector (2 DOWNTO 0);
      clk           : IN     std_logic ;
      rst           : IN     std_logic ;
      clk_div_en    : OUT    std_logic ;
      clr_int_en    : OUT    std_logic ;
      ser_if_select : OUT    std_logic_vector (1 DOWNTO 0);
      xmitdt_en     : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT clock_divider
   PORT (
      addr            : IN     std_logic ;
      clk             : IN     std_logic ;
      clk_div_en      : IN     std_logic ;
      data_in         : IN     std_logic_vector (7 DOWNTO 0);
      enable_rcv_clk  : IN     std_logic ;
      enable_write    : IN     std_logic ;
      enable_xmit_clk : IN     std_logic ;
      rst             : IN     std_logic ;
      div_data        : OUT    std_logic_vector (7 DOWNTO 0);
      sample          : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT cpu_interface
   PORT (
      clk          : IN     std_logic ;
      clk_div_en   : IN     std_logic ;
      clr_int_en   : IN     std_logic ;
      cs           : IN     std_logic ;
      div_data     : IN     std_logic_vector (7 DOWNTO 0);
      nrw          : IN     std_logic ;
      rst          : IN     std_logic ;
      ser_if_data  : IN     std_logic_vector (7 DOWNTO 0);
      xmitdt_en    : IN     std_logic ;
      clear_flags  : OUT    std_logic ;
      data_out     : OUT    std_logic_vector (7 DOWNTO 0);
      enable_write : OUT    std_logic ;
      start_xmit   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT serial_interface
   PORT (
      clear_flags     : IN     std_logic ;
      clk             : IN     std_logic ;
      data_in         : IN     std_logic_vector (7 DOWNTO 0);
      enable_write    : IN     std_logic ;
      rst             : IN     std_logic ;
      sample          : IN     std_logic ;
      ser_if_select   : IN     std_logic_vector (1 DOWNTO 0);
      sin             : IN     std_logic ;
      start_xmit      : IN     std_logic ;
      xmitdt_en       : IN     std_logic ;
      enable_rcv_clk  : OUT    std_logic ;
      enable_xmit_clk : OUT    std_logic ;
      int             : OUT    std_logic ;
      ser_if_data     : OUT    std_logic_vector (7 DOWNTO 0);
      sout            : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : address_decode USE ENTITY UART.address_decode;
   FOR ALL : clock_divider USE ENTITY UART.clock_divider;
   FOR ALL : cpu_interface USE ENTITY UART.cpu_interface;
   FOR ALL : serial_interface USE ENTITY UART.serial_interface;
   -- pragma synthesis_on


BEGIN
   -- Instance port mappings.
   I3 : address_decode
      PORT MAP (
         addr          => addr,
         clk           => clk,
         rst           => rst,
         clk_div_en    => clk_div_en,
         clr_int_en    => clr_int_en,
         ser_if_select => ser_if_select,
         xmitdt_en     => xmitdt_en
      );
   I2 : clock_divider
      PORT MAP (
         addr            => addr(0),
         clk             => clk,
         clk_div_en      => clk_div_en,
         data_in         => data_in,
         enable_rcv_clk  => enable_rcv_clk,
         enable_write    => enable_write,
         enable_xmit_clk => enable_xmit_clk,
         rst             => rst,
         div_data        => div_data,
         sample          => sample
      );
   I1 : cpu_interface
      PORT MAP (
         clk          => clk,
         clk_div_en   => clk_div_en,
         clr_int_en   => clr_int_en,
         cs           => cs,
         div_data     => div_data,
         nrw          => nrw,
         rst          => rst,
         ser_if_data  => ser_if_data,
         xmitdt_en    => xmitdt_en,
         clear_flags  => clear_flags,
         data_out     => data_out,
         enable_write => enable_write,
         start_xmit   => start_xmit
      );
   I4 : serial_interface
      PORT MAP (
         clear_flags     => clear_flags,
         clk             => clk,
         data_in         => data_in,
         enable_write    => enable_write,
         rst             => rst,
         sample          => sample,
         ser_if_select   => ser_if_select,
         sin             => sin,
         start_xmit      => start_xmit,
         xmitdt_en       => xmitdt_en,
         enable_rcv_clk  => enable_rcv_clk,
         enable_xmit_clk => enable_xmit_clk,
         int             => int,
         ser_if_data     => ser_if_data,
         sout            => sout
      );

END struct;
