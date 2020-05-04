library ieee ;
use ieee.std_logic_1164.ALL ;

package black_jack_package is

type TypeDeltCardType is (Card_Type_Ace, Card_Type_No2to10, Card_Type_Pic);

constant Ace   : integer := 1;
constant Two   : integer := 2;
constant Three : integer := 3;
constant Four  : integer := 4;
constant Five  : integer := 5;
constant Six   : integer := 6;
constant Seven : integer := 7;
constant Eight : integer := 8;
constant Nine  : integer := 9;
constant Ten   : integer := 10;
constant Jack  : integer := 11;
constant Queen : integer := 12;
constant King  : integer := 13;

end  black_jack_package ;


