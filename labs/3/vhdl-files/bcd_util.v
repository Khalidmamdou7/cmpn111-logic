module bcd_util (
    input [3:0] in,
    output [3:0] out
);

    // add 3 if the input is at least 5
    assign out = in + (in >= 4'b101 ? 3'b011 : 3'b000);

endmodule