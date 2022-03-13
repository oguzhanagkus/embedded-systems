module vending (
	input clock,
	input reset,
	input sensor_1,
	input sensor_2,
	input sensor_3,
	output reg motor_1,
	output reg motor_2,
	output reg motor_3
);

// States
localparam S_00  = 4'b0000;
localparam S_05  = 4'b0001;
localparam S_10  = 4'b0010;
localparam S_15  = 4'b0011;
localparam S_20  = 4'b0100;
localparam S_25  = 4'b0101;
localparam S_30  = 4'b0110;
localparam S_35  = 4'b0111;
localparam S_40  = 4'b1000;
localparam S_45  = 4'b1001;
localparam S_50  = 4'b1010;
localparam S_55  = 4'b1011;

reg [3:0] current_state = 4'b0000;
reg [3:0] next_state = 4'b0000;

// State register
always @(posedge clock, posedge reset) begin
	if (reset)
		current_state <= 4'b0000;
	else
		current_state <= next_state;
end

// Next state logic
always @(*) begin
	case (current_state)

		S_00: begin
			if (sensor_1 & ~sensor_2)
				next_state = S_05;
			else if (sensor_1 & sensor_2)
				next_state = S_10;
			else
				next_state = current_state; 
		end

		S_05: begin
			if (sensor_1 & ~sensor_2)
				next_state = S_10;
			else if (sensor_1 & sensor_2)
				next_state = S_15;
			else
				next_state = current_state;
		end

		S_10: begin
			if (sensor_1 & ~sensor_2)
				next_state = S_15;
			else if (sensor_1 & sensor_2)
				next_state = S_20;
			else
				next_state = current_state;
			end

		S_15: begin
			if (sensor_1 & ~sensor_2)
				next_state = S_20;
			else if (sensor_1 & sensor_2)
				next_state = S_25;
			else
				next_state = current_state;
		end

		S_20: begin
			if (sensor_1 & ~sensor_2)
				next_state = S_25;
			else if (sensor_1 & sensor_2)
				next_state = S_30;
			else
				next_state = current_state;
		end

		S_25: begin
			if (sensor_1 & ~sensor_2)
				next_state = S_30;
			else if (sensor_1 & sensor_2)
				next_state = S_35;
			else if (~sensor_1 & ~sensor_3)
				next_state = S_00;
			else
				next_state = current_state;
			end

		S_30: begin
			if (sensor_1 & ~sensor_2)
				next_state = S_35;
			else if (sensor_1 & sensor_2)
				next_state = S_40;
			else if (~sensor_1 & ~sensor_3)
				next_state = S_00;
			else
				next_state = current_state;
        end

		S_35: begin
			if (sensor_1 & ~sensor_2)
				next_state = S_40;
			else if (sensor_1 & sensor_2)
				next_state = S_45;
			else
				next_state = current_state; 
		end

		S_40: begin
			if (sensor_1 & ~sensor_2)
				next_state = S_45;
			else if (sensor_1 & sensor_2)
				next_state = S_50;
			else
				next_state = current_state;
		end    

		S_45: begin
			if (sensor_1 & ~sensor_2)
				next_state = S_50;
			else if (sensor_1 & sensor_2)
				next_state = S_55;
			else
				next_state = current_state;
		end

		S_50: begin
			next_state = S_00;
		end

		S_55: begin
			next_state = S_00;
		end
	endcase
end

// Output logic
always @(current_state, sensor_1, sensor_3) begin
	motor_1 = 1'b0;
	motor_2 = 1'b0;
	motor_3 = 1'b0;

	case (current_state)
		S_00: begin
			motor_1 = 1'b0;
			motor_2 = 1'b0;
			motor_3 = 1'b0;
		end

		S_25: begin
			if (~sensor_1 & ~sensor_3)
				motor_1 = 1'b1;
		end

		S_30: begin
			if (~sensor_1 & ~sensor_3) begin
				motor_1 = 1'b1;
				motor_3 = 1'b1;
			end
		end

		S_50: begin
			motor_2 = 1'b1;
		end

		S_55: begin
			motor_2 = 1'b1;
         motor_3 = 1'b1;
		end
		  
		default: begin
			motor_1 = 1'b0;
			motor_2 = 1'b0;
			motor_3 = 1'b0;
		end
	endcase
end

endmodule