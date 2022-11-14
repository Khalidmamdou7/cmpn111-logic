module tb_bcd();

    reg [7:0] in;
    wire [3:0] ones;
    wire [3:0] tens;
    wire [3:0] hundreds;

    bcd uut (
        .a(in),
        .ones(ones),
        .tens(tens),
        .hundreds(hundreds)
    );
    
    initial begin
        $display("in\t ones\t tens\t hundreds");
        $display("--------------------------------");
        in = 0; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 1; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 2; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 3; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 9; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 10; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 15; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 20; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 25; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 99; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 100; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 255; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        in = 256; #10 $display("%d\t %d\t %d\t %d", in, ones, tens, hundreds);
        $finish;
    end

endmodule