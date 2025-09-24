`timescale 1ns / 1ps

module sl2
    #(parameter N = 64)
    (
    input [N-1:0] x,

    output [N-1:0] y
    );

    assign y = x << 2;
endmodule
