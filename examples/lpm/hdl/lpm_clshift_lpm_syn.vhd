-- VHDL Entity lpm.lpm_clshift.symbol
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

ENTITY lpm_clshift IS
   GENERIC( 
      lpm_WIDTH     : natural;
      lpm_WIDTHDIST : natural;
      lpm_SHIFTTYPE : string := "LOGICAL";
      lpm_TYPE      : string := "LPM_CLSHIFT";
      lpm_HINT      : string := "UNUSED"
   );
   PORT( 
      data      : IN     std_logic_vector (lpm_WIDTH-1 DOWNTO 0);
      direction : IN     std_logic  := '0';
      distance  : IN     std_logic_vector (lpm_WIDTHDIST-1 DOWNTO 0);
      overflow  : OUT    std_logic;
      result    : OUT    std_logic_vector (lpm_WIDTH-1 DOWNTO 0);
      underflow : OUT    std_logic
   );

-- Declarations

END lpm_clshift ;


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
architecture lpm_syn of lpm_clshift is

signal IRESULT : std_logic_vector(LPM_WIDTH-1 downto 0);

begin

	process(DATA, DISTANCE, DIRECTION)
    variable tmpdata : std_logic_vector(LPM_WIDTH-1 downto 0);
    variable tmpdist : integer;
	begin
        if LPM_SHIFTTYPE = "ARITHMETIC" or LPM_SHIFTTYPE = "LOGICAL" then
            tmpdata := conv_std_logic_vector(unsigned(DATA), LPM_WIDTH);
            tmpdist := conv_integer(unsigned(DISTANCE));
            for i in LPM_WIDTH-1 downto 0 loop
                if DIRECTION = '0' then
                    if i >= tmpdist then
                        IRESULT(i) <= tmpdata(i-tmpdist);
                    else
                        IRESULT(i) <= '0';
                    end if;
                elsif DIRECTION = '1' then
                    if i+tmpdist < LPM_WIDTH then
                        IRESULT(i) <= tmpdata(i+tmpdist);
                    elsif LPM_SHIFTTYPE = "ARITHMETIC" then
                        IRESULT(i) <= DATA(LPM_WIDTH-1);
                    else
                        IRESULT(i) <= '0';
                    end if;
                end if;
            end loop;
		elsif LPM_SHIFTTYPE = "ROTATE" then
            tmpdata := conv_std_logic_vector(unsigned(DATA), LPM_WIDTH);
            tmpdist := conv_integer(unsigned(DISTANCE)) mod LPM_WIDTH;
            for i in LPM_WIDTH-1 downto 0 loop
                if DIRECTION = '0' then
                    if i >= tmpdist then
                        IRESULT(i) <= tmpdata(i-tmpdist);
                    else
                        IRESULT(i) <= tmpdata(i+LPM_WIDTH-tmpdist);
                    end if;
                elsif DIRECTION = '1' then
                    if i+tmpdist < LPM_WIDTH then
                        IRESULT(i) <= tmpdata(i+tmpdist);
                    else
                        IRESULT(i) <= tmpdata(i-LPM_WIDTH+tmpdist);
                    end if;
                end if;
            end loop;
        else
            ASSERT FALSE
            REPORT "Illegal LPM_SHIFTTYPE property value for LPM_CLSHIFT!"
            SEVERITY ERROR;
		end if;
	end process;

    process(DATA, DISTANCE, DIRECTION, IRESULT)
    variable neg_one : signed(LPM_WIDTH-1 downto 0) := (OTHERS => '1');
    variable tmpdata : std_logic_vector(LPM_WIDTH-1 downto 0);
    variable tmpdist : integer;
    variable msb_cnt, lsb_cnt : integer := 0;
    variable sgn_bit : std_logic;
	begin
        tmpdata := conv_std_logic_vector(unsigned(DATA), LPM_WIDTH);
        tmpdist := conv_integer(DISTANCE);

        OVERFLOW <= '0';
        UNDERFLOW <= '0';

        if (tmpdist /= 0 and tmpdata /= 0) then
            if LPM_SHIFTTYPE = "ROTATE" then
                OVERFLOW <= 'U';
                UNDERFLOW <= 'U';
            else
                if (tmpdist < LPM_WIDTH) then
                    if LPM_SHIFTTYPE = "LOGICAL" then
                        msb_cnt := 0;
                        while (msb_cnt < LPM_WIDTH) and (tmpdata(LPM_WIDTH-msb_cnt-1) = '0') loop
                            msb_cnt := msb_cnt + 1;
                        end loop;

                        if ((tmpdist > msb_cnt) and (DIRECTION = '0')) then
                            OVERFLOW <= '1';
                        elsif ((tmpdist + msb_cnt >= LPM_WIDTH) and (DIRECTION = '1')) then
                            UNDERFLOW <= '1';
                        end if;
                    elsif LPM_SHIFTTYPE = "ARITHMETIC" then
                        sgn_bit := '0';
                        if (tmpdata(LPM_WIDTH-1) = '1') then
                            sgn_bit := '1';
                        end if;

                        msb_cnt := 0;
                        while (msb_cnt < LPM_WIDTH) and (tmpdata(LPM_WIDTH-msb_cnt-1) = sgn_bit) loop
                            msb_cnt := msb_cnt + 1;
                        end loop;

                        lsb_cnt := 0;
                        while (lsb_cnt < LPM_WIDTH) and (tmpdata(lsb_cnt) = '0') loop
                            lsb_cnt := lsb_cnt + 1;
                        end loop;

                        if (DIRECTION = '1') then         -- shift right
                            if (tmpdata(LPM_WIDTH-1) = '1') then  -- negative
                                --Use the following line if 1110 asr 1 yields NO underflow is desired.
                                --if (msb_cnt + tmpdist > LPM_WIDTH) or ((msb_cnt + tmpdist = LPM_WIDTH) and (tmpdist > lsb_cnt)) then
                                -- SPR76524 comments/replaces out the line below
                                -- if (msb_cnt + tmpdist > LPM_WIDTH) or ((msb_cnt + tmpdist = LPM_WIDTH) and (tmpdist >= lsb_cnt)) then
                                if (msb_cnt + tmpdist >= LPM_WIDTH) and (msb_cnt /= LPM_WIDTH) then
                                    UNDERFLOW <= '1';
                                end if;
                            else  -- non-neg
                                -- SPR76524 comments/replaces out the line below
                                -- if (msb_cnt + tmpdist >= LPM_WIDTH) then
                                if (msb_cnt + tmpdist >= LPM_WIDTH) and (msb_cnt /= LPM_WIDTH) then
                                    UNDERFLOW <= '1';
                                end if;
                            end if;
                        elsif (DIRECTION = '0') then      -- shift left
                            if (tmpdata(LPM_WIDTH-1) = '1') then -- negative
                                if ((signed(tmpdata) /= neg_one) and (tmpdist >= LPM_WIDTH)) or (tmpdist >= msb_cnt) then
                                    OVERFLOW <= '1';
                                end if;
                            else  -- non-neg
                                if ((tmpdata /= 0) and (tmpdist >= LPM_WIDTH-1)) or (tmpdist >= msb_cnt) then
                                    OVERFLOW <= '1';
                                end if;
                            end if;
                        end if;
                    end if;
                else
                    if DIRECTION = '0' then
                        OVERFLOW <= '1';
                    elsif DIRECTION = '1' then
                        UNDERFLOW <= '1';
                    end if;
                end if;  -- tmpdist < LPM_WIDTH
            end if;  -- LPM_SHIFTTYPE = "ROTATE"
        end if;  -- tmpdist /= 0 and tmpdata /= 0
	end process;

	RESULT <= IRESULT;

end lpm_syn;
