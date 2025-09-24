// CONTROLLER

module controller(
	input logic [10:0] instr,
	input logic reset, ExcAck, ExtIRQ,

	output logic [3:0] AluControl,
	output logic [1:0] AluSrc,
	output logic reg2loc, regWrite, Branch,
					memtoReg, memRead, memWrite,

	output logic ExtIAck, ERet, Exc,
	output logic [3:0] EStatus
	);

	logic [1:0] AluOp_s;

	maindec decPpal(
		.Op(instr),
		.reset(reset),
		.ExtIRQ(ExtIRQ),
		.Reg2Loc(reg2loc),
		.ALUSrc(AluSrc),
		.MemtoReg(memtoReg),
		.RegWrite(regWrite),
		.MemRead(memRead),
		.MemWrite(memWrite),
		.Branch(Branch),
		.ALUOp(AluOp_s),
		.Exc(Exc),
		.ERet(ERet),
		.EStatus(EStatus)
	);

	aludec decAlu(
		.funct(instr),
		.aluop(AluOp_s),
		.alucontrol(AluControl)
	);

	assign ExtIAck = ExcAck && ExtIRQ;

endmodule
