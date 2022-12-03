module tb_prbs_15bit();

    reg clk;
    reg rst;
    reg load;
    reg [14:0] seed_value;
    reg en;
    reg data_in;
    wire data_out;
    wire [14:0] lfsr_value;

    localparam PERIOD = 10;

    prbs_15bit uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .seed_value(seed_value),
        .en(en),
        .data_in(data_in),
        .data_out(data_out),
        .lfsr_value(lfsr_value)
    );

    always #(PERIOD/2) clk = ~clk;

    initial begin
        $display("time \t rst \t load \t seed_value \t\t en d_in d_out lfsr_value");
        $display("----------------------------------------------------------------");
        $monitor("%g \t %b \t %b \t %b \t %b \t %b \t %b \t %b", 
                 $time, rst, load, seed_value, en, data_in, data_out, lfsr_value);
        

        clk = 0;
        rst = 1;
        load = 0;
        seed_value = 0;
        en = 0;
        data_in = 0;
        $display("Test 1: reset");

        #PERIOD rst = 0; load = 1; seed_value = 15'b101_0100_0111_0110; en = 0;
        $display("Test 2: load seed value");

        #PERIOD rst = 0; load = 0; seed_value = 0; en = 1; data_in = 1'b1;
        $display("Test 3: enable");
        $display("Test 3.1: data_in = 0xA");
        #PERIOD data_in = 1'b0;
        #PERIOD data_in = 1'b1;
        #PERIOD data_in = 1'b0;

        #PERIOD data_in = 1'b1;
        $display("Test 3.2: data_in = 0xC");
        #PERIOD data_in = 1'b1;
        #PERIOD data_in = 1'b0;
        #PERIOD data_in = 1'b0;


        #(PERIOD*8) rst = 0; load = 0; seed_value = 0; en = 0;
        $display("Test 4: disable");
        $display("----------------------------------------------------------------");

        $finish;
    end

endmodule

