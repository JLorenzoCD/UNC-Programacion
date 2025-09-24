module maindec(
	input logic [10:0] Op,
	input logic reset, ExtIRQ,

	output logic [1:0] ALUSrc,
	output logic Reg2Loc, MemtoReg, RegWrite,
					MemRead, MemWrite, Branch,
	output logic [1:0] ALUOp,
	output logic Exc, ERet,
	output logic [3:0] EStatus
	);

	logic NotAnInstr;

    always_comb begin
		if (!ExtIRQ) begin
			if (reset) begin
				{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b0_00_0_0_0_0_0_00;
				NotAnInstr = 1'b0;
				EStatus = 4'b0000;
				ERet = 1'b0;
			end else begin
				casez(Op)
					11'b111_1100_0010: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b0_01_1_1_1_0_0_00;  //LDUR
						NotAnInstr = 1'b0;
						EStatus = 4'b0000;
						ERet = 1'b0;
					end
					11'b111_1100_0000: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b1_01_0_0_0_1_0_00;  //STUR
						NotAnInstr = 1'b0;
						EStatus = 4'b0000;
						ERet = 1'b0;
					end
					11'b101_1010_0???: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b1_00_0_0_0_0_1_01;  //CBZ
						NotAnInstr = 1'b0;
						EStatus = 4'b0000;
						ERet = 1'b0;
					end

					11'b100_0101_1000: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b0_00_0_1_0_0_0_10;  //ADD
						NotAnInstr = 1'b0;
						EStatus = 4'b0000;
						ERet = 1'b0;
					end
					11'b110_0101_1000: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b0_00_0_1_0_0_0_10;  //SUB
						NotAnInstr = 1'b0;
						EStatus = 4'b0000;
						ERet = 1'b0;
					end
					11'b100_0101_0000: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b0_00_0_1_0_0_0_10;  //AND
						NotAnInstr = 1'b0;
						EStatus = 4'b0000;
						ERet = 1'b0;
					end
					11'b101_0101_0000: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b0_00_0_1_0_0_0_10;  //ORR
						NotAnInstr = 1'b0;
						EStatus = 4'b0000;
						ERet = 1'b0;
					end

					11'b1101011_0000: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b0_00_0_1_0_0_0_10;  //BR
						NotAnInstr = 1'b0;
						EStatus = 4'b0000;
						ERet = 1'b0;
					end

					11'b1101011_0100: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b0_00_0_0_0_0_1_01;  //ERET
						NotAnInstr = 1'b0;
						EStatus = 4'b0000;
						ERet = 1'b1;
					end
					11'b1101010_1001: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b1_10_0_1_0_0_0_01;  //MRS
						NotAnInstr = 1'b0;
						EStatus = 4'b0000;
						ERet = 1'b0;
					end

					default: begin
						{Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 11'b0_00_0_0_0_0_0_00;
						NotAnInstr = 1'b1;
						EStatus = 4'b0010;
						ERet = 1'b0;
					end
				endcase
			end
		end else begin
			EStatus = 4'b0001;
		end
	end
	assign Exc = NotAnInstr || ExtIRQ;

endmodule
