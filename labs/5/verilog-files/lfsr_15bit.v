// Linear Feedback Shift Register (LFSR) 15-bit with 1-bit output
// asynchronus reset, synchronous seed load and clock enable
// 15-bit LFSR with taps at 15 and 14

module lfsr_15bit (
    input clk,
    input rst,
    input load,
    input [14:0] seed_value,
    input en,
    output reg lfsr_out,
    output reg [14:0] lfsr_value
    );

    always @(posedge clk)
    begin
        if (rst)
            lfsr_value <= 15'b0;
        else if (load)
            lfsr_value <= seed_value;
        else if (en)
            lfsr_value <= {lfsr_value[13:0], lfsr_value[14]^lfsr_value[13]};
    end

    assign lfsr_out = lfsr_value[0];

endmodule