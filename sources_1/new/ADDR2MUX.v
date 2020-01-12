`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:54:33 PM
// Design Name: 
// Module Name: ADDR2MUX
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


module ADDR2MUX(
    input [1:0] ADDR2MUX,
    input [15:0] offset6,
    input [15:0] offset9,
    input [15:0] offset11,
    output reg [15:0] ADDR2
    );

    always @(*) begin
        case(ADDR2MUX)
            2'b00: ADDR2 = 0;
            2'b01: ADDR2 = offset6;
            2'b10: ADDR2 = offset9;
            2'b11: ADDR2 = offset11;
            default: ADDR2 = 0;
        endcase
    end

endmodule
