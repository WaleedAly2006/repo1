--
-- VHDL Entity UART.address_decode.interface
--
-- Created:
--          by - user.group (host.domain)
--          at - 17:25:35 12/06/2001
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5
--
-- hds interface_start
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY address_decode IS
   PORT( 
      addr          : IN     std_logic_vector (2 DOWNTO 0);
      clk           : IN     std_logic;
      rst           : IN     std_logic;
      clk_div_en    : OUT    std_logic;
      clr_int_en    : OUT    std_logic;
      ser_if_select : OUT    std_logic_vector (1 DOWNTO 0);
      xmitdt_en     : OUT    std_logic
   );

-- Declarations

END address_decode ;

-- hds interface_end
--
-- VHDL Architecture UART.address_decode.tbl
--
-- Created:
--          by - user.group (host.domain)
--          at - 17:25:35 12/06/2001
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
ARCHITECTURE tbl OF address_decode IS
   
      -- Architecture declarations
    

BEGIN

   ---------------------------------------------------------------------------
   truth_process: PROCESS(addr)
   ---------------------------------------------------------------------------
   BEGIN

      -- Global Actions
      clk_div_en <= '0';
      xmitdt_en <= '0';
      clr_int_en <= '0';
      ser_if_select <= "11";

      -- Block 1
      CASE addr IS
      WHEN "000" =>
         clk_div_en <= '1';
      WHEN "001" =>
         clk_div_en <= '1';
      WHEN "100" =>
         xmitdt_en <= '1';
         ser_if_select <= addr(1 downto 0);
      WHEN "101" =>
         ser_if_select <= addr(1 downto 0);
      WHEN "110" =>
         ser_if_select <= addr(1 downto 0);
      WHEN "111" =>
         clr_int_en <= '1';
      WHEN OTHERS =>
         clk_div_en <= '0';
         xmitdt_en <= '0';
         ser_if_select <= "11";
         clr_int_en <= '0';
      END CASE;

   END PROCESS truth_process;

-- Architecture concurrent statements
 

END tbl;
