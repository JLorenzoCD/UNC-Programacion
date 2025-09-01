`timescale 1ns / 1ps

module execute(
    input logic AluSrc,
    input logic [3:0] AluControl,
    input logic [63:0] PC_E,
    input logic [63:0] signImm_E,
    input logic [63:0] readData1_E,
    input logic [63:0] readData2_E,

    output logic [63:0] PCBranch_E,
    output logic [63:0] aluResult_E,
    output logic [63:0] writeData_E,
    output logic zero_E
    );

    logic [63:0] output_sl2;
    logic [63:0] output_mux2;

    sl2 #(64) SHIFT_LEFT_2(.x(signImm_E), .y(output_sl2));
    adder #(64) SIMPLE_ADDER(.a(PC_E), .b(output_sl2), .res(PCBranch_E));

    mux2 #(64) MUX(.d2_0(readData2_E), .d2_1(signImm_E), .s2(AluSrc), .y2(output_mux2));
    alu ALU(.a(readData1_E), .b(output_mux2), .ALUControl(AluControl), .result(aluResult_E), .zero(zero_E));

    assign writeData_E = readData2_E;

endmodule

