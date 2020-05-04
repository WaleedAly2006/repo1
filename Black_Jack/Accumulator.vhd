library ieee ;
use ieee.std_logic_1164.ALL ;
use ieee.std_logic_arith.ALL ;
use ieee.std_logic_unsigned.ALL ;
use work.black_jack_package.all ;

entity Accumulator is
  port(
    Reset_Accums         : in     std_logic ;
    Acc_Total_Card_Value : in     std_logic ;
    Acc_Value_By_Tens    : in     std_logic ;
    Delt_Card_Value      : in     Unsigned(3 downto 0) ;
    Total_Card_Value     : buffer Unsigned(4 downto 0) ;
    Clock                : in     std_logic ;
    Reset                : in     std_logic ;
    Inc_Aces             : in     std_logic ;
    Dec_Aces             : in     std_logic ) ;
end  Accumulator ;

architecture rtl of Accumulator is

BEGIN
Counter: PROCESS (Clock, Reset)
BEGIN
	IF (Reset = '0') THEN
		Total_Card_Value <= (others => '0');
	ELSIF (rising_edge(Clock)) THEN
	  IF (Reset_Accums = '1') THEN
	    Total_Card_Value <= (others => '0');
	  ELSIF (Acc_Value_By_Tens = '1') THEN
		Total_Card_Value <= Total_Card_Value + 20;
	  ELSIF (Inc_Aces = '1') THEN
		Total_Card_Value <= Total_Card_Value + 11;
	  ELSIF (Acc_Total_Card_Value = '1') THEN
		Total_Card_Value <= Total_Card_Value + Delt_Card_Value;
	  ELSIF (Dec_Aces = '1') THEN
		Total_Card_Value <= Total_Card_Value - 10;
	  ELSE
	    Total_Card_Value <= Total_Card_Value;
	  END IF;
	END IF;
END PROCESS Counter;
end  rtl ;



