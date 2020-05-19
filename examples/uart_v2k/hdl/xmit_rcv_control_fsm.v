//
// Module uart_v2k.xmit_rcv_control.fsm
//
// Created:
//          by - user.group (host.domain)
//          at - 12:00:43 17/05/2007
//
// Generated by Mentor Graphics' HDL Designer(TM) 2007.1
//
`resetall
`timescale 1ns/10ps
module xmit_rcv_control( 
   // Port Declarations
   input   wire                 clk, 
   output  reg                  done_rcving, 
   output  reg                  done_xmitting, 
   output  reg                  enable_rcv_clk, 
   output  reg                  enable_xmit_clk, 
   output  reg   signed  [3:0]  rcv_bit_cnt, 
   output  reg                  rcving, 
   output  reg                  read_bit, 
   input   wire                 rst, 
   input   wire                 sample, 
   input   wire                 sin, 
   output  reg                  sout, 
   input   wire                 start_xmit, 
   input   wire          [7:0]  xmitdt, 
   output  reg                  xmitting
);


// Internal Declarations


// Declare any pre-registered internal signals
reg       enable_xmit_clk_cld;
reg [3:0] rcv_bit_cnt_cld;
reg       sout_cld;
reg       xmitting_cld;

// Module Declarations
reg signed [2:0] xmit_bit_cnt;  

// State encoding
parameter [2:0]
          waiting       = 3'd0,
          check_lock    = 3'd1,
          rcv_locked    = 3'd2,
          read_data     = 3'd3,
          incr_count2   = 3'd4,
          done_read     = 3'd5,
          read_stop_bit = 3'd6,
          finish_rcv    = 3'd7;

// State encoding
parameter [2:0]
          waiting_to_xmit = 3'd0,
          send_start      = 3'd1,
          send_data       = 3'd2,
          incr_count      = 3'd3,
          done_xmit       = 3'd4,
          send_stop_bit   = 3'd5,
          finish_xmit     = 3'd6;

reg [2:0] rcv_current_state, rcv_next_state;

reg [2:0] xmit_current_state, xmit_next_state;

//-----------------------------------------------------------------
// Next State Block for machine rcv
//-----------------------------------------------------------------
always @ *
begin : rcv_next_state_block_proc
   case (rcv_current_state) 
      waiting: begin
         if (~sin)
            rcv_next_state <= check_lock;
         else
            rcv_next_state <= waiting;
      end
      check_lock: begin
         if (sin)
            rcv_next_state <= waiting;
         else if (~sin)
            rcv_next_state <= rcv_locked;
         else
            rcv_next_state <= check_lock;
      end
      rcv_locked: begin
         if (sample)
            rcv_next_state <= read_data;
         else
            rcv_next_state <= rcv_locked;
      end
      read_data: begin
         if (~sample)
            rcv_next_state <= incr_count2;
         else
            rcv_next_state <= read_data;
      end
      incr_count2: begin
         if (sample && rcv_bit_cnt_cld !== 7)
            rcv_next_state <= read_data;
         else if (sample && rcv_bit_cnt_cld == 7)
            rcv_next_state <= done_read;
         else
            rcv_next_state <= incr_count2;
      end
      done_read: begin
         if (~sample)
            rcv_next_state <= read_stop_bit;
         else
            rcv_next_state <= done_read;
      end
      read_stop_bit: begin
         if (sample)
            rcv_next_state <= finish_rcv;
         else
            rcv_next_state <= read_stop_bit;
      end
      finish_rcv: begin
         rcv_next_state <= waiting;
      end
      default: 
         rcv_next_state <= waiting;
   endcase
end // Next State Block

//-----------------------------------------------------------------
// Next State Block for machine xmit
//-----------------------------------------------------------------
always @ *
begin : xmit_next_state_block_proc
   case (xmit_current_state) 
      waiting_to_xmit: begin
         if (start_xmit)
            xmit_next_state <= send_start;
         else
            xmit_next_state <= waiting_to_xmit;
      end
      send_start: begin
         if (sample)
            xmit_next_state <= send_data;
         else
            xmit_next_state <= send_start;
      end
      send_data: begin
         if (~sample)
            xmit_next_state <= incr_count;
         else
            xmit_next_state <= send_data;
      end
      incr_count: begin
         if (sample && xmit_bit_cnt !== 0)
            xmit_next_state <= send_data;
         else if (sample && ~xmit_bit_cnt)
            xmit_next_state <= done_xmit;
         else
            xmit_next_state <= incr_count;
      end
      done_xmit: begin
         if (~sample)
            xmit_next_state <= send_stop_bit;
         else
            xmit_next_state <= done_xmit;
      end
      send_stop_bit: begin
         xmit_next_state <= finish_xmit;
      end
      finish_xmit: begin
         xmit_next_state <= waiting_to_xmit;
      end
      default: 
         xmit_next_state <= waiting_to_xmit;
   endcase
