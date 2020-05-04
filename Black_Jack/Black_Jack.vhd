library ieee ;
use ieee.std_logic_1164.ALL ;
use ieee.std_logic_arith.ALL ;
use ieee.std_logic_unsigned.ALL ;
use work.black_jack_package.all ;

entity Black_Jack is
  generic(
    Stick_level : Integer := 16 ) ;
  port(
    Game_On         : in     std_logic ;
    Card_Delt       : in     std_logic ;
    Delt_Card_Value : in     unsigned(3 downto 0) ;
    Draw            : out    std_logic ;
    Hold            : out    std_logic ;
    Bust            : out    std_logic ;
    Reset           : in     std_logic ;
    Clock           : in     std_logic ;
    Total_Value     : out    Unsigned(4 downto 0) ) ;
end  Black_Jack ;

architecture rtl of Black_Jack is


 component FSM_Control
  port(
    Draw                 : out    std_logic ;
    Hold                 : out    std_logic ;
    Bust                 : out    std_logic ;
    Inc_Aces             : out    std_logic ;
    Dec_Aces             : out    std_logic ;
    Reset_Accums         : out    std_logic ;
    Acc_Total_Card_Value : out    std_logic ;
    Acc_Total_Value_By10 : out    std_logic ;
    Game_On              : in     std_logic ;
    Card_Delt            : in     std_logic ;
    Delt_Card_Type       : in     TypeDeltCardType ;
    Aces_As11            : in     std_logic ;
    MT_Equal_Stick       : in     std_logic ;
    More_Than_Equal_22   : in     std_logic ;
    Clock                : in     std_logic ;
    Reset                : in     std_logic ) ;
 end component ;
 component DataPath
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
 end component ;
 signal Card_Type      : TypeDeltCardType ;
 signal Inc_Aces       : std_logic ;
 signal Dec_Aces       : std_logic ;
 signal Reset_Accs     : std_logic ;
 signal Acc_Total_Card : std_logic ;
 signal Acc_By10       : std_logic ;
 signal AcesAs11       : std_logic ;
 signal MTE16          : std_logic ;
 signal MTE22          : std_logic ;

begin

 StateMachine: FSM_Control
    port map(
      Draw => Draw,
      Hold => Hold,
      Bust => Bust,
      Inc_Aces => Inc_Aces,
      Dec_Aces => Dec_Aces,
      Reset_Accums => Reset_Accs,
      Acc_Total_Card_Value => Acc_Total_Card,
      Acc_Total_Value_By10 => Acc_By10,
      Game_On => Game_On,
      Card_Delt => Card_Delt,
      Delt_Card_Type => Card_Type,
      Aces_As11 => AcesAs11,
      MT_Equal_Stick => MTE16,
      More_Than_Equal_22 => MTE22,
      Clock => Clock,
      Reset => Reset ) ;

 Data: DataPath
    generic map(
      Stick_level => Stick_level )
    port map(
      Inc_Aces => Inc_Aces,
      Dec_Aces => Dec_Aces,
      Reset_Accums => Reset_Accs,
      Clock => Clock,
      Acc_Total_Card_Value => Acc_Total_Card,
      Acc_Value_By_Ten => Acc_By10,
      More_Than_Equal_22 => MTE22,
      MT_Equal_Stick => MTE16,
      Aces_Count_As_11 => AcesAs11,
      Reset => Reset,
      Delt_Card_Value => Delt_Card_Value,
      Total_Value => Total_Value ) ;

  convert_card: process (Delt_Card_Value)
  variable value : integer range 0 to 15;
  BEGIN
    value := conv_integer(Delt_Card_Value);
	CASE value is
		WHEN Ace => 
		  Card_Type <= Card_Type_Ace ;
		WHEN Jack | Queen | King =>
    	  Card_Type <= Card_Type_Pic ;
		WHEN OTHERS =>
		  Card_Type <= Card_Type_No2to10 ;
	END CASE;
  end process convert_card ;

end  rtl ;

