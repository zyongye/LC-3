`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:47:10 PM
// Design Name: 
// Module Name: BENLogic
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


module BENLogic(
    input clk,
    input [2:0] IR11to9,
    input N,
    input Zero,
    input P,
    output reg BEN
    );

    wire BENResult;
    assign BENResult = (IR11to9[2] & N) | (IR11to9[1] & Zero) | (IR11to9[0] & P);

    always @(posedge clk) begin
        BEN <= BENResult;
    end

endmodule
