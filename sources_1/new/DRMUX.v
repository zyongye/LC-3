`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:29:34 PM
// Design Name: 
// Module Name: DRMUX
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


module DRMUX(
    input [2:0] IR11to9,
    input DRMUX,
    output reg [2:0] DR
    );

    initial DR = 0;

    always @(*) begin
        case (DRMUX)
        2'b00: DR = IR11to9;
        2'b01: DR = 3'b111;
        2'b10: DR = 3'b110;
        default: DR = 3'b000;
        endcase
    end

endmodule
