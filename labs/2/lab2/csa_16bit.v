// carry-select adder using 4-bit full adders and 2x1 multiplexers
module csa_16bit (
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);

    wire [3:0] sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7;
    wire cout0, cout1, cout2, cout3, cout4, cout5, cout6, cout7;
    wire mux_cout0, mux_cout1, mux_cout2;


    // 4-bit full adders
    fullAdder_4bit fa0 (a[3:0], b[3:0], 1'b0, sum0, cout0);
    fullAdder_4bit fa1 (a[7:4], b[7:4], 1'b0, sum1, cout1);
    fullAdder_4bit fa2 (a[11:8], b[11:8], 1'b0, sum2, cout2);
    fullAdder_4bit fa3 (a[15:12], b[15:12], 1'b0, sum3, cout3);
    fullAdder_4bit fa4 (a[3:0], b[3:0], 1'b1, sum4, cout4);
    fullAdder_4bit fa5 (a[7:4], b[7:4], 1'b1, sum5, cout5);
    fullAdder_4bit fa6 (a[11:8], b[11:8], 1'b1, sum6, cout6);
    fullAdder_4bit fa7 (a[15:12], b[15:12], 1'b1, sum7, cout7);

    // 2x1 multiplexers
    mux_2x1_5bit m0 (
        .a({cout0, sum0}),
        .b({cout4, sum4}),
        .sel(cin),
        .y({mux_cout0, sum[3:0]})
    );
    mux_2x1_5bit m1 (
        .a({cout1, sum1}),
        .b({cout5, sum5}),
        .sel(mux_cout0),
        .y({mux_cout1, sum[7:4]})
    );
    mux_2x1_5bit m2 (
        .a({cout2, sum2}),
        .b({cout6, sum6}),
        .sel(mux_cout1),
        .y({mux_cout2, sum[11:8]})
    );
    mux_2x1_5bit m3 (
        .a({cout3, sum3}),
        .b({cout7, sum7}),
        .sel(mux_cout2),
        .y({cout, sum[15:12]})
    );


endmodule