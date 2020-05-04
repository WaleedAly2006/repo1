library ieee ;
use ieee.std_logic_1164.ALL ;
use ieee.std_logic_arith.ALL ;
use ieee.std_logic_unsigned.ALL ;

entity Loader is
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
end  Loader ;

ARCHITECTURE rtl OF Loader IS

	procedure load_playing_card(address_value: in Std_Logic_Vector(5 downto 0);
	                            data_value: in Std_Logic_Vector(5 downto 0);
	                            signal  write_enable: out std_logic;
	                            signal  address: out Std_Logic_Vector(5 downto 0);
	                            signal  data: out Std_Logic_Vector(5 downto 0)
	                            ) is  
	begin
	    address <= address_value; 
	    data <= data_value;
	    write_enable <= '0';
	    wait for 300 NS;
	    write_enable <= '1';
          wait for 200 NS;
	    write_enable <= '0';
	    wait for 100 NS;
	end load_playing_card;
	
	type Suit is (Hearts, Spades, Clubs, Diamonds, Errors);
	signal Display_Suit : Suit ;
	
	type Card is (Ace, One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Errors);
	signal Display_Card : Card;

	
	signal Clk : std_logic := '0';
	signal Go : std_logic;
	
	type card_deck is array (0 to 63) of Std_Logic_Vector (5 downto 0);
    constant deck_one : card_deck := ("000001", -- 0
                                      "000010", -- 1
                                      "000011", -- 2                                     
                                      "000100", -- 3
                                      "000101", -- 4
                                      "000110", -- 5                                      
                                      "000111", -- 6
                                      "001000", -- 7
                                      "001001", -- 8                                      
                                      "001010", -- 9
                                      "001011", -- 10
                                      "001100", -- 11                                      
                                      "001101", -- 12
                                      "010001", -- 13
                                      "010010", -- 14
                                      "010011", -- 15                                      
                                      "010100", -- 16
                                      "010101", -- 17
                                      "010110", -- 18                                      
                                      "010111", -- 19
                                      "011000", -- 20
                                      "011001", -- 21                                      
                                      "011010", -- 22
                                      "011011", -- 23
                                      "011100", -- 24                                      
                                      "011101", -- 25
                                      "100001", -- 26
                                      "100010", -- 27
                                      "100011", -- 28                                      
                                      "100100", -- 29
                                      "100101", -- 30
                                      "100110", -- 31                                      
                                      "100111", -- 32
                                      "101000", -- 33
                                      "101001", -- 34                                      
                                      "101010", -- 35
                                      "101011", -- 36
                                      "101100", -- 37                                      
                                      "101101", -- 38
                                      "110001", -- 39
                                      "110010", -- 40
                                      "110011", -- 41                                      
                                      "110100", -- 42
                                      "110101", -- 43
                                      "110110", -- 44                                      
                                      "110111", -- 45
                                      "111000", -- 46
                                      "111001", -- 47                                      
                                      "111010", -- 48
                                      "111011", -- 49
                                      "111100", -- 50                                      
                                      "111101", -- 51
                                      "XXXXXX", -- 52
                                      "XXXXXX", -- 53
                                      "XXXXXX", -- 54
                                      "XXXXXX", -- 55
                                      "XXXXXX", -- 56
                                      "XXXXXX", -- 57
                                      "XXXXXX", -- 58
                                      "XXXXXX", -- 59
                                      "XXXXXX", -- 60
                                      "XXXXXX", -- 61
                                      "XXXXXX", -- 62
                                      "XXXXXX"   
                                      );        -- 63
	
BEGIN

-- Generate Clock And Reset
Clk	 <= not(Clk) after 100 ns;

PROCESS
BEGIN
   Reset <= '0';
   WAIT FOR 200 NS;
   Reset <= '1';
WAIT;
END PROCESS;

Clock <= Clk;

-- Load A Card
DEAL_CARDS : PROCESS
BEGIN
    Go <= '0';
    WAIT FOR 300 NS;
    for i in 0 to 63 loop
      load_playing_card(conv_Std_Logic_Vector(i,6),deck_one(i),WriteCard,Input_Address,Input_Data);
    end loop ;
    WAIT FOR 300 NS;
    Go <= '1';
WAIT;
END PROCESS;

Game_On <= Go;

END  rtl ;


