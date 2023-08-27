`timescale 1ps
module clk_generator(   input clk, 
                        output reg[3:0] n);
    always @(posedge clk) begin 
        n <= 1; 
    end
endmodule
