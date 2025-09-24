`timescale 1ns / 1ps

module flopr
    #(parameter N = 64)
    (
    input logic clk, reset,
    input logic [N-1:0] d,

    output logic [N-1:0] q
    );

    always_ff @(posedge clk, posedge reset) begin
        if (reset) q <=  {N{1'b0}};
        else q <= d;
    end

endmodule
