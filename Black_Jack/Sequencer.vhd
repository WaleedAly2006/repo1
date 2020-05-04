library ieee ;
use ieee.std_logic_1164.ALL ;
use ieee.std_logic_arith.ALL ;
use ieee.std_logic_unsigned.ALL ;

entity Sequencer is
  port(
    Reset      : in     std_logic ;
    Clock      : in     std_logic ;
    sequence1   : buffer Unsigned(5 downto 0) ;
    Enable     : in     std_logic ;
    Valid_Card : buffer std_logic ;
    High       : out    std_logic ) ;
end  Sequencer ;

ARCHITECTURE rtl OF Sequencer IS

signal Invalid_Card : std_logic ;
signal Next_Location : std_logic;
signal Invalid_Cards : Unsigned (1 downto 0);

BEGIN

PROCESS (Clock, reset)
BEGIN
   IF reset = '1' THEN
      sequence1	 <= (others => '0');
      Valid_Card <= '0';
   ELSIF (Clock'event AND Clock = '1') THEN
     IF (Enable = '1' or Invalid_Card = '1') THEN
      sequence1	 <= sequence1(4 DOWNTO 0) & NOT (sequence1(0) XOR sequence1(5));
     END IF;
     IF Enable = '1' THEN
       Valid_Card <= '0';
     ELSE
       IF (sequence1 >= 52) THEN
         Valid_Card <= '0';
       ELSE
         Valid_Card <= '1';
       END IF;
     END IF ;
   END IF;
END PROCESS;

PROCESS (Clock, reset)
BEGIN
   IF reset = '1' THEN   
     Invalid_Cards	 <= (others => '0');
   ELSIF (Clock'event AND Clock = '1') THEN
     IF Enable = '1' THEN   
       Invalid_Cards	 <= (others => '0');
     ELSE
	   IF Invalid_Card = '1' THEN
	     Invalid_Cards	 <= (others => '0');
       ELSE 
         IF Valid_Card = '0' THEN
	       Invalid_Cards	 <= Invalid_Cards + 1;
	     END IF;
	   END IF;
     END IF;
   END IF;
END PROCESS;

Invalid_Card <= '1' WHEN (Invalid_Cards = 2) ELSE '0' ;

High <= '1' ;

END  rtl ;


