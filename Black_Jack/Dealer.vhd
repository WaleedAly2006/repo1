library ieee ;
use ieee.std_logic_1164.ALL ;
use ieee.std_logic_arith.ALL ;
use ieee.std_logic_unsigned.ALL ;

entity Dealer is
  port(
    Clock          : in     std_logic ;
    Input_Address  : in     Unsigned(5 downto 0) ;
    Input_Data     : in     Unsigned(5 downto 0) ;
    Write          : in     std_logic ;
    Output_Address : in     Unsigned(5 downto 0) ;
    Output_Data    : out    Unsigned(5 downto 0) ;
    Game_On        : in     std_logic ) ;
end  Dealer ;

ARCHITECTURE rtl OF Dealer IS
  type mem_array is array (0 to 63) of Unsigned (5 downto 0);
  signal memory_store :mem_array ;
  signal Store_Address : Unsigned(5 DOWNTO 0);
  signal Store_AddressR : Unsigned(5 DOWNTO 0);
begin
 
Store_Address <= Input_Address when (Game_On = '0') else Output_Address;
    
process (Clock)
begin
if rising_edge(Clock) then
   if (Write = '1') then
     memory_store (conv_integer(Store_AddressR)) <= Input_Data;
   end if;
   Store_AddressR <= Store_Address;
end if;
end process;
    
Output_Data <=   memory_store (conv_integer(Store_AddressR));

END  rtl ;

