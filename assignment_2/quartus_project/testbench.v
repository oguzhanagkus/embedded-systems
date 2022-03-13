module testbench();

reg clock, reset;
reg sensor_1, sensor_2, sensor_3;
wire motor_1, motor_2, motor_3;

vending v (
	.clock(clock),
	.reset(reset),
	.sensor_1(sensor_1),
	.sensor_2(sensor_2),
	.sensor_3(sensor_3),
	.motor_1(motor_1),
	.motor_2(motor_2),
	.motor_3(motor_3)
);

initial begin
	clock = 1'b0;
	reset = 1'b0;

	#5;

	// Give 5₺, get sandwich
	sensor_1 = 1'b0; sensor_2 = 1'b0; sensor_3 = 1'b0;	#10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b0; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	
	// Give 5.5₺, get sandwich and 0.5₺ return
	sensor_1 = 1'b0; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b0; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;

	// Give 2.5₺, get water and 0.5₺ return
	sensor_1 = 1'b0; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b0; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b0; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	
	// Give 3₺, get water and 0.5₺ return
	sensor_1 = 1'b0; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b1; sensor_2 = 1'b1; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b0; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	sensor_1 = 1'b0; sensor_2 = 1'b0; sensor_3 = 1'b0; #10;
	
end

always begin
	#5 clock = !clock;
end

endmodule