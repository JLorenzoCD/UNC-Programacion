`timescale 1ns / 1ps

module alu_tb;
    logic clk;
    logic [63:0] a, b;
    logic [3:0] ALUControl;
    logic [63:0] result, result_exp;
    logic zero, zero_exp;

    logic [31:0] vectornum, errors;

    logic [63:0] a_testvec [0:22];
    logic [63:0] b_testvec [0:22];
    logic [3:0] ALUControl_testvec [0:22];
    logic [63:0] result_expvec [0:22];
    logic zero_expvec [0:22];

    // instantiate device under test
    alu dut(.a(a), .b(b), .ALUControl(ALUControl), .result(result), .zero(zero));

    // generate clock
    always begin  // no sensitivity list, so it always executes
            clk = 1; #5; clk = 0; #5;
    end

    logic [63:0] pos1 = {{60{1'b0}}, 4'b0110}; // 6
    logic [63:0] pos2 = {{60{1'b0}}, 4'b1010}; // 10
    logic [63:0] neg1 = {{60{1'b1}}, 4'b1111}; // -1
    logic [63:0] neg2 = {{60{1'b1}}, 4'b1110}; // -2

    initial begin
            //* AND
            ALUControl_testvec[0] = 4'b0000;
            ALUControl_testvec[1] = 4'b0000;
            ALUControl_testvec[2] = 4'b0000;

            a_testvec[0] = pos1; b_testvec[0] = pos2;
            result_expvec[0] = {{60{1'b0}}, 4'b0010}; zero_expvec[0] = 'b0;

            a_testvec[1] = neg1; b_testvec[1] = neg2;
            result_expvec[1] = {{60{1'b1}}, 4'b1110}; zero_expvec[1] = 'b0;

            a_testvec[2] = pos1; b_testvec[2] = neg2;
            result_expvec[2] = {{60{1'b0}}, 4'b0110}; zero_expvec[2] = 'b0;

            //* OR
            ALUControl_testvec[3] = 4'b0001;
            ALUControl_testvec[4] = 4'b0001;
            ALUControl_testvec[5] = 4'b0001;

            a_testvec[3] = pos1; b_testvec[3] = pos2;
            result_expvec[3] = {{60{1'b0}}, 4'b1110}; zero_expvec[3] = 'b0;

            a_testvec[4] = neg1; b_testvec[4] = neg2;
            result_expvec[4] = {{60{1'b1}}, 4'b1111}; zero_expvec[4] = 'b0;

            a_testvec[5] = pos1; b_testvec[5] = neg2;
            result_expvec[5] = {{60{1'b1}}, 4'b1110}; zero_expvec[5] = 'b0;

            //* ADD
            ALUControl_testvec[6] = 4'b0010;
            ALUControl_testvec[7] = 4'b0010;
            ALUControl_testvec[8] = 4'b0010;

            a_testvec[6] = pos1; b_testvec[6] = pos2;
            result_expvec[6] = {59'b0, 5'b10000}; zero_expvec[6] = 'b0;

            a_testvec[7] = neg1; b_testvec[7] = neg2;
            result_expvec[7] = {{60{1'b1}}, 4'b1101}; zero_expvec[7] = 'b0;

            a_testvec[8] = pos1; b_testvec[8] = neg2;
            result_expvec[8] = {{60{1'b0}}, 4'b0100}; zero_expvec[8] = 'b0;

            //* SUB
            ALUControl_testvec[9] = 4'b0110;
            ALUControl_testvec[10] = 4'b0110;
            ALUControl_testvec[11] = 4'b0110;

            a_testvec[9] = pos1; b_testvec[9] = pos2;
            result_expvec[9] = {{60{1'b1}}, 4'b1100}; zero_expvec[9] = 'b0;

            a_testvec[10] = neg1; b_testvec[10] = neg2;
            result_expvec[10] = {{60{1'b0}}, 4'b0001}; zero_expvec[10] = 'b0;

            a_testvec[11] = pos1; b_testvec[11] = neg2;
            result_expvec[11] = {{60{1'b0}}, 4'b1000}; zero_expvec[11] = 'b0;

            //* PASS INPUT b
            ALUControl_testvec[12] = 4'b0111;
            ALUControl_testvec[13] = 4'b0111;
            ALUControl_testvec[14] = 4'b0111;

            a_testvec[12] = pos1; b_testvec[12] = pos2;
            result_expvec[12] = pos2; zero_expvec[12] = 'b0;

            a_testvec[13] = neg1; b_testvec[13] = neg2;
            result_expvec[13] = neg2; zero_expvec[13] = 'b0;

            a_testvec[14] = pos1; b_testvec[14] = neg2;
            result_expvec[14] = neg2; zero_expvec[14] = 'b0;


            //* Cualquier valor de ALUControl descocido, da 0
            ALUControl_testvec[15] = 4'b1000;
            ALUControl_testvec[16] = 4'b1000;
            ALUControl_testvec[17] = 4'b1000;

            a_testvec[15] = pos1; b_testvec[15] = pos2;
            result_expvec[15] = 64'b0; zero_expvec[15] = 'b1;

            a_testvec[16] = neg1; b_testvec[16] = neg2;
            result_expvec[16] = 64'b0; zero_expvec[16] = 'b1;

            a_testvec[17] = pos1; b_testvec[17] = neg2;
            result_expvec[17] = 64'b0; zero_expvec[17] = 'b1;

            ALUControl_testvec[18] = 4'b1011;
            ALUControl_testvec[19] = 4'b1011;
            ALUControl_testvec[20] = 4'b1011;

            a_testvec[18] = pos1; b_testvec[18] = pos2;
            result_expvec[18] = 64'b0; zero_expvec[18] = 'b1;

            a_testvec[19] = neg1; b_testvec[19] = neg2;
            result_expvec[19] = 64'b0; zero_expvec[19] = 'b1;

            a_testvec[20] = pos1; b_testvec[20] = neg2;
            result_expvec[20] = 64'b0; zero_expvec[20] = 'b1;

            //* OVERFLOW
            ALUControl_testvec[21] = 4'b0010; // ADD
            a_testvec[21] = {1'b0, {63{1'b1}}}; b_testvec[21] = 64'd1;
            result_expvec[21] = {1'b1, {63{1'b0}}}; zero_expvec[21] = 'b0;

            ALUControl_testvec[22] = 4'b0110; // SUB
            a_testvec[22] = {1'b1, {63{1'b0}}}; b_testvec[22] = 64'd1;
            result_expvec[22] = {1'b0, {63{1'b1}}}; zero_expvec[22] = 'b0;

            // INIT
            vectornum = 0; errors = 0;
            a = 64'b0; b = 64'b0; ALUControl = 4'b0;
            result = 0; zero = 1;

            result_exp = 0;
    end

    always @(posedge clk) begin // apply test vectors on rising edge of clk
            if (vectornum < 23) begin
                a = a_testvec[vectornum];
                b = b_testvec[vectornum];
                ALUControl = ALUControl_testvec[vectornum];
                result_exp = result_expvec[vectornum];
                zero_exp = zero_expvec[vectornum];
            end
    end

    always @(negedge clk) begin
        if (vectornum < 23) begin
            if (result !== result_exp || zero !== zero_exp) begin
                $display("Error at vector %0d:", vectornum);
                $display("  input a = %b", a);
                $display("  input b = %b", b);
                $display("  input ALUControl = %b", ALUControl);
                $display("  output result = %b (expected %b)", result, result_exp);
                $display("  output zero = %b (expected %b)", zero, zero_exp);
                errors = errors + 1;
            end

            vectornum = vectornum + 1;
            if (vectornum == 23) begin
                $display("Test completed: %0d errors", errors);
                $finish; // Usar $stop para que no se cierre ModelSim
            end
        end
    end
endmodule
