module control_unit (
    input clk,
    input reset,
    input xeqy,
    input xgty,
    input go_i,
    output reg ldx,
    output reg ldy,
    output reg ldd,
    output reg Sx,
    output reg Sy,
    output reg Ss
);

localparam IDLE = 3'd0;
localparam LOOP = 3'd1;
localparam XBIGY = 3'd2;
localparam YBIGX = 3'd3;
localparam END = 3'd4;

reg [2:0] current_state;
reg [2:0] next_state;

// State register
always @(posedge clk, posedge reset) begin
    if (reset)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

// Next state logic
always @(*) begin
    next_state = current_state;

    case (current_state)
        IDLE:
            begin
                if (go_i)
                    next_state = LOOP;
            end
        
        LOOP:
            begin
                if (xeqy)
                    next_state = END;
                else if (xgty)
                    next_state = XBIGY;
                else
                    next_state = YBIGX;
            end
        
        XBIGY:
            begin
                next_state = LOOP;
            end
        
        YBIGX:
            begin
                next_state = LOOP;
            end

        END:
            begin
                next_state = IDLE;  
            end
    endcase
end

// Output logic
always @(current_state) begin
    ldx = 1'b0;
    ldy = 1'b0;
    ldd = 1'b0;
    Sx = 1'b0;
    Sy = 1'b0;
    Ss = 1'b0;

    case (current_state)
        IDLE:
            begin
                ldx = 1'b1;
                ldy = 1'b1;
                Sx = 1'b0;
                Sy = 1'b0;
            end
        
        XBIGY:
            begin
                ldx = 1'b1;
                Sx = 1'b1;
                Ss = 1'b0;
            end
        
        YBIGX:
            begin
                ldy = 1'b1;
                Sy = 1'b1;
                Ss = 1'b1;
            end

        END:
            begin
               ldd = 1'b1; 
            end
    endcase
end

endmodule