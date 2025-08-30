`timescale 1ns / 1ps

module imem_tb;
    parameter N = 32;

    logic clk;
    logic [5:0] addr;
    logic [N-1:0] q, qexpected;

    logic [31:0] vectornum, errors;
    logic [N-1:0] expvec [0:49] ='{32'hf8000001,32'hf8008002,32'hf8000203,32'h8b050083,32'hf8018003,32'hcb050083,32'hf8020003,
    32'hcb0a03e4,32'hf8028004,32'h8b040064,32'hf8030004,32'hcb030025,32'hf8038005,32'h8a1f0145,32'hf8040005,32'h8a030145,
    32'hf8048005,32'h8a140294,32'hf8050014,32'haa1f0166,32'hf8058006,32'haa030166,32'hf8060006,32'hf840000c,32'h8b1f0187,
    32'hf8068007,32'hf807000c,32'h8b0e01bf,32'hf807801f,32'hb4000040,32'hf8080015,32'hf8088015,32'h8b0103e2,32'hcb010042,
    32'h8b0103f8,32'hf8090018,32'h8b080000,32'hb4ffff82,32'hf809001e,32'h8b1e03de,32'hcb1503f5,32'h8b1403de,32'hf85f83d9,
    32'h8b1e03de,32'h8b1003de,32'hf81f83d9,32'hb400001f, 32'b0, 32'b0, 32'b0};

    // instantiate device under test
    imem #(N) dut(.addr(addr), .q(q));

    // generate clock
    always begin  // no sensitivity list, so it always executes
            clk = 1; #5; clk = 0; #5;
    end

    // at start of test pulse reset
    initial begin
            vectornum = 0; errors = 0;
            addr = 0; q = 0; qexpected = 0;
    end

    always @(posedge clk) begin // apply test vectors on rising edge of clk
            if (vectornum < 50) begin
                addr = vectornum;
                qexpected = expvec[vectornum];
            end
    end

    always @(negedge clk) begin
        if (vectornum < 50) begin
            if (q !== qexpected) begin
                $display("Error at vector %0d:", vectornum);
                $display("  input addr = %d", addr);
                $display("  output q = %h (expected %h)", q, qexpected);
                errors = errors + 1;
            end

            vectornum = vectornum + 1;
            if (vectornum == 50) begin
                $display("Test completed: %0d errors", errors);
                $finish; // Usar $stop para que no se cierre ModelSim
            end
        end
    end
endmodule
