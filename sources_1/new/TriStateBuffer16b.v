`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2019 11:24:29 PM
// Design Name: 
// Module Name: TriStateBuffer16b
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


module TriStateBuffer16b(
    input [15:0] in,
    input triStateCtrl,
    output reg [15:0] out
    );

    initial out = 16'hZZZZ;


    always @(*) begin
        out = triStateCtrl? in : 16'hZZZZ;
    end


endmodule
