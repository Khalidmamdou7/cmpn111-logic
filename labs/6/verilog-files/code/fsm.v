module fsm(
    input clk,nrst,i0,i1,i2,i3,
    output wire o0,o1,o2,
    output reg [2:0] state_reg
);

    localparam s0 = 3'b000;
    localparam s1 = 3'b001;
    localparam s2 = 3'b010;
    localparam s3 = 3'b011;
    localparam s4 = 3'b100;

    reg [2:0] state_next;
    
    always @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            state_reg <= s0;
        end
        else begin
            state_reg <= state_next;
        end
    end

    always @(state_reg, i0, i1, i2, i3) begin
        case (state_reg)
            s0: begin
                if (i3) begin
                    if (i2) begin
                        state_next = s4;
                    end
                    else begin
                        state_next = s2;
                    end
                end
                else begin
                    state_next = s1;
                end
            end
            s1: begin
                if (i2) begin
                    state_next = s3;
                end
                else begin
                    if (i1) begin
                        state_next = s1;
                    end
                    else begin
                        if (i0) begin
                            state_next = s0;
                        end
                        else begin
                            state_next = s4;
                        end
                    end
                end
            end
            s2: begin
                if (i3) begin
                    state_next = s2;
                end
                else begin
                    if (i2) begin
                        state_next = s1;
                    end
                    else begin
                        state_next = s3;
                    end
                end
            end
            s3: begin
                if (i1) begin
                    state_next = s3;
                end
                else begin
                    if (i0) begin
                        if (i3) begin
                            state_next = s0;
                        end
                        else begin
                            state_next = s1;
                        end
                    end
                    else begin
                        state_next = s2;
                    end
                end
            end
            s4: begin
                if (i2) begin
                    state_next = s3;
                end
                else begin
                    if (i0) begin
                        state_next = s4;
                    end
                    else begin
                        state_next = s1;
                    end
                end
            end
        endcase
    end

    assign o0 = (state_reg == s1 || state_reg == s2 || state_reg == s4);
    assign o1 = (state_reg == s1);
    assign o2 = (state_reg != s3 && state_reg != s2);


endmodule
