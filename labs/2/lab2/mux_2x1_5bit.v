module mux_2x1_5bit (
    input [4:0] a,
    input [4:0] b,
    input sel,
    output [4:0] y
);

    // for sel = 0, output a and for sel = 1, output b
    assign y = sel ? b : a;

endmodule
