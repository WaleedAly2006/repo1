library ieee ;
use ieee.std_logic_1164.ALL ;
use ieee.std_logic_arith.ALL ;
use ieee.std_logic_unsigned.ALL ;

entity Aces_Counter is
  port(
    Inc_Aces     : in     std_logic ;
    Dec_Aces     : in     std_logic ;
    Reset_Accums : in     std_logic ;
    Clock        : in     std_logic ;
    Aces_Eq11    : buffer std_logic_vector(2 downto 0) ;
    Reset        : in     std_logic ) ;
end  Aces_Counter ;

ARCHITECTURE rtl OF Aces_Counter IS

BEGIN
Counter: PROCESS (Clock, Reset)
BEGIN
	IF (Reset = '0') THEN
		Aces_Eq11 <= (others => '0');
	ELSIF (rising_edge(Clock)) THEN
	  IF (Reset_Accums = '1') THEN
	    Aces_Eq11 <= (others => '0');
	  ELSIF (Inc_Aces = '1') THEN
		Aces_Eq11 <= Aces_Eq11 + 1;
	  ELSIF (Dec_Aces = '1') THEN
		Aces_Eq11 <= Aces_Eq11 - 1;
	  ELSE
	    Aces_Eq11 <= Aces_Eq11;
	  END IF;
	END IF;
END PROCESS Counter;

END  rtl ;