// seven-segment display decoder
module ssd (
    input [3:0] in,
    output [6:0] out
);


    // Assuming that the 7-segment display is connected to the FPGA as active low:
    // 0 = 1000000
    // 1 = 1111001
    // 2 = 0100100
    // 3 = 0110000
    // 4 = 0011001
    // 5 = 0010010
    // 6 = 0000010
    // 7 = 1111000
    // 8 = 0000000
    // 9 = 0010000

    // code for the 7-segment display decoder
    assign out = (in == 4'd0) ? 7'b1000000 :
                 (in == 4'd1) ? 7'b1111001 :
                 (in == 4'd2) ? 7'b0100100 :
                 (in == 4'd3) ? 7'b0110000 :
                 (in == 4'd4) ? 7'b0011001 :
                 (in == 4'd5) ? 7'b0010010 :
                 (in == 4'd6) ? 7'b0000010 :
                 (in == 4'd7) ? 7'b1111000 :
                 (in == 4'd8) ? 7'b0000000 :
                 (in == 4'd9) ? 7'b0010000 :
                                7'b1111111;
    
endmodule