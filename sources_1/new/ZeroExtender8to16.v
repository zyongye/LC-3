`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:36:57 PM
// Design Name: 
// Module Name: ZeroExtender8to16
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


module ZeroExtender8to16(
    input [7:0] in,
    output [15:0] out
    );

    assign out[7:0] = in[7:0];
    assign out[15:8] = 0;

endmodule
