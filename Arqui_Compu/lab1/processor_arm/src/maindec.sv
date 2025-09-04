`timescale 1ns / 1ps

module maindec(
    input logic [10:0] Op,

    output logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch,
    output logic [1:0] ALUOp
    );

    always_comb begin
        casez(Op)
			11'b111_1100_0010: {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 10'b0_1_1_1_1_0_0_00;  //LDUR
			11'b111_1100_0000: {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 10'b1_1_0_0_0_1_0_00;  //STUR
			11'b101_1010_0???: {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 10'b1_0_0_0_0_0_1_01;  //CBZ

			11'b100_0101_1000: {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 10'b0_0_0_1_0_0_0_10;  //ADD
		   	11'b110_0101_1000: {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 10'b0_0_0_1_0_0_0_10;  //SUB
		   	11'b100_0101_0000: {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 10'b0_0_0_1_0_0_0_10;  //AND
			11'b101_0101_0000: {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 10'b0_0_0_1_0_0_0_10;  //ORR
            default: {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 10'b0;
        endcase
    end

endmodule
