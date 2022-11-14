module tb_multiplier_4x4();

    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] y;

    // Instantiate the Unit Under Test (UUT)
    multiplier_4x4 uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // test the multiplier with different corner cases and display the results
    initial begin
        $display("a\t b\t y\t expected");
        $display("---------------------------");
        a = 4'b0000; b = 4'b0000; #10 $display("%b\t %b\t %b\t %b", a, b, y, 8'd0);
        a = 4'b0000; b = 4'b1111; #10 $display("%b\t %b\t %b\t %b", a, b, y, 8'd0);
        a = 4'b1111; b = 4'b0000; #10 $display("%b\t %b\t %b\t %b", a, b, y, 8'd0);
        a = 4'b1111; b = 4'b1111; #10 $display("%b\t %b\t %b\t %b", a, b, y, 8'b11100001);
        a = 4'b1010; b = 4'b0101; #10 $display("%b\t %b\t %b\t %b", a, b, y, 8'b00110010);
        a = 4'b0101; b = 4'b1010; #10 $display("%b\t %b\t %b\t %b", a, b, y, 8'b00110010);
        $finish;
    end

endmodule

