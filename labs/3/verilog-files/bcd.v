module bcd (
    input [7:0] a,
    output [3:0] ones,
    output [3:0] tens,
    output [3:0] hundreds
);

    // using the bcd_util module which adds 3 to the input if it is at least 5, we will convert the binary number to BCD
    // the BCD number will be stored in the ones, tens and hundreds variables

    // I will use 7 cascaded modules of bcd_util to convert the 8-bit binary number to BCD according the figure attached to the lab

    // define the input and output variables
    wire [3:0] in_1, in_2, in_3, in_4, in_5, in_6, in_7;
    wire [3:0] out_1, out_2, out_3, out_4, out_5, out_6, out_7;

    // instantiate the bcd_util module
    bcd_util bcd_util_1 (.in(in_1), .out(out_1));
    bcd_util bcd_util_2 (.in(in_2), .out(out_2));
    bcd_util bcd_util_3 (.in(in_3), .out(out_3));
    bcd_util bcd_util_4 (.in(in_4), .out(out_4));
    bcd_util bcd_util_5 (.in(in_5), .out(out_5));
    bcd_util bcd_util_6 (.in(in_6), .out(out_6));
    bcd_util bcd_util_7 (.in(in_7), .out(out_7));

    // assign the input variables for the bcd_util modules
    assign in_1 = {1'b0, a[7:5]};
    assign in_2 = {out_1[2:0], a[4]};
    assign in_3 = {out_2[2:0], a[3]};
    assign in_4 = {out_3[2:0], a[2]};
    assign in_5 = {out_4[2:0], a[1]};
    assign in_6 = {1'b0, out_1[3], out_2[3], out_3[3]};
    assign in_7 = {out_6[2:0], out_4[3]};

    // assign the output variables
    assign ones = {out_5[2:0], a[0]};
    assign tens = {out_7[2:0], out_5[3]};
    assign hundreds = {2'b00, out_6[3], out_7[3]};

endmodule