`timescale 1ps
module uart(input clk, output reg [10:0] receiver_frame);
    reg[10:0] trans_frame;
    initial begin
        trans_frame[0] = 0;
        trans_frame[10] = 0;
        trans_frame[9] = 0;
        trans_frame[1] = 0;
        trans_frame[2] = 1;
        trans_frame[3] = 0;
        trans_frame[4] = 0;
        trans_frame[5] = 1;
        trans_frame[6] = 0;
        trans_frame[7] = 0;
        trans_frame[8] = 0;
    end
    wire [3:0] n;
    clk_generator blck(clk,n);

    wire rxd;
    transmitter trans(n, clk, trans_frame, rxd);

    receiver receiver(n, clk, rxd, receiver_frame); 
endmodule
