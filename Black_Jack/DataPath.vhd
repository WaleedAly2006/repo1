library ieee ;
use ieee.std_logic_1164.ALL ;
use ieee.std_logic_arith.ALL ;
use ieee.std_logic_unsigned.ALL ;

entity DataPath is
  generic(
    Stick_level : Integer := 16 ) ;
  port(
    Inc_Aces             : in     std_logic ;
    Dec_Aces             : in     std_logic ;
    Reset_Accums         : in     std_logic ;
    Clock                : in     std_logic ;
    Acc_Total_Card_Value : in     std_logic ;
    Acc_Value_By_Ten     : in     std_logic ;
    More_Than_Equal_22   : out    std_logic ;
    MT_Equal_Stick       : out    std_logic ;
    Aces_Count_As_11     : out    std_logic ;
    Reset                : in     std_logic ;
    Delt_Card_Value      : in     Unsigned(3 downto 0) ;
    Total_Value          : out    Unsigned(4 downto 0) ) ;
end  DataPath ;

architecture rtl of DataPath is


 component Aces_Counter
  port(
    Inc_Aces     : in     std_logic ;
    Dec_Aces     : in     std_logic ;
    Reset_Accums : in     std_logic ;
    Clock        : in     std_logic ;
    Aces_Eq11    : buffer std_logic_vector(2 downto 0) ;
    Reset        : in     std_logic ) ;
 end component ;
 component Accumulator
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
 end component ;
 signal Aces_Eq11        : std_logic_vector(2 downto 0) ;
 signal Total_Card_Value : Unsigned(4 downto 0) ;

begin

 AcesCounter: Aces_Counter
    port map(
      Inc_Aces => Inc_Aces,
      Dec_Aces => Dec_Aces,
      Reset_Accums => Reset_Accums,
      Clock => Clock,
      Aces_Eq11 => Aces_Eq11,
      Reset => Reset ) ;

 Acc: Accumulator
    port map(
      Reset_Accums => Reset_Accums,
      Acc_Total_Card_Value => Acc_Total_Card_Value,
      Acc_Value_By_Tens => Acc_Value_By_Ten,
      Delt_Card_Value => Delt_Card_Value,
      Total_Card_Value => Total_Card_Value,
      Clock => Clock,
      Reset => Reset,
      Inc_Aces => Inc_Aces,
      Dec_Aces => Dec_Aces ) ;

  Aces_As_11: process (Aces_Eq11, Clock, Reset)
  BEGIN
    IF (Reset = '0') THEN
      Aces_Count_As_11 <= '0'; 
	ELSIF (rising_edge(Clock)) THEN
	  IF (Aces_Eq11 > 0) THEN
	    Aces_Count_As_11 <= '1';
	  ELSE
	    Aces_Count_As_11 <= '0';
	  END IF;
	END IF;
  end process Aces_As_11 ;


  Greater_22: process (Total_Card_Value, Clock, Reset)
  BEGIN
    IF (Reset = '0') THEN
      More_Than_Equal_22 <= '0'; 
	ELSIF (rising_edge(Clock)) THEN
	  IF (Total_Card_Value >= 22) THEN
	    More_Than_Equal_22 <= '1';
	  ELSE
	    More_Than_Equal_22 <= '0';
	  END IF;
	END IF;
  end process Greater_22 ;


  Greater_Stick: process (Total_Card_Value, Clock, Reset)
  BEGIN
    IF (Reset = '0') THEN
      MT_Equal_Stick <= '0'; 
	ELSIF (rising_edge(Clock)) THEN
	  IF (Total_Card_Value >= Stick_level) THEN
	    MT_Equal_Stick <= '1';
	  ELSE
	    MT_Equal_Stick <= '0';
	  END IF;
	END IF;
  end process Greater_Stick ;

  pr0: process (Total_Card_Value)
  begin
    Total_Value <= Total_Card_Value;
  end process pr0 ;

end  rtl ;

