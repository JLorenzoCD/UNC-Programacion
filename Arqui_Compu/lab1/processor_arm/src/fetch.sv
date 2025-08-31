`timescale 1ns / 1ps

module fetch(
    input logic PCSrc_F,
    input logic clk,
    input logic reset,
    input logic [63:0] PCBranch_F,

    output logic [63:0] imem_addr_F
    );

    logic [63:0] output_mux2;
    logic [63:0] output_adder;

    flopr #(64) PC(.clk(clk), .reset(reset), .d(output_mux2), .q(imem_addr_F));
    adder #(64) SIMPLE_ADDER(.a(imem_addr_F), .b(64'd4), .res(output_adder));
    mux2 #(64) MUX(.d2_0(output_adder), .d2_1(PCBranch_F), .s2(PCSrc_F), .y2(output_mux2));

endmodule
