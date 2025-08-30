`timescale 1ns / 1ps

module regfile_tb;
    logic clk;
    logic we3;
    logic [4:0] ra1, ra2, wa3;
    logic [63:0] wd3, rd1, rd2;

    logic [63:0] rd1exp, rd2exp;

    logic [31:0] vectornum, errors;

    logic [63:0] rd1expvec [0:34] = {64'd0, 64'd1, 64'd2, 64'd3, 64'd4, 64'd5, 64'd6, 64'd7, 64'd8, 64'd9,
    64'd10,64'd11, 64'd12, 64'd13, 64'd14, 64'd15, 64'd16, 64'd17, 64'd18, 64'd19,
    64'd20, 64'd21, 64'd22, 64'd23, 64'd24, 64'd25, 64'd26, 64'd27, 64'd28, 64'd29,
    64'd30, 64'd0, 64'd200, 64'd200, 64'd0};
    logic [63:0] rd2expvec [0:34] = {64'd0, 64'd1, 64'd2, 64'd3, 64'd4, 64'd5, 64'd6, 64'd7, 64'd8, 64'd9,
    64'd10,64'd11, 64'd12, 64'd13, 64'd14, 64'd15, 64'd16, 64'd17, 64'd18, 64'd19,
    64'd20, 64'd21, 64'd22, 64'd23, 64'd24, 64'd25, 64'd26, 64'd27, 64'd28, 64'd29,
    64'd30, 64'd0, 64'd5, 64'd111, 64'd0};

    // instantiate device under test
    regfile dut(.clk(clk), .we3(we3), .ra1(ra1),
                .ra2(ra2), .wa3(wa3), .wd3(wd3),
                .rd1(rd1), .rd2(rd2)
            );

    // generate clock
    always begin  // no sensitivity list, so it always executes
            clk = 1; #5; clk = 0; #5;
    end

    initial begin
            vectornum = 0; errors = 0;

            we3 = 0; ra1 = 0 ;ra2 = 0; wa3 = 0; wd3 = 0;
            rd1 = 0; rd2 = 0; rd1exp = 0; rd2exp = 0;
    end

    always @(posedge clk) begin // apply test vectors on rising edge of clk
            // Se revisa que los valores iniciales sean los esperados
            if (vectornum < 32) begin
                ra1 = vectornum;
                ra2 = vectornum;
            end

            // Guardando datos: X1 = 200;
            if (vectornum == 32) begin
                ra1 = 5'd1;
                ra2 = 5'd5;

                we3 = 1'b1;
                wa3 = 5'd1;
                wd3 = 64'd200;
            end

            // Guardando datos: X10 = 111;
            if (vectornum == 33)begin
                ra2 = 5'd10;

                we3 = 1'b1;
                wa3 = 5'd10;
                wd3 = 64'd111;
            end

            // Se intenta guardar datos en X31 (XZR): X31 = 999; No debería de pasar.
            if (vectornum == 34)begin
                ra1 = 5'd31;
                ra2 = 5'd0;

                we3 = 1'b1;
                wa3 = 5'd31;
                wd3 = 64'd999;
            end

            if (vectornum < 35) begin
                rd1exp = rd1expvec[vectornum];
                rd2exp = rd2expvec[vectornum];
            end
    end

    always @(negedge clk) begin
        if (vectornum < 35) begin
            if (rd1 !== rd1exp || rd2 !== rd2exp) begin
                $display("Error at vector %0d:", vectornum);

                $display("  input ra1 = %d", ra1);
                $display("  input ra2 = %d", ra2);
                $display("  input we3 = %d", we3);
                $display("  input wa3 = %d", wa3);
                $display("  input wd3 = %d", wd3);

                $display("  output rd1 = %h (expected %h)", rd1, rd1exp);
                $display("  output rd2 = %h (expected %h)", rd2, rd2exp);
                errors = errors + 1;
            end

            vectornum = vectornum + 1;
            if (vectornum == 35) begin
                $display("Test completed: %0d errors", errors);
                $finish; // Usar $stop para que no se cierre ModelSim
            end
        end
    end
endmodule
