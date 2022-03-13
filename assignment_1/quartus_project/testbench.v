`timescale 1ns/10ps

module testbench();
  
reg [7:0] input_1;
reg [7:0] input_2;
wire [11:0] result;
	 
my_function inst(
	.x(input_1),
	.y(input_2),
	.result(result));

integer i, j, output_file;
	
initial
	begin
		$display("     Input 1         Input 2             Result    ");
		$display("---------------------------------------------------");
		
		output_file = $fopen("output.txt", "w");
	 
		input_1 = 8'd0;	input_2 = 8'd0;
		
		for (i = 25; i < 150; i = i + 25)
			begin
				input_1 = i;
				
				for (j = 50; j < 256; j = j + 10)
					begin
						input_2 = j; #10;
						//$fwrite(output_file, "%0d,%0d,%0d\n", input_1, input_2, result);
						$monitor("%d [%b]  %d [%b]  %d [%b]", input_1, input_1, input_2, input_2, result, result);
					end
			end
		
		$fclose(output_file);
		$monitor("Finished!");
	end

endmodule