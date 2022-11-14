module tb_ssd();

    reg [3:0] in;
    wire [6:0] out;

    ssd uut (
        .in(in),
        .out(out)
    );

    initial begin
        $display("in\t out\t expected");
        $display("--------------------");
        in = 0; #10 $display("%d\t %b\t %b", in, out, 7'b1000000);
        in = 1; #10 $display("%d\t %b\t %b", in, out, 7'b1111001);
        in = 2; #10 $display("%d\t %b\t %b", in, out, 7'b0100100);
        in = 3; #10 $display("%d\t %b\t %b", in, out, 7'b0110000);
        in = 4; #10 $display("%d\t %b\t %b", in, out, 7'b0011001);
        in = 5; #10 $display("%d\t %b\t %b", in, out, 7'b0010010);
        in = 6; #10 $display("%d\t %b\t %b", in, out, 7'b0000010);
        in = 7; #10 $display("%d\t %b\t %b", in, out, 7'b1111000);
        in = 8; #10 $display("%d\t %b\t %b", in, out, 7'b0000000);
        in = 9; #10 $display("%d\t %b\t %b", in, out, 7'b0010000);
        $finish;
    end

endmodule