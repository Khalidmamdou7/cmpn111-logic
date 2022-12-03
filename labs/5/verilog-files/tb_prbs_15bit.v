module tb_prbs_15bit();

    reg clk;
    reg rst;
    reg load;
    reg [14:0] seed_value;
    reg en;
    reg data_in;
    wire data_out;
    wire [14:0] lfsr_value;

    integer i;
    integer error;

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
    localparam dataStream = 96'hAC_BC_D2_11_4D_AE_15_77_C6_DB_F4_C9;
    localparam expectedStream = 96'h55_8A_C4_A5_3A_17_24_E1_63_AC_2B_F9;

    initial begin
        $display("time \t rst \t load \t seed_value \t\t en d_in d_out lfsr_value");
        $display("----------------------------------------------------------------");
        

        $display("Test 1: reset");
        clk = 0; rst = 1; load = 0; seed_value = 0; en = 0; data_in = 0;
        #PERIOD;
        $display("%g \t %b \t %b \t %b \t\t %b %b %b %b", $time, rst, load, seed_value, en, data_in, data_out, lfsr_value);
        if (data_out != 0 || lfsr_value != 0) 
            begin
                $display("ERROR: data_out != 0 || lfsr_value != 0");
            end
        else
            $display("Test 1: PASSED");

        $display("Test 2: load seed value");
        #PERIOD rst = 0; load = 1; seed_value = 15'b101_0100_0111_0110; en = 0;
        #PERIOD;
        $display("%g \t %b \t %b \t %b \t\t %b %b %b %b", $time, rst, load, seed_value, en, data_in, data_out, lfsr_value);
        if (lfsr_value != 15'b101_0100_0111_0110) 
            begin
                $display("ERROR:lfsr_value != 15'b101_0100_0111_0110");
            end
        else
            $display("Test 2: PASSED");


        $display("Test 3: data stream = %h and expected = %h", dataStream, expectedStream);	
        $display("time \t rst \t load \t seed_value \t\t en d_in d_out expected lfsr_value");
        $display("----------------------------------------------------------------");

        #PERIOD rst = 0; load = 0; seed_value = 0; en = 1;
        error = 0;
        for (i = 0; i < 96; i = i + 1) begin
            data_in = dataStream[95 - i];
            #PERIOD $display("%g \t %b \t %b \t %b \t %b \t %b \t %b \t %b \t %b", 
                               $time, rst, load, seed_value, en, data_in, data_out, expectedStream[95 - i], lfsr_value);
            if (data_out != expectedStream[95 - i]) begin
                $display("Error: data_out = %b, expected = %b", data_out, expectedStream[95 - i]);
                error = 1;
            end
        end
        if (error == 0) $display("Test 3: passed");
        else $display("Test 3: failed");
        


        #(PERIOD) $stop;
    end

endmodule

