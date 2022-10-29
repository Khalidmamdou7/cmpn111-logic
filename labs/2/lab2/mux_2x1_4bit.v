module mux_2x1_4bit (
    input [3:0] a,
    input [3:0] b,
    input sel,
    output [3:0] y
);
    // for sel = 0, output a and for sel = 1, output b
    assign y = sel ? b : a;
    
endmodule
