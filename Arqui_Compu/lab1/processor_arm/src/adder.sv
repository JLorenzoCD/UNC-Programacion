`timescale 1ns / 1ps

module adder
    #(parameter N = 64)
    (
    input [N-1:0] a,
    input [N-1:0] b,

    output [N-1:0] res
    );

    assign res = a + b;
endmodule
