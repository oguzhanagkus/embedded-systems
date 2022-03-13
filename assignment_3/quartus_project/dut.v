// Code your testbench here
// or browse Examples
module dut;
  
  reg clk;
  initial begin
    clk = 1'b0;
    forever begin
      #40 clk = !clk;
    end
  end
  
  //Test Program
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    repeat (120) 
      @(posedge clk);
    $finish;
  end
  
  prime_number_count u_prime(
    .clk(clk)
  );
  
endmodule