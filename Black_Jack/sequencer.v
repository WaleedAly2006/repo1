module sequencer ( reset ,clock ,sequence1 ,enable ,valid_card ,high );
 input  reset;
 input  clock;
 input  enable;
 output[ 5 : 0 ]  sequence1;
 output  valid_card;
 output  high;
 wire reset;
 wire clock;
 reg[ 5 : 0 ] sequence1;
 wire enable;
 reg valid_card;
 wire high;
 wire invalid_card;
 wire next_location;
 reg[ 1 : 0 ] invalid_cards;
 
 
  reg Player,Winner,Valid_Card,Draw,Hold,Bust,Clock;
  reg [4:0] Total_Value;
  reg Game_On,Reset,WriteCard;
  reg [5:0] Input_Address,Input_Data,Card_Delt;

 always @ (posedge clock or negedge reset)
   begin : block_24
    if  ( reset ==1'b0 )
    begin 
     sequence1  <= 6'b0;
     valid_card  <= 1'b0 ;
    end
    else
    begin
     if  ( ((enable ==1'b1 ) | (invalid_card ==1'b1 )))
     begin 
      sequence1  <= {sequence1 [ 4 : 0 ],(~(sequence1 [ 0 ] ^ sequence1 [ 5 ]))};
     end 
     if  ( enable ==1'b1 )
     begin 
      valid_card  <= 1'b0 ;
     end
     else
     begin
      if  ( sequence1  >=  52 )
      begin 
       valid_card  <= 1'b0 ;
      end
      else
      begin
       valid_card  <= 1'b1 ;
      end 
     end 
    end 
 end 
 always @ (posedge clock or negedge reset)
   begin : block_45
    if  ( reset ==1'b0 )
    begin 
     invalid_cards  <= 2'b0;
    end
    else
    begin
     if  ( enable ==1'b1 )
     begin 
      invalid_cards  <= 2'b0;
     end
     else
     begin
      if  ( invalid_card ==1'b1 )
      begin 
       invalid_cards  <= 2'b0;
      end
      else
      begin
       if  ( valid_card ==1'b0 )
       begin 
        invalid_cards  <= (invalid_cards  +  1 );
       end 
      end 
     end 
    end 
 end 
 assign invalid_card  = ((invalid_cards == 2 ) ? 1'b1  : ( 1'b0 ));
 assign  high  = 1'b1 ;
 
	Loader Loader_1(
		.Draw          (Draw),
		.Hold          (Hold),
		.Bust          (Bust),
		.Card_Delt     (Card_Delt),
		.Reset         (Reset),
		.WriteCard     (WriteCard),
		.Input_Data    (Input_Data),
		.Input_Address (Input_Address),
		.Clock         (Clock),
		.Game_On       (Game_On),
		.Total_Value   (Total_Value),
		.Valid_Card    (Valid_Card),
		.Winner        (Winner),
		.Player        (Player)
	);
 
 
endmodule
