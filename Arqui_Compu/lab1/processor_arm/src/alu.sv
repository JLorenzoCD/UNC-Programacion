`timescale 1ns / 1ps

module alu(
    input logic [63:0] a,
    input logic [63:0] b,
    input logic [3:0] ALUControl,
    output logic [63:0] result,
    output logic zero
    );

    always_comb
        casez(ALUControl)
            4'b0000: result = a & b;
            4'b0001: result = a | b;
            4'b0010: result = a + b;
            4'b0110: result = a - b;
            4'b0111: result = b;
            default: result = '0;
        endcase

    assign zero = ~|result;

endmodule
