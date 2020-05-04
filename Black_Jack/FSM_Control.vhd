library ieee ;
use ieee.std_logic_1164.ALL ;
use ieee.std_logic_arith.ALL ;
use ieee.std_logic_unsigned.ALL ;
use work.black_jack_package.all ;

entity FSM_Control is
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
end  FSM_Control ;

architecture rtl of FSM_Control is

  type state_type is (Rest, WaitCard, Card1Delt, Card1Pic, 
          DrawNextCard, Card1Ace, Card1_2to10, NextCardDelt, NextCardPic, 
          TestGEStick, NextCardAce, NextCard_2to10, TestGE22, AceAs1, 
          ShowBust, ShowHold, WaitCard2, WaitCard3, WaitAcc, WaitAcc1) ;
  signal cur_state  : state_type ;  
  signal next_state : state_type ;  

begin

  next_state_decoding: process (cur_state, Game_On, Card_Delt,
    Delt_Card_Type, Aces_As11, MT_Equal_Stick, More_Than_Equal_22) 
  begin 
    next_state <= cur_state ;
    Reset_Accums <= '0';
    Inc_Aces <= '0';
    Dec_Aces <= '0';
    Acc_Total_Value_By10 <= '0';
    Acc_Total_Card_Value <= '0';
    Hold <= '0';
    Bust <= '0';
    Draw <= '0';
    case cur_state is
      when Rest =>
        Reset_Accums <= '1';
        if (Game_On = '0') then
          next_state <= Rest ;
        else
          next_state <= WaitCard ;
        end if ;
      when WaitCard =>
        Draw <= '1';
        next_state <= WaitCard2 ;
      when Card1Delt =>
        if (Delt_Card_Type = Card_Type_Ace) then
          next_state <= Card1Ace ;
        elsif (Delt_Card_Type = Card_Type_Pic) then
          next_state <= Card1Pic ;
        else
          next_state <= Card1_2to10 ;
        end if ;
      when Card1Pic =>
        Acc_Total_Value_By10 <= '1';
        next_state <= DrawNextCard ;
      when DrawNextCard =>
        Draw <= '1';
        next_state <= WaitCard3 ;
      when Card1Ace =>
        Inc_Aces <= '1';
        next_state <= DrawNextCard ;
      when Card1_2to10 =>
        Acc_Total_Card_Value <= '1';
        next_state <= DrawNextCard ;
      when NextCardDelt =>
        if ( Delt_Card_Type = Card_Type_Ace ) then
          next_state <= NextCardAce ;
        elsif ( Delt_Card_Type = Card_Type_Pic ) then
          next_state <= NextCardPic ;
        else
          next_state <= NextCard_2to10 ;
        end if ;
      when NextCardPic =>
        Acc_Total_Value_By10 <= '1';
        next_state <= WaitAcc ;
      when TestGEStick =>
        if ( MT_Equal_Stick = '1' ) then
          next_state <= TestGE22 ;
        else
          next_state <= DrawNextCard ;
        end if ;
      when NextCardAce =>
        Inc_Aces <= '1';
        next_state <= WaitAcc ;
      when NextCard_2to10 =>
        Acc_Total_Card_Value <= '1';
        next_state <= WaitAcc ;
      when TestGE22 =>
        if (More_Than_Equal_22 = '1' and Aces_As11 = '0') then
          next_state <= ShowBust ;
        elsif (More_Than_Equal_22 = '1' and Aces_As11 = '1') then
          next_state <= AceAs1 ;
        elsif (More_Than_Equal_22 = '0') then
          next_state <= ShowHold ;
        end if ;
      when AceAs1 =>
        Dec_Aces <= '1';
        next_state <= WaitAcc1 ;
      when ShowBust =>
        Bust <= '1';
        next_state <= Rest ;
      when ShowHold =>
        Hold <= '1';
        next_state <= Rest ;
      when WaitCard2 =>
        if (Card_Delt = '1') then
          next_state <= Card1Delt ;
        else
          next_state <= WaitCard2 ;
        end if ;
      when WaitCard3 =>
        if (Card_Delt = '1') then
          next_state <= NextCardDelt ;
        else
          next_state <= WaitCard3 ;
        end if ;
      when WaitAcc =>
        next_state <= TestGEStick ;
      when WaitAcc1 =>
        next_state <= TestGEStick ;
    end case ;
  end process next_state_decoding ;

  state_transition: process (Clock, Reset) 
  begin
    if ( Reset='0' ) then
      cur_state <= Rest ;
    elsif (Clock'event and (Clock = '1')) then
      cur_state <= next_state ;
    end if ;
  end process state_transition ;
end  rtl ;

