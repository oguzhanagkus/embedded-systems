module prime_number_count(
  input clk
);
parameter N =1000;          // size of array

reg [31:0] prime_number[0:N-1]; // memory array for product       
  integer k=0 ;               // counter variable   
  integer count =0;  
  
integer test  ;
integer check ; //Counts 1 to k
localparam S_INC   = 2'b01;
localparam S_CHECK = 2'b10;

reg [1:0] state;

initial begin
  prime_number[0] = 'd2;
  state           = S_CHECK; //Check set count first
  count           = 'd3;  //Start looking for primes from this value
  k               = 'd1; //0, preloaded
  check           = 'd0;
  test            = 'd1;
end

always @(posedge clk ) begin
  if (state == S_INC) begin
    //$display("State: Incrementing Number to check %d", count+1);
    count <= count+1 ;
    state <= S_CHECK ;
    check <= 'd0; 
    test  <= 'd1; // Safe default
  end
  else if (state == S_CHECK) begin
    if (test == 0) begin
      // Failed Prime test (exact divisor found)
      $display("Reject %3d", count);
      state           <= S_INC ;
    end
    else if (check == k) begin
      //Passed Prime check
      //Use k+1 so that 2 is number 1
      $display("Found the %1d th Prime, it is %1d", k+1, count);
      prime_number[k] <=  count;
      k               <=  k + 1;
      state           <= S_INC ;
    end
    else begin
      //$display("Check");
      test  <= count % prime_number[check] ;
      check <= check + 1;          
    end
  end
end

endmodule