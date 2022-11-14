module mult_integrated (
    input [3:0] a,
    input [3:0] b,
    output [6:0] ss_ones,
    output [6:0] ss_tens,
    output [6:0] ss_hundreds
);

    // define the input and output variables
    wire [7:0] mult_out;
    wire [3:0] bcd_ones_out, bcd_tens_out, bcd_hundreds_out;
    wire [3:0] ssd_ones_in, ssd_tens_in, ssd_hundreds_in;
    wire [6:0] ssd_ones_out, ssd_tens_out, ssd_hundreds_out;

    // instanitate modules
    multiplier_4x4 multiplier_4x4 (.a(a), .b(b), .y(mult_out));

    bcd bcd (.a(mult_out), .ones(bcd_ones_out), .tens(bcd_tens_out), .hundreds(bcd_hundreds_out));

    ssd ssd_ones (.in(bcd_ones_out), .out(ssd_ones_out));
    ssd ssd_tens (.in(bcd_tens_out), .out(ssd_tens_out));
    ssd ssd_hundreds (.in(bcd_hundreds_out), .out(ssd_hundreds_out));

    assign ss_ones = ssd_ones_out;
    assign ss_tens = ssd_tens_out;
    assign ss_hundreds = ssd_hundreds_out;

endmodule
