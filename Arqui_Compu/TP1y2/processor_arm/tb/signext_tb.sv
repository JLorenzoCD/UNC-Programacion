`timescale 1ns / 1ps

module signext_tb;
    logic clk;
    logic [31:0] a;
    logic [63:0] y, yexpected;

    logic [31:0] vectornum, errors;

    logic [31:0] test_vectors [0:7];
    logic [63:0] expected_vectors [0:7];

    // instantiate device under test
    signext dut(.a(a), .y(y));

    // generate clock
    always begin  // no sensitivity list, so it always executes
            clk = 1; #5; clk = 0; #5;
    end

    initial begin
            // LDUR + y -
            test_vectors[0] = 32'b111_1100_0010_000000001_00_00001_00010; expected_vectors[0] = 64'd1;
            test_vectors[1] = 32'b111_1100_0010_111111111_00_00001_00010; expected_vectors[1] = 0 - 64'd1;

            // STUR + y -
            test_vectors[2] = 32'b111_1100_0000_000000010_00_00001_00010; expected_vectors[2] = 64'd2;
            test_vectors[3] = 32'b111_1100_0000_111111110_00_00001_00010; expected_vectors[3] = 0 - 64'd2;

            // CBZ + y -
            test_vectors[4] = 32'b101_1010_0_0000000000000000011_00010; expected_vectors[4] = 64'd3;
            test_vectors[5] = 32'b101_1010_0_1111111111111111101_00010; expected_vectors[5] = 0 - 64'd3;

            // Random instructions
            test_vectors[6] = 32'hC0C4C014; expected_vectors[6] = '0;
            test_vectors[7] = 32'hFFFFFFFF; expected_vectors[7] = '0;


            vectornum = 0; errors = 0; a = 0; y = 0; yexpected = 0;
    end

    always @(posedge clk) begin // apply test vectors on rising edge of clk
            if (vectornum < 8) begin
                a = test_vectors[vectornum];
                yexpected = expected_vectors[vectornum];
            end
    end

    always @(negedge clk) begin
        if (vectornum < 8) begin
            if (y !== yexpected) begin
                $display("Error at vector %0d:", vectornum);
                $display("  input a = %h", a);
                $display("  output y = %h (expected %h)", y, yexpected);
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
