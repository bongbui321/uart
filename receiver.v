`timescale 1ps
module receiver(input [3:0] n, 
                input clk,
                input rxd,
                output reg[10:0] frame);
    reg [3:0] counter;
    reg[3:0] num_bit;
    initial begin 
        counter= 4'd0; 
        num_bit = 4'd0;
    end
    always @(posedge clk) begin 
        if (num_bit != 11  && num_bit > 0 && num_bit < 9) begin 
            if (counter == n/2) begin
                frame[num_bit] <= rxd;
                //if (num_bit > 1)begin $display(frame[num_bit-1]);end
                num_bit <= num_bit + 1;
            end else begin counter <= counter + 1; end
        end else if (num_bit!=11 && (num_bit == 0  || num_bit > 9)) begin
            num_bit <= num_bit + 1;
        end 
    end
endmodule 
