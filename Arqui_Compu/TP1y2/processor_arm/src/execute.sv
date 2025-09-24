`timescale 1ns / 1ps

module execute
    #(parameter N = 64)
    (
    input logic AluSrc,
    input logic [3:0] AluControl,
    input logic [N-1:0] PC_E, signImm_E, readData1_E, readData2_E,

    output logic [N-1:0] PCBranch_E, aluResult_E, writeData_E,
    output logic zero_E
    );

    logic [N-1:0] output_sl2, output_mux2;

    sl2 #(64) SHIFT_LEFT_2(.x(signImm_E), .y(output_sl2));
    adder #(64) SIMPLE_ADDER(.a(PC_E), .b(output_sl2), .res(PCBranch_E));

    mux2 #(64) MUX(.d0(readData2_E), .d1(signImm_E), .s(AluSrc), .y(output_mux2));
    alu ALU(.a(readData1_E), .b(output_mux2), .ALUControl(AluControl), .result(aluResult_E), .zero(zero_E));

    assign writeData_E = readData2_E;

endmodule

