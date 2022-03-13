module my_function(
	input		[7:0] x,
	input		[7:0]	y,
	output	[11:0] result
);

wire [8:0] sum;
wire control;

assign sum = x + y;
assign control = sum < 9'd400 ? 1'd1 : 1'd0;
assign result = control == 1'd1 ? (x - ((x >> 6) << 6)) + ((y << 1) + y) : (x - ((x >> 4) << 4)) + ((y << 3) + (y << 2) + y);

endmodule