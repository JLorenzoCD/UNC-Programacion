`timescale 1ns / 1ps

module maindec_tb;
    logic clk;

    logic [10:0] Op;
    logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    logic [1:0] ALUOp;

    logic [31:0] vectornum, errors;
    logic [8:0] resultexp;

    /*
    LDUR 111_1100_0010
    STUR 111_1100_0000
    CBZ 101_1010_0???
    ADD 100_0101_1000
    SUB 110_0101_1000
    AND 100_0101_0000
    ORR 101_0101_0000
    */
    logic [10:0] testvect [7:0] = '{11'b111_1100_0010, 11'b111_1100_0000, 11'b101_1010_0000,
        11'b100_0101_1000, 11'b110_0101_1000, 11'b100_0101_0000, 11'b101_0101_0000,
        11'b1
    };
    logic [8:0] expvec [7:0] = '{11'b0111100_00, 11'b1100010_00, 11'b1000001_01,
        11'b0001000_10, 11'b0001000_10, 11'b0001000_10, 11'b0001000_10,
        11'b0000000_00
    };

    maindec dut(
        .Op(Op),
        .Reg2Loc(Reg2Loc), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), .RegWrite(RegWrite),
        .MemRead(MemRead),.MemWrite(MemWrite), .Branch(Branch), .ALUOp(ALUOp)
    );

    always begin
            clk = 1; #5; clk = 0; #5;
    end

    initial begin
            vectornum = 0; errors = 0;
            resultexp = 0;

            Op = 0;
            Reg2Loc = 0; ALUSrc = 0; MemtoReg = 0; RegWrite = 0; MemRead = 0;
            MemWrite = 0; Branch = 0; ALUOp = 0;
    end

    always @(posedge clk) begin
            if (vectornum < 8) begin
                Op = testvect[vectornum];
                resultexp = expvec[vectornum];
            end
    end

    always @(negedge clk) begin
        if (vectornum < 8) begin
            if ({Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} !== resultexp) begin
                $display("Error at vector %0d:", vectornum);
                $display("  input Op = %d", Op);
                $display("  output Reg2Loc = %b (expected %b)", Reg2Loc, resultexp[0]);
                $display("  output ALUSrc = %b (expected %b)", ALUSrc, resultexp[1]);
                $display("  output MemtoReg = %b (expected %b)", MemtoReg, resultexp[2]);
                $display("  output RegWrite = %b (expected %b)", RegWrite, resultexp[3]);
                $display("  output MemRead = %b (expected %b)", MemRead, resultexp[4]);
                $display("  output MemWrite = %b (expected %b)", MemWrite, resultexp[5]);
                $display("  output Branch = %b (expected %b)", Branch, resultexp[6]);
                $display("  output ALUOp = %b (expected %b)", ALUOp, resultexp[8:7]);
                errors = errors + 1;
            end

            vectornum = vectornum + 1;
            if (vectornum == 8) begin
                $display("Test completed: %0d errors", errors);
                $finish; // Usar $stop para que no se cierre ModelSim
            end
        end
    end

endmodule
