-- VHDL Entity lpm.lpm_constant.symbol
--
-- Created:
--          by - user.group (host.domain)
--          at - 09:12:43 02/18/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2003.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY lpm_constant IS
   GENERIC( 
      lpm_WIDTH    : natural;
      lpm_CVALUE   : natural;
      lpm_STRENGTH : string := "UNUSED";
      lpm_TYPE     : string := "LPM_CONSTANT";
      lpm_HINT     : string := "UNUSED"
   );
   PORT( 
      result : OUT    std_logic_vector (lpm_WIDTH-1 DOWNTO 0)
   );

-- Declarations

END lpm_constant ;


--------------------------------------------------------------------------
--   This VHDL file was developed by Altera Corporation.  It may be
-- freely copied and/or distributed at no cost.  Any persons using this
-- file for any purpose do so at their own risk, and are responsible for
-- the results of such use.  Altera Corporation does not guarantee that
-- this file is complete, correct, or fit for any particular purpose.
-- NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  This notice must
-- accompany any copy of this file.
--
--------------------------------------------------------------------------
-- LPM Synthesizable Models (Support string type generic)
-- These models are based on LPM version 220 (EIA-IS103 October 1998).
-------------------------------------------------------------------------
-- Version Quartus v1.1 (lpm 220)      Date 02/01/01
--------------------------------------------------------------------------
architecture lpm_syn of lpm_constant is
begin

	RESULT <= conv_std_logic_vector(LPM_CVALUE, LPM_WIDTH);

end lpm_syn;
