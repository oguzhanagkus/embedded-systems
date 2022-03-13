module prime_checker_testbench();

reg clock, reset;
reg [31:0] number, go;
wire output_ready, result;

prime_checker pc(
	.clock(clock),
	.reset(reset),
	.go(go),
	.number(number),
	.output_ready(output_ready),
	.result(result)
);

initial begin
	clock = 1'b0;
	reset = 1'b0;
	go = 1'b1;
	number = 32'd5;
	#100;
	
end

always begin
	#100 clock = !clock;
end

endmodule