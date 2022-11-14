module tb_mult_integrated();

    reg [3:0] a;
    reg [3:0] b;
    wire [6:0] ss_ones;
    wire [6:0] ss_tens;
    wire [6:0] ss_hundreds;

    mult_integrated uut (
        .a(a),
        .b(b),
        .ss_ones(ss_ones),
        .ss_tens(ss_tens),
        .ss_hundreds(ss_hundreds)
    );


    // ssd truth table
    // in  out
    // 0 = 1000000
    // 1 = 1111001
    // 2 = 0100100
    // 3 = 0110000
    // 4 = 0011001
    // 5 = 0010010
    // 6 = 0000010
    // 7 = 1111000
    // 8 = 0000000
    // 9 = 0010000

    initial begin
        $display("a\t b\t a*b\t ss_ones\t ss_tens\t ss_hundreds");
        $display("----------------------------------------");
        a = 0; b = 0; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd0, ss_ones, ss_tens, ss_hundreds);
        a = 0; b = 1; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd0, ss_ones, ss_tens, ss_hundreds);
        a = 0; b = 2; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd0, ss_ones, ss_tens, ss_hundreds);
        a = 0; b = 3; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd0, ss_ones, ss_tens, ss_hundreds);
        a = 1; b = 0; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd0, ss_ones, ss_tens, ss_hundreds);
        a = 1; b = 1; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd1, ss_ones, ss_tens, ss_hundreds);
        a = 4; b = 2; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd8, ss_ones, ss_tens, ss_hundreds);
        a = 2; b = 5; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd10, ss_ones, ss_tens, ss_hundreds);
        a = 9; b = 9; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd81, ss_ones, ss_tens, ss_hundreds);
        a = 10; b = 10; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd100, ss_ones, ss_tens, ss_hundreds);
        a = 2; b = 15; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd30, ss_ones, ss_tens, ss_hundreds);
        a = 15; b = 2; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd30, ss_ones, ss_tens, ss_hundreds);
        a = 15; b = 15; #10 $display("%d\t %d\t %d\t %b\t %b\t %b", a, b, 8'd225, ss_ones, ss_tens, ss_hundreds);
        $finish;
    end

endmodule
