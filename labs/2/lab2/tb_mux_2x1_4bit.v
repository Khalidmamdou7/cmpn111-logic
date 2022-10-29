module tb_mux_2x1_4bit();

    reg clk;
    reg [3:0] a;
    reg [3:0] b;
    reg sel;
    wire [3:0] y;

    // instantiate the unit under test (UUT)
    mux_2x1_4bit uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    // instantiate the testbench clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial
    begin
        // initialize inputs
        a = 4'b0000;
        b = 4'b0011;
        sel = 0;
        #10 $display("a = %b, b = %b, sel = %b, y = %b", a, b, sel, y);
        a = 4'b0000;
        b = 4'b0011;
        sel = 1;
        #10 $display("a = %b, b = %b, sel = %b, y = %b", a, b, sel, y);
        a = 4'b1000;
        b = 4'b0011;
        sel = 0;
        #10 $display("a = %b, b = %b, sel = %b, y = %b", a, b, sel, y);
        a = 4'b1000;
        b = 4'b0011;
        sel = 1;
        #100 $finish;
    end

endmodule