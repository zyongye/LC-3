`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:39:09 PM
// Design Name: 
// Module Name: SignedExtender5to16
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


module SignedExtender5to16(
    input [4:0] in,
    output reg [15:0] out
    );

    always @(*) begin
        out[4:0] = in[4:0];
        if(in[4])
            out[15:5] = 11'b11111111111;
        else
            out[15:5] = 0;
    end


endmodule
