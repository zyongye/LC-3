`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 07:15:41 PM
// Design Name: 
// Module Name: SR2MUX
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


module SR2MUX(
    input SR2MUX,       //this value come from IR[5]
    input [15:0] SR2FromRF,
    input [15:0] Imm5,
    output reg [15:0] SR2
    );

    initial SR2 = 0;
    always @(*) begin
        if(SR2MUX)
            SR2 = Imm5;
        else
            SR2 = SR2FromRF; 
    end

endmodule
