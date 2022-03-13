module gcd (
    input clk,
    input go_i,
    input reset,
    input [7:0] x_i,
    input [7:0] y_i,
    output [7:0] d_o
);

wire ildx;
wire ildy;
wire ildd;
wire iSx;
wire iSy;
wire iSs;
wire ixeqy;
wire ixgty;

control_unit c0(
    .clk(clk),
    .reset(reset),
    .xeqy(ixeqy),
    .xgty(ixgty),
    .go_i(go_i),
    .ldx(ildx),
    .ldy(ildy),
    .ldd(ildd),
    .Sx(iSx),
    .Sy(iSy),
    .Ss(iSs)
);

datapath d0(
    .clk(clk),
    .ldx(ildx),
    .ldy(ildy),
    .ldd(ildd),
    .Sx(iSx),
    .Sy(iSy),
    .Ss(iSs),
    .x_i(x_i),
    .y_i(y_i),
    .d_o(d_o),
    .xeqy(ixeqy),
    .xgty(ixgty)
);
    
endmodule