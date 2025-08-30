`timescale 1ns / 1ps

module flopr_tb;
    parameter N = 64;

    logic clk, reset;
    logic [N-1:0] d, q;
    logic [N-1:0] qexpected;

    logic [31:0] vectornum, errors;
    logic [N-1:0] test_vectors [0:9];
    logic [N-1:0] expected_vectors [0:9];

    // instantiate device under test
    flopr #(N) dut(.clk(clk), .reset(reset), .d(d), .q(q));

    // generate clock
    always begin  // no sensitivity list, so it always executes

            clk = 1; #5; clk = 0; #5;
    end

    // at start of test pulse reset
    initial begin
            test_vectors[0] = 64'd1; expected_vectors[0] = 64'd0;
            test_vectors[1] = 64'd2; expected_vectors[1] = 64'd0;
            test_vectors[2] = 64'd3; expected_vectors[2] = 64'd0;
            test_vectors[3] = 64'd4; expected_vectors[3] = 64'd0;
            test_vectors[4] = 64'd5; expected_vectors[4] = 64'd0;

            test_vectors[5] = 64'd6; expected_vectors[5] = 64'd6;
            test_vectors[6] = 64'd7; expected_vectors[6] = 64'd7;
            test_vectors[7] = 64'd8; expected_vectors[7] = 64'd8;
            test_vectors[8] = 64'd9; expected_vectors[8] = 64'd9;
            test_vectors[9] = 64'd10; expected_vectors[9] = 64'd10;


            vectornum = 0; errors = 0; reset = 1; d = 0; q = 0; qexpected = 0; #50;
            reset = 0;
    end

    always @(posedge clk) begin // apply test vectors on rising edge of clk
            if (vectornum < 10) begin
                d = test_vectors[vectornum];
                qexpected = expected_vectors[vectornum];
            end
    end

    always @(negedge clk) begin
        if (vectornum < 10) begin
            if (q !== qexpected) begin
                $display("Error at vector %0d:", vectornum);
                $display("  input d = %h", d);
                $display("  output q = %h (expected %h)", q, qexpected);
                errors = errors + 1;
            end

            vectornum = vectornum + 1;
            if (vectornum == 10) begin
                $display("Test completed: %0d errors", errors);
                $finish; // Usar $stop para que no se cierre ModelSim
            end
        end
    end

endmodule
