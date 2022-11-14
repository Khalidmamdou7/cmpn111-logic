module multiplier_4x4 (
    input [3:0] a,
    input [3:0] b,
    output [7:0] y
);
    
    // RTL implementation of a 4x4 multiplier for unsigned numbers using
    // combinational logic
    
    assign y = a * b;

endmodule
