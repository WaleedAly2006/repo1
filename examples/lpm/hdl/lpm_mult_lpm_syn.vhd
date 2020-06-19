-- VHDL Entity lpm.lpm_mult.symbol
--
-- Created:
--          by - user.group (host.domain)
--          at - 09:12:45 02/18/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2003.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY lpm_mult IS
   GENERIC( 
      lpm_WIDTHA         : natural;
      lpm_WIDTHB         : natural;
      lpm_WIDTHS         : natural := 0;
      lpm_WIDTHP         : natural;
      lpm_REPRESENTATION : string  := "UNSIGNED";
      lpm_PIPELINE       : natural := 0;
      lpm_TYPE           : string  := "LPM_MULT";
      lpm_HINT           : string  := "UNUSED"
   );
   PORT( 
      aclr   : IN     std_logic                                := '0';
      clken  : IN     std_logic                                := '1';
      clock  : IN     std_logic                                := '0';
      dataa  : IN     std_logic_vector (lpm_WIDTHA-1 DOWNTO 0);
      datab  : IN     std_logic_vector (lpm_WIDTHB-1 DOWNTO 0);
      sum    : IN     std_logic_vector (lpm_WIDTHS-1 DOWNTO 0) := (OTHERS => '0');
      result : OUT    std_logic_vector (lpm_WIDTHP-1 DOWNTO 0)
   );

-- Declarations

END lpm_mult ;


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
architecture lpm_syn of lpm_mult is

type t_resulttmp IS ARRAY (0 to LPM_PIPELINE) of std_logic_vector(LPM_WIDTHP-1 downto 0);

begin

	process (CLOCK, ACLR, DATAA, DATAB, SUM)
	variable resulttmp : t_resulttmp;
    variable tmp_prod_ab : std_logic_vector(LPM_WIDTHA+LPM_WIDTHB downto 0);
    variable tmp_prod_s : std_logic_vector(LPM_WIDTHS downto 0);
    variable tmp_prod_p : std_logic_vector(LPM_WIDTHP-1 downto 0);
    variable tmp_use : integer;
	begin
		if LPM_PIPELINE >= 0 then

            if LPM_REPRESENTATION = "SIGNED" then
                tmp_prod_ab(LPM_WIDTHA+LPM_WIDTHB-1 downto 0) := signed(DATAA) * signed(DATAB);
                tmp_prod_ab(LPM_WIDTHA+LPM_WIDTHB) := tmp_prod_ab(LPM_WIDTHA+LPM_WIDTHB-1);
            elsif LPM_REPRESENTATION = "UNSIGNED" then
                tmp_prod_ab(LPM_WIDTHA+LPM_WIDTHB-1 downto 0) := unsigned(DATAA) * unsigned(DATAB);
                tmp_prod_ab(LPM_WIDTHA+LPM_WIDTHB) := '0';
            else
                ASSERT FALSE
                REPORT "Illegal LPM_REPRESENTATION property value for LPM_MULT!"
                SEVERITY ERROR;
            end if;
            tmp_use := 1; --AB
            if (LPM_WIDTHS > LPM_WIDTHA+LPM_WIDTHB) then
                if LPM_REPRESENTATION = "SIGNED" then
                    tmp_prod_s := (OTHERS => tmp_prod_ab(LPM_WIDTHA+LPM_WIDTHB));
                    tmp_prod_s(LPM_WIDTHA+LPM_WIDTHB downto 0) := tmp_prod_ab;
                    tmp_prod_s := signed(tmp_prod_s) + signed(SUM);
                    tmp_prod_p := (OTHERS => tmp_prod_s(LPM_WIDTHS));
                else
                    tmp_prod_s := (OTHERS => '0');
                    tmp_prod_s(LPM_WIDTHA+LPM_WIDTHB downto 0) := tmp_prod_ab;
                    tmp_prod_s := unsigned(tmp_prod_s) + unsigned(SUM);
                    tmp_prod_p := (OTHERS => '0');
                end if;
                tmp_use := 2; --S
            elsif (LPM_WIDTHS > 0) then
                if LPM_REPRESENTATION = "SIGNED" then
                    tmp_prod_ab := signed(tmp_prod_ab) + signed(SUM);
                    tmp_prod_p := (OTHERS => tmp_prod_ab(LPM_WIDTHA+LPM_WIDTHB));
                else
                    tmp_prod_ab := unsigned(tmp_prod_ab) + unsigned(SUM);
                    tmp_prod_p := (OTHERS => '0');
                end if;
            end if;

            if (tmp_use = 2) then --S
                if (LPM_WIDTHP > LPM_WIDTHS) then
                    tmp_prod_p(LPM_WIDTHS downto 0) := tmp_prod_s;
                elsif (LPM_WIDTHP = LPM_WIDTHS) then
                    tmp_prod_p := tmp_prod_s(LPM_WIDTHP-1 downto 0);
                else
                    tmp_prod_p := tmp_prod_s(LPM_WIDTHS-1 downto LPM_WIDTHS-LPM_WIDTHP);
                end if;
            else --AB
                if (LPM_WIDTHP > LPM_WIDTHA+LPM_WIDTHB) then
                    tmp_prod_p(LPM_WIDTHA+LPM_WIDTHB downto 0) := tmp_prod_ab(LPM_WIDTHA+LPM_WIDTHB downto 0);
                elsif (LPM_WIDTHP = LPM_WIDTHA+LPM_WIDTHB) then
                    tmp_prod_p := tmp_prod_ab(LPM_WIDTHP-1 downto 0);
                else
                    tmp_prod_p := tmp_prod_ab(LPM_WIDTHA+LPM_WIDTHB-1 downto LPM_WIDTHA+LPM_WIDTHB-LPM_WIDTHP);
                end if;
            end if;                

            resulttmp(LPM_PIPELINE) := tmp_prod_p;

			if LPM_PIPELINE > 0 then
				if ACLR = '1' then
					for i in 0 to LPM_PIPELINE loop
						resulttmp(i) := (OTHERS => '0');
					end loop;
                elsif CLOCK'event and CLOCK = '1' and CLKEN = '1' and now > 0 ns then
					resulttmp(0 to LPM_PIPELINE - 1) := resulttmp(1 to LPM_PIPELINE);
				end if;
			end if;
		end if;

		RESULT <= resulttmp(0);
	end process;

end lpm_syn;