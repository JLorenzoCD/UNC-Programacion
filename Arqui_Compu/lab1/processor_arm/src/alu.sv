`timescale 1ns / 1ps

module alu
    #(parameter N = 64)
    (
    input logic [N-1:0] a, b,
    input logic [3:0] ALUControl,

    output logic [N-1:0] result,
    output logic zero
    );

    always_comb begin
        casez(ALUControl)
            4'b0000: result = a & b;
            4'b0001: result = a | b;
            4'b0010: result = a + b;
            4'b0110: result = a - b;
            4'b0111: result = b;
            default: result = '0;
        endcase
    end

    assign zero = ~|result;

endmodule
