`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:21:39 PM
// Design Name: 
// Module Name: uSequencer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uSequencer(
    input [4:0] IR_15_To_11,
    input INT,
    input PSR_15,
    input BEN,
    input R,
    input IRD,
    input [2:0] COND,
    input [5:0] J,
    output reg [5:0] uPC
    );

    always @(*) begin
        if(IRD)
            uPC = {2'b00, IR_15_To_11[4:1]};
        else begin
            uPC[5] = J[5];
            uPC[4] = J[4] | (COND[2] & (~COND[1]) & COND[0] & INT);
            uPC[3] = J[3] | (COND[2] & (~COND[1]) & (~COND[0]) & PSR_15);
            uPC[2] = J[2] | ((~COND[2]) & COND[1] & (~COND[0]) & BEN);
            uPC[1] = J[1] | ((~COND[2]) & (~COND[1]) & COND[0] & R);
            uPC[0] = J[0] | ((~COND[2]) & COND[1] & COND[0] & IR_15_To_11[0]);
        end
    end

endmodule
