`timescale 1ns / 1ps

module mux2
    #(parameter N = 64)
    (
    input [N-1:0] d2_0,
    input [N-1:0] d2_1,
    input s2,
    output [N-1:0] y2
    );

    assign y2 = s2 ? d2_1 : d2_0;
endmodule
