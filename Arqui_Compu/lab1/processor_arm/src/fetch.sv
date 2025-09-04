`timescale 1ns / 1ps

module fetch
    #(parameter N = 64)
    (
    input logic PCSrc_F, clk, reset,
    input logic [N-1:0] PCBranch_F,

    output logic [N-1:0] imem_addr_F
    );

    logic [N-1:0] output_mux2, output_adder;

    flopr #(N) PC(.clk(clk), .reset(reset), .d(output_mux2), .q(imem_addr_F));
    adder #(N) SIMPLE_ADDER(.a(imem_addr_F), .b(64'd4), .res(output_adder));
    mux2 #(N) MUX(.d0(output_adder), .d1(PCBranch_F), .s(PCSrc_F), .y(output_mux2));

endmodule
