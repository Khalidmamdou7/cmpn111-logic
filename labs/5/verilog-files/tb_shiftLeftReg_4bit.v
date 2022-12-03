module tb_shiftLeftReg_4bit();

    reg clk;
    reg rst;
    reg in;
    wire [3:0] out;

    localparam PERIOD = 10;
    
    shiftLeftReg_4bit uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );
    
    always #(PERIOD/2) clk = ~clk;

    initial begin
        $display("rst in  out");
        $monitor("%b    %b   %b", 
                 rst, in, out);
        clk = 0;
        rst = 1;
        in = 0;

        #PERIOD rst = 0;
        // simulate an input sequence of 1010
        #PERIOD in = 1;
        #PERIOD in = 0;
        #PERIOD in = 1;
        #PERIOD in = 0;

        // simulate an input sequence of 0011
        #PERIOD in = 0;
        #PERIOD in = 0;
        #PERIOD in = 1;
        #PERIOD in = 1;

        // simulate an input sequence of 1111
        #PERIOD in = 1;
        #PERIOD in = 1;
        #PERIOD in = 1;
        #PERIOD in = 1;

        $finish;
    end

endmodule