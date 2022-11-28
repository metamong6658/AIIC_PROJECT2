//`include "control.v"
`timescale 1ns/1ns
//`default_nettype none

module tb_RRAM_control(clk, set, learn, reset);

output reg clk, set, learn, reset;
//input [7:0] train_num;
//output reg train_num;
// output reg Dwl5, Dwl4, Dwl3, Dwl2, Dwl1, Dwl0;
// output reg Dsl5, Dsl4, Dsl3, Dsl2, Dsl1, Dsl0;
// output reg Dbl5, Dbl4, Dbl3, Dbl2, Dbl1, Dbl0;
// output reg Dset, Dback, Dlabel;


localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

// initial begin
//     $dumpfile("tb_control.vcd");
//     $dumpvars(0, tb_control);
// end

initial begin
    clk = 0;
    learn = 0;
    set = 0;
    reset = 1;
    //train_num = 0;

    #20
    set = 1;
    reset = 0;
    #10
    set = 0;
    #20
    learn = 1;
    //train_num = 5;
    //train_num = 1;
    #10
    learn = 0;
    #100000

    $finish(2);
end

endmodule
