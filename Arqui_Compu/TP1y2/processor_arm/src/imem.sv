`timescale 1ns / 1ps

module imem
    #(parameter N = 32)
    (
    input logic [5:0] addr,
    output logic [N-1:0] q
    );

    logic [N-1:0] ROM [0:63] = '{default: '0};

    initial begin
        // Funcionan bien con un #900 en el tb del procesador
        $readmemh("tp2_1_default.mem", ROM);
        // $readmemh("tp2_2a.mem", ROM);
        // $readmemh("tp2_2b.mem", ROM);
        // $readmemh("tp2_2c.mem", ROM);
    end

    always_comb begin
        if (addr < 64) q = ROM[addr];
        else q = {N{1'b0}};
    end

endmodule
