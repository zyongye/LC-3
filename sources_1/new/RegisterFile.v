`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 10:53:57 PM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input clk,
    input [15:0] inData,
    input [2:0] DR,
    input [2:0] SR1,
    input [2:0] SR2,
    input LDREG,

    output [15:0] SR1OUT,
    output [15:0] SR2OUT 
    );

    reg [15:0] registerFile[7:0];

    always @(posedge clk) begin
        if(LDREG)
            registerFile[DR] = inData;
    end

    assign SR1OUT = registerFile[SR1];
    assign SR2OUT = registerFile[SR2];

endmodule
