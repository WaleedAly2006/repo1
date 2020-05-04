
/*

FUNCTION       : OUTPUT BUFFER

*/

`delay_mode_path
`timescale  100 ps / 10 ps

`celldefine

module OBUF (O, I);

    parameter cds_action = "ignore";

    output O;

    input  I;

`ifdef GTS_SIGNAL
    wire gts = `GTS_SIGNAL;
`else
    tri0 gts;
`endif

	bufif0 B1 (O, I, gts);

    specify
	(I *> O) = (1, 1);
    endspecify

endmodule

`endcelldefine
