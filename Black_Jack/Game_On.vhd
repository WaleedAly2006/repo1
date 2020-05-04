library ieee ;
use ieee.std_logic_1164.ALL ;
use ieee.std_logic_arith.ALL ;
use ieee.std_logic_unsigned.ALL ;

entity Game_On is
  port(
    Clock         : in     std_logic ;
    Input_Address : in     Std_Logic_Vector(5 downto 0) ;
    Input_Data    : in     Std_Logic_Vector(5 downto 0) ;
    Write         : in     std_logic ;
    Bust          : out    std_logic ;
    Hold          : out    std_logic ;
    Draw          : out    std_logic ;
    Reset         : in     std_logic ;
    Go            : in     std_logic ;
    Card_Delt     : out    Std_Logic_Vector(5 downto 0) ;
    Total_Value   : out    Std_Logic_Vector(4 downto 0) ;
    Valid_Card    : out    std_logic ;
    Player        : out    std_logic ;
    Winner        : out    std_logic ;
    WinStrobe   : out    std_logic) ;
end  Game_On ;

architecture Graphical of Game_On is


 component Black_Jack
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
 end component ;
 component Dealer
  port(
    Clock          : in     std_logic ; -- Clock
    Input_Address  : in     Unsigned(5 downto 0) ;
    Input_Data     : in     Unsigned(5 downto 0) ;
    Write          : in     std_logic ;
    Output_Address : in     Unsigned(5 downto 0) ;
    Output_Data    : out    Unsigned(5 downto 0) ;
    Game_On        : in     std_logic ) ;
 end component ;
 component Sequencer
  port(
    Reset      : in     std_logic ;
    Clock      : in     std_logic ;
    sequence1   : out Unsigned(5 downto 0) ;
    Enable     : in     std_logic ;
    Valid_Card : out std_logic ;
    High       : out    std_logic ) ;
 end component ;
 component winner_calc
  port(
    Reset       : in     std_logic ;
    Clock       : in     std_logic ;
    Game_On     : in     std_logic ;
    Total_Value : in     Unsigned(4 downto 0) ;
    Hold        : in     std_logic ;
    Bust        : in     std_logic ;
    Player      : out    std_logic ;
    Winner      : out    std_logic ;
    WinStrobe   : out    std_logic) ;
 end component ;
 signal Net_4          : std_logic ;
 signal Net_5          : std_logic ;
 signal Net_6          : std_logic ;
 signal Net_7          : std_logic ;
 signal Card_DeltU     : Unsigned(5 downto 0) ;
 signal sequence1       : Unsigned(5 downto 0) ;
 signal Total_ValueU   : Unsigned(4 downto 0) ;
 signal Input_DataU    : Unsigned(5 downto 0) ;
 signal Input_AddressU : Unsigned(5 downto 0) ;

begin

 Draw <= Net_4 ;
 Hold <= Net_5 ;
 Bust <= Net_6 ;
 Valid_Card <= Net_7 ;

 Black: Black_Jack
    generic map(
      Stick_level => 16 )
    port map(
      Game_On => Go,
      Card_Delt => Net_7,
      Delt_Card_Value => Card_DeltU(3 downto 0),
      Draw => Net_4,
      Hold => Net_5,
      Bust => Net_6,
      Reset => Reset,
      Clock => Clock,
      Total_Value => Total_ValueU ) ;

 Deal: Dealer
    port map(
      Clock => Clock,
      Input_Address => Input_AddressU,
      Input_Data => Input_DataU,
      Write => Write,
      Output_Address => sequence1,
      Output_Data => Card_DeltU,
      Game_On => Go ) ;

 Seq: Sequencer
    port map(
      Reset => Reset,
      Clock => Clock,
      sequence1 => sequence1,
      Enable => Net_4,
      Valid_Card => Net_7,
      High => open ) ;

 Win: winner_calc
    port map(
      Reset => Reset,
      Clock => Clock,
      Game_On => Go,
      Total_Value => Total_ValueU,
      Hold => Net_5,
      Bust => Net_6,
      Player => Player,
      Winner => Winner,
      WinStrobe => WinStrobe ) ;

  Out_Convert: PROCESS (Total_ValueU, Card_DeltU)
  BEGIN
    Card_Delt <= conv_std_logic_vector(Card_DeltU,6);
    Total_Value <= conv_std_logic_vector(Total_ValueU,5);
  END PROCESS Out_Convert ;


  In_Convert: PROCESS (Input_Address, Input_Data)
  BEGIN
    Input_AddressU <= unsigned(Input_Address);
    Input_DataU <= unsigned(Input_Data);
  END PROCESS In_Convert ;

end  Graphical ;



