// A testbench for the 15-bit Linear Feedback Shift Register (LFSR)
module tb_lfsr_15bit();

    reg clk;
    reg rst;
    reg load;
    reg [14:0] seed_value;
    reg en;
    wire lfsr_out;
    wire [14:0] lfsr_value;

    localparam PERIOD = 10;

    lfsr_15bit uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .seed_value(seed_value),
        .en(en),
        .lfsr_out(lfsr_out),
        .lfsr_value(lfsr_value)
    );

    always #(PERIOD/2) clk = ~clk;

    initial begin
        $display("rst \t load \t seed_value \t\t en \t lfsr_out \t lfsr_value");
        $display("----------------------------------------------------------------");
        $monitor("%b \t %b \t %b \t %b \t %b \t %b", 
                 rst, load, seed_value, en, lfsr_out, lfsr_value);

        $display("Test 1: reset");
        clk = 0;
        rst = 1;
        load = 0;
        seed_value = 0;
        en = 0;

        // simulate a seed value of [least] 011 0111 0001 0101 [most]
        #PERIOD rst = 0; load = 1; seed_value = 15'b101_0100_0111_0110; en = 0;
        $display("Test 2: load seed value");

        #PERIOD rst = 0; load = 0; seed_value = 0; en = 1;
        $display("Test 3: enable");

        #(PERIOD*15) rst = 0; load = 0; seed_value = 0; en = 0;
        $display("Test 4: disable");
        #(PERIOD*16) $display("%b \t %b \t %b \t %b \t %b \t %b", 
                 rst, load, seed_value, en, lfsr_out, lfsr_value);
        $display("----------------------------------------------------------------");

        $finish;
    end

endmodule

