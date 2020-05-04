module winner_calc (
    reset ,clock ,game_on ,total_value ,hold ,bust ,player ,
    winner ,winstrobe );
 input  reset;
 input  clock;
 input  game_on;
 input[ 4 : 0 ]  total_value;
 input  hold;
 input  bust;
 output  player;
 output  winner;
 output  winstrobe;
 wire reset;
 wire clock;
 wire game_on;
 wire[ 4 : 0 ] total_value;
 wire hold;
 wire bust;
 wire player;
 
 wire winner;
 reg winstrobe;
 reg[0:0] person;
 reg[0:0] win;
 reg[ 4 : 0 ] dealers_total;

`define true  1'b1
`define false 1'b0
`define dealer  1'b0
`define punter  1'b1

OBUF U1 (player, player_int);
OBUF U2 (winner, winner_int);

 always @ (posedge (clock) or negedge (reset))
   begin : player_selection
    if  ( reset ==1'b0 )
    begin 
     person  <= `dealer ;
     dealers_total  <= 5'b0;
    end
    else if ( game_on ==1'b1 )
     begin 
      if  ( ((hold ==1'b1 ) | (bust ==1'b1 )))
      begin 
       if  ( person ==`dealer )
       begin 
        person  <= `punter ;
        dealers_total  <= total_value ;
       end
       else
       begin
        person  <= `dealer ;
        dealers_total  <= dealers_total ;
       end 
      end 
     end 
 end 
 always @ (posedge (clock) or negedge (reset))
   begin : winner_selection
    if  ( reset ==1'b0 )
    begin 
     win  <= `dealer ;
    end
    else if  ( game_on ==1'b1 )
     begin 
      if  ( ((hold ==1'b1 ) & (person ==`punter )))
      begin 
       if  ( ((dealers_total  >=  22 ) | (dealers_total <total_value )))
       begin 
        win  <= `punter ;
       end
       else
       begin
        win  <= `dealer ;
       end 
      end
      else if ( ((bust ==1'b1 ) & (person ==`punter )))
      begin 
       win  <= `dealer ;
      end 
     end 
 end 
 always @ (negedge (clock) or negedge (reset))
   begin : winner_strobe
    if  ( reset ==1'b0 )
    begin 
     winstrobe  <= 1'b0 ;
    end
    else if  ( person ==`dealer )
     begin 
      winstrobe  <= 1'b1 ;
     end
     else
     begin
      winstrobe  <= 1'b0 ;
     end 
 end 
 assign winner_int  = (
  (win ==`dealer ) ? 1'b1  : (
  1'b0 ));
 assign player_int  = (
  (person ==`dealer ) ? 1'b1  : (
  1'b0 ));
endmodule
