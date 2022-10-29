module tb_fullAdder_4bit();

    reg clk;
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    fullAdder_4bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // test the fullAdder with 5 different inputs and display the results
    initial begin
        $display("a b cin sum cout");
        $display("--------------------");
        a = 4'b0000; b = 4'b0000; cin = 0; #10 $display("%b %b %b %b %b", a, b, cin, sum, cout);
        a = 4'b0000; b = 4'b0000; cin = 1; #10 $display("%b %b %b %b %b", a, b, cin, sum, cout);
        a = 4'b0001; b = 4'b0001; cin = 0; #10 $display("%b %b %b %b %b", a, b, cin, sum, cout);
        a = 4'b0001; b = 4'b0001; cin = 1; #10 $display("%b %b %b %b %b", a, b, cin, sum, cout);
        a = 4'b1111; b = 4'b1111; cin = 0; #10 $display("%b %b %b %b %b", a, b, cin, sum, cout);
        a = 4'b1111; b = 4'b1111; cin = 1; #10 $display("%b %b %b %b %b", a, b, cin, sum, cout);
        $finish;
    end

endmodule