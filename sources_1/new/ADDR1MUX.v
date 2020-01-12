`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:42:36 PM
// Design Name: 
// Module Name: ADDR1MUX
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


module ADDR1MUX(
    input ADDR1MUX,
    input [15:0] ADDR1FromPC,
    input [15:0] ADDR1FromRF,
    output reg [15:0] ADDR1
    );

    initial ADDR1 = 0;

    always @(*) begin
        if(ADDR1MUX)
            ADDR1 = ADDR1FromRF;
        else
            ADDR1 = ADDR1FromPC;
    end


endmodule
