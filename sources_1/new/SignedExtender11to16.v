`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:37:37 PM
// Design Name: 
// Module Name: SignedExtender11to16
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


module SignedExtender11to16(
    input [10:0] in,
    output reg [15:0] out
    );

    always @(*) begin
        out[10:0] = in[10:0];
        if(in[10])
            out[15:11] = 11'b11111;
        else
            out[15:11] = 0;
    end
endmodule
