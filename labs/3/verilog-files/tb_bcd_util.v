module tb_bcd_util();

    reg [3:0] in;
    wire [3:0] out;

    // Instantiate the Unit Under Test (UUT)
    bcd_util uut (
        .in(in),
        .out(out)
    );

    // test the bcd_util with 5 different inputs and display the results
    initial begin
        $display("in\t out\t expected");
        $display("---------------------------");
        in = 4'b0000; #10 $display("%b\t %b\t %b", in, out, 4'd0);
        in = 4'b0001; #10 $display("%b\t %b\t %b", in, out, 4'd1);
        in = 4'b0010; #10 $display("%b\t %b\t %b", in, out, 4'd2);
        in = 4'b0011; #10 $display("%b\t %b\t %b", in, out, 4'd3);
        in = 4'b0100; #10 $display("%b\t %b\t %b", in, out, 4'd4);
        in = 4'b0101; #10 $display("%b\t %b\t %b", in, out, 4'd8);
        in = 4'b0110; #10 $display("%b\t %b\t %b", in, out, 4'd9);
        in = 4'b0111; #10 $display("%b\t %b\t %b", in, out, 4'd10);
        in = 4'b1000; #10 $display("%b\t %b\t %b", in, out, 4'd11);
        in = 4'b1001; #10 $display("%b\t %b\t %b", in, out, 4'd12);
        in = 4'b1010; #10 $display("%b\t %b\t %b", in, out, 4'd13);
        in = 4'b1011; #10 $display("%b\t %b\t %b", in, out, 4'd14);
        in = 4'b1100; #10 $display("%b\t %b\t %b", in, out, 4'd15);
        $finish;
    end

endmodule