library ieee ;
use ieee.std_logic_1164.ALL ;
use ieee.std_logic_arith.ALL ;
use ieee.std_logic_unsigned.ALL ;

entity TestBench is
end  TestBench ;

architecture rtl of TestBench is


 component Game_On
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
 end component ;
 component Loader
  port(
    Draw          : in     std_logic ;
    Hold          : in     std_logic ;
    Bust          : in     std_logic ;
    Card_Delt     : in     Std_Logic_Vector(5 downto 0) ;
    Reset         : out    std_logic ;
    WriteCard     : out    std_logic ;
    Input_Data    : out    Std_Logic_Vector(5 downto 0) ;
    Input_Address : out    Std_Logic_Vector(5 downto 0) ;
    Clock         : out    std_logic ;
    Game_On       : out    std_logic ;
    Total_Value   : in     Std_Logic_Vector(4 downto 0) ;
    Valid_Card    : in     std_logic ;
    Winner        : in     std_logic ;
    Player        : in     std_logic ) ;
 end component ;
 signal Draw          : std_logic ;
 signal Hold          : std_logic ;
 signal Bust          : std_logic ;
 signal Card_Delt     : Std_Logic_Vector(5 downto 0) ;
 signal Reset         : std_logic ;
 signal Write         : std_logic ;
 signal Input_Data    : Std_Logic_Vector(5 downto 0) ;
 signal Input_Address : Std_Logic_Vector(5 downto 0) ;
 signal Clock         : std_logic ;
 signal Go            : std_logic ;
 signal Total_Value   : Std_Logic_Vector(4 downto 0) ;
 signal Valid_Card    : std_logic ;
 signal Winner        : std_logic ;
 signal Player        : std_logic ;
 signal WinStrobe     : std_logic ;
 signal Valid         : std_logic ;
 type cards is (Blank,Ace,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten,Jack,Queen,King);
 type suits is (hearts,spades,clubs,diamonds);
 signal Delt_card : cards;
 signal Delt_suit : suits;

begin
-- Connection Of Loading Function
-- Loads Pack Of Cards Into Game
-- And Monitors The State Of Play To Display Results
-- Blackjack Game Picks Random Cards And
-- Calculates Results Based on Internal Algorithm

 Game: Game_On
    port map(
      Clock => Clock,
      Input_Address => Input_Address,
      Input_Data => Input_Data,
      Write => Write,
      Bust => Bust,
      Hold => Hold,
      Draw => Draw,
      Reset => Reset,
      Go => Go,
      Card_Delt => Card_Delt,
      Total_Value => Total_Value,
      Valid_Card => Valid_Card,
      Player => Player,
      Winner => Winner,
      WinStrobe => WinStrobe ) ;

Retime: PROCESS (Clock, Reset )
BEGIN
	IF (Reset = '0') THEN
        Valid <= '0';
	ELSIF (rising_edge(Clock)) THEN
        Valid <= Valid_Card;
	END IF;
END PROCESS Retime;

 Load: Loader
    port map(
      Draw => Draw,
      Hold => Hold,
      Bust => Bust,
      Card_Delt => Card_Delt,
      Reset => Reset,
      WriteCard => Write,
      Input_Data => Input_Data,
      Input_Address => Input_Address,
      Clock => Clock,
      Game_On => Go,
      Total_Value => Total_Value,
      Valid_Card => Valid_Card,
      Winner => Winner,
      Player => Player ) ;

Delt_card <= cards'val(conv_integer(Card_Delt(3 downto 0)));
Delt_suit <= suits'val(conv_integer(Card_Delt(5 downto 4)));

end  rtl ; -- of TestBench




