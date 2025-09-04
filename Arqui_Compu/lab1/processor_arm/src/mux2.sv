`timescale 1ns / 1ps

module mux2
    #(parameter N = 64)
    (
    input [N-1:0] d0, d1,
    input s,

    output [N-1:0] y
    );

    assign y = s ? d1 : d0;
endmodule
