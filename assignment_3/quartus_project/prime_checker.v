module prime_checker(
	input clock,
	input reset,
	input go,
	input [31:0] number,
	output reg output_ready,
	output reg result
);

localparam init = 3'd0,
			  check_lsb = 3'd1,
			  try_again = 3'd2,
			  not_prime = 3'd3,
			  prime = 3'd4;

reg[2:0] current_state = init;
reg[2:0] next_state = init;

// State register
always @(posedge clock, posedge reset) begin
	if(reset)
		current_state <= init;
	else
		current_state <= next_state;
end

// Next state logic
always @(*) begin
	next_state = current_state;
	
	case(current_state)
		init:
			if(go)
				next_state = check_lsb;
		
		check_lsb: begin
			if(number[0] == 0)
				next_state = not_prime;
			else
				next_state = try_again;
		end
		
		try_again:
			next_state = prime;
		
		not_prime:
			next_state = init;
		
		prime:
			next_state = init;
	endcase	
end

// Output logic
always @(*) begin
	case(current_state)
		init: begin
			output_ready <= 1'b0;
			result <= 1'b0;
		end
		
		check_lsb: begin
			output_ready <= 1'b0;
			result <= 1'b0;
		end
		
		try_again: begin
			output_ready <= 1'b0;
			result <= 1'b0;
		end

		not_prime: begin
			output_ready <= 1'b1;
			result <= 1'b0;
		end

		prime: begin
			output_ready <= 1'b1;
			result <= 1'b1;
		end
	endcase
end

endmodule