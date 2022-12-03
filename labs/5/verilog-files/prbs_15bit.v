// A Pseduo-random binary sequence (PRBS) generator to randomize a binary data stream
// Designed using a Linear Feedback Shift Register (LFSR) with 15-bit length and taps at 15 and 14
// It has asynchronus reset, synchronous seed load and clock enable
module prbs_15bit(
    input clk,
    input rst,
    input load,
    input [14:0] seed_value,
    input en,
    input data_in,
    output reg data_out,
    output reg [14:0] lfsr_value
    );

    wire lfsr_out;
    wire [14:0] lfsr_value_wire;

    lfsr_15bit lfsr (
        .clk(clk),
        .rst(rst),
        .load(load),
        .seed_value(seed_value),
        .en(en),
        .lfsr_out(lfsr_out),
        .lfsr_value(lfsr_value_wire)
    );

    assign data_out = data_in ^ lfsr_out;
    assign lfsr_value = lfsr_value_wire;

endmodule
    