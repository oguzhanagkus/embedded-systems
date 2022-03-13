module datapath (
    input clk,
    input ldx,
    input ldy,
    input ldd,
    input Sx,
    input Sy,
    input Ss,
    input [7:0] x_i,
    input [7:0] y_i,
    output [7:0] d_o,
    output xeqy,
    output xgty
);

wire [7:0] xval;
wire [7:0] yval;
wire [7:0] xsuby;
wire [7:0] ysubx;
wire [7:0] subA;
wire [7:0] subB;
wire [7:0] subR;

reg [7:0] x;
reg [7:0] y;
reg [7:0] d;
//reg [7:0] xvalreg;
//reg [7:0] yvalreg;
//reg [7:0] xsubyreg;
//reg [7:0] ysubxreg;

assign d_o = d;
assign xval = Sx ? subR : x_i;
assign yval = Sy ? subR : y_i;
assign subA = Ss ? y : x;
assign subB = Ss ? x : y;
assign subR = subA - subB;
assign xeqy = x == y ? 1'b1 : 1'b0;
assign xgty = x > y ? 1'b1 : 1'b0;

/*
always @(*) begin
    if (x == 5) begin
        if (Sx)
            xvalreg = xsuby;
        else
            xvalreg = x_i;

        xsubyreg = x - y;
    end
end
*/

always @(posedge clk) begin
    if (ldx)
        x <= xval;
    if (ldy)
        y <= yval; 
    if (ldd)
        d_0 <= x;
end
    

endmodule