module tb_mux_2x1_5bit();

    reg clk;
    reg [4:0] a;
    reg [4:0] b;
    reg sel;
    wire [4:0] y;

    // instantiate the unit under test (UUT)
    mux_2x1_5bit uut (
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
        $display("a \t b \t sel \t y");
        a = 5'b00000;
        b = 5'b00111;
        sel = 0;
        #10 $display("%b \t %b \t %b \t %b", a, b, sel, y);
        a = 5'b00000;
        b = 5'b00111;
        sel = 1;
        #10 $display("%b \t %b \t %b \t %b", a, b, sel, y);
        a = 5'b10000;
        b = 5'b00111;
        sel = 0;
        #10 $display("%b \t %b \t %b \t %b", a, b, sel, y);
        a = 5'b10000;
        b = 5'b00111;
        sel = 1;
        #10 $display("%b \t %b \t %b \t %b", a, b, sel, y);
        // finish simulation
        $finish;
    end

endmodule