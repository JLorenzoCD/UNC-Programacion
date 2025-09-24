`timescale 1ns / 1ps

module fetch_tb;
    logic [31:0] MAX_VECTORS = 13;

    logic clk, reset;

    logic PCSrc_F;
    logic [63:0] PCBranch_F, imem_addr_F;
    logic [63:0] prevPC, expPC;

    logic [31:0] cyclesnum, errors;

    fetch dut(
        .PCSrc_F(PCSrc_F), .clk(clk), .reset(reset), .PCBranch_F(PCBranch_F),
        .imem_addr_F(imem_addr_F)
        );

    always begin
        clk = 1; #5; clk = 0; #5;
    end

    initial begin
        cyclesnum = 0; errors = 0;

        PCSrc_F = 0; PCBranch_F = 64'd10_016;
        imem_addr_F = 0; prevPC = 0;

        reset = 1; #50;
        reset = 0;
    end

    always @(negedge clk) begin
        if (cyclesnum < MAX_VECTORS) begin
            // Variables temporales del bloque always para legibilidad
            automatic logic case_reset1 = (reset == 1 && imem_addr_F !== 0);
            automatic logic case_reset0_range_6_9 = (reset == 0 && cyclesnum >= 6 && cyclesnum < 10 && expPC !== imem_addr_F);
            automatic logic case_reset0_10 = (reset == 0 && cyclesnum == 10 && PCBranch_F !== imem_addr_F);
            automatic logic case_reset0_range_10_12 = (reset == 0 && cyclesnum > 10 && cyclesnum < 13 && expPC !== imem_addr_F);

            if (case_reset1 || case_reset0_range_6_9 || case_reset0_10 || case_reset0_range_10_12) begin
                $display("Error at cycle %0d:", cyclesnum);
                $display("  input PCSrc_F = %b", PCSrc_F);
                $display("  input reset = %b", reset);
                $display("  input PCBranch_F = %0d", PCBranch_F);
                $display("  output imem_addr_F = %0d (expected %0d)", imem_addr_F, expPC);
                errors = errors + 1;
            end

            // En el flanco bajo del ckl se establece el valor del PC previo y el esperado
            prevPC = imem_addr_F;
            expPC = prevPC + 64'd4;

            if (cyclesnum == 9) begin
                // En el ciclo 10 se pone PCSrc_F en 1, cambiando el valor del PC
                PCSrc_F = 1;
                expPC = PCBranch_F;
            end else if (cyclesnum == 10) begin
                // En el ciclo 11 se desactiva el PCSrc_F para que no se quede el PC
                // clavado en el valor del PCBranch_F
                PCSrc_F = 0;
            end

            cyclesnum = cyclesnum + 1;
            if (cyclesnum == MAX_VECTORS) begin
                $display("Test completed: %0d errors", errors);
                $finish; // Usar $stop para que no se cierre ModelSim
            end
        end
    end
endmodule
