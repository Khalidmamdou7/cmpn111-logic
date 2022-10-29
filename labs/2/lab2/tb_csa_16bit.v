module tb_csa_16bit();

    reg clk;
    reg [15:0] a;
    reg [15:0] b;
    reg cin;
    wire [15:0] sum;
    wire cout;

    // instantiate the unit under test (UUT)
    csa_16bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // instantiate the testbench clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // test the adder with different corner cases for a, b, and cin
    initial
    begin
        // initialize inputs
        $display("\ta\tb  cin \t sum  cout \texpected sum  cout");

        a = 16'd0;
        b = 16'd0;
        cin = 0;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd0;
        b = 16'd0;
        cin = 1;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd0;
        b = 16'd1;
        cin = 0;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd0;
        b = 16'd1;
        cin = 1;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd1;
        b = 16'd0;
        cin = 0;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd1;
        b = 16'd0;
        cin = 1;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd1;
        b = 16'd1;
        cin = 0;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd1;
        b = 16'd1;
        cin = 1;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd2;
        b = 16'd3;
        cin = 0;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd2;
        b = 16'd3;
        cin = 1;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd9;
        b = 16'd9;
        cin = 0;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd15;
        b = 16'd15;
        cin = 0;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd15;
        b = 16'd15;
        cin = 1;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd32767;
        b = 16'd32767;
        cin = 0;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd65535;
        b = 16'd65535;
        cin = 0;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        a = 16'd65535;
        b = 16'd65535;
        cin = 1;
        #10 $display("%d \t %d \t %b \t %d \t %b \t %d \t %b", a, b, cin, sum, cout, a + b + cin, cout);

        $finish;
    end
        


endmodule