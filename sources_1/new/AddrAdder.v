`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 07:13:57 PM
// Design Name: 
// Module Name: AddrAdder
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


module AddrAdder(
    input [15:0] A,
    input [15:0] B,
    output [15:0] out
    );

    assign out = A + B;

endmodule
