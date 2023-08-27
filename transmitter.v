`timescale 1ps
module transmitter(input[3:0] n, input clk,  input reg[10:0] frame, output reg rxd);
    // assume there is no hold_register in this architecutre and the transmit data is passed
    // directly, but in real life there is a hold_register 
    reg[3:0] counter;
    reg[3:0] num_bit;
    initial begin
        counter = 4'd0;
        num_bit = 4'd0;
    end
    always @ (posedge clk) begin
        if (num_bit != 11) begin 
            if (counter == n/2) begin
                    rxd <= frame[num_bit];
                    counter <= 0;
                    num_bit <= num_bit + 1;
            end else begin counter <= counter+1;end  
        end else if (num_bit!=11 && (num_bit==0 || num_bit > 9)) begin
            num_bit <= num_bit + 1; 
        end
    end
endmodule