end // Next State Block

//-----------------------------------------------------------------
// Output Block for machine rcv
//-----------------------------------------------------------------
always @ *
begin : rcv_output_block_proc
   // Default Assignment
   done_rcving <= 0;
   enable_rcv_clk <= 0;
   rcving <= 0;
   read_bit <= 0;

   // Combined Actions
   case (rcv_current_state) 
      waiting: begin
         if (~sin)
            enable_rcv_clk <= 1;
      end
      check_lock: begin
         enable_rcv_clk <= 1;
         if (sin)
            enable_rcv_clk <= 0;
      end
      rcv_locked: begin
         rcving <= 1;
         enable_rcv_clk <= 1;
      end
      read_data: begin
         rcving <= 1;
         enable_rcv_clk <= 1;
      end
      incr_count2: begin
         rcving <= 1;
         enable_rcv_clk <= 1;
         if (sample && rcv_bit_cnt_cld !== 7)
            read_bit <= 1;
         else if (sample && rcv_bit_cnt_cld == 7)
            read_bit <= 1;
      end
      done_read: begin
         rcving <= 1;
         enable_rcv_clk <= 1;
      end
      read_stop_bit: begin
         rcving <= 1;
         enable_rcv_clk <= 1;
      end
      finish_rcv: begin
         enable_rcv_clk <= 0;
         rcving <= 0;
         done_rcving <= 1;
      end
   endcase
end // Output Block

//-----------------------------------------------------------------
// Output Block for machine xmit
//-----------------------------------------------------------------
always @ *
begin : xmit_output_block_proc
   // Default Assignment
   done_xmitting <= 0;

   // Combined Actions
   case (xmit_current_state) 
      send_stop_bit: begin
         done_xmitting <= 1;
      end
   endcase
end // Output Block

//-----------------------------------------------------------------
// Clocked Block for machine rcv
//-----------------------------------------------------------------
always @(
   posedge clk, 
   negedge rst
) 
begin : rcv_clocked_block_proc
   if (!rst) begin
      rcv_current_state <= waiting;
      // Reset Values
      rcv_bit_cnt_cld <= 0;
   end
   else 
   begin
      rcv_current_state <= rcv_next_state;

      // Combined Actions
      case (rcv_current_state) 
         waiting: begin
            if (~sin)
               rcv_bit_cnt_cld <= 0;
         end
         incr_count2: begin
            if (sample && rcv_bit_cnt_cld !== 7)
               rcv_bit_cnt_cld <= rcv_bit_cnt_cld + 1;
         end
      endcase
   end
end // Clocked Block

//-----------------------------------------------------------------
// Clocked Block for machine xmit
//-----------------------------------------------------------------
always @(
   posedge clk, 
   negedge rst
) 
begin : xmit_clocked_block_proc
   if (!rst) begin
      xmit_current_state <= waiting_to_xmit;
      // Reset Values
      enable_xmit_clk_cld <= 0;
      sout_cld <= 1;
      xmitting_cld <= 0;
      xmit_bit_cnt <= 0;
   end
   else 
   begin
      xmit_current_state <= xmit_next_state;
      // Default Assignment To Internals
      sout_cld <= 1;

      // Combined Actions
      case (xmit_current_state) 
         send_start: begin
            sout_cld <= 0;
            enable_xmit_clk_cld <= 1;
            xmitting_cld <= 1;
         end
         send_data: begin
            sout_cld <= xmitdt[xmit_bit_cnt];
            if (~sample)
               xmit_bit_cnt <= xmit_bit_cnt + 1;
         end
         incr_count: begin
            sout_cld <= xmitdt[xmit_bit_cnt];
         end
         finish_xmit: begin
            enable_xmit_clk_cld <= 0;
            xmitting_cld <= 0;
         end
      endcase
   end
end // Clocked Block

// Concurrent Statements
// Clocked output assignments
always @ *
begin : clocked_output_proc
   enable_xmit_clk <= enable_xmit_clk_cld;
   rcv_bit_cnt <= rcv_bit_cnt_cld;
   sout <= sout_cld;
   xmitting <= xmitting_cld;
end
endmodule // xmit_rcv_control
