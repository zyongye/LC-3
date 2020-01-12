`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:34:39 PM
// Design Name: 
// Module Name: SR1MUX
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


module SR1MUX(
    input [2:0] IR11to9,
    input [2:0] IR8to6,
    input SR1MUX,
    output reg [2:0] SR1
    );

    initial SR1 = 0;

    always @(*) begin
        case (SR1MUX) 
            2'b00: SR1 = IR11to9;
            2'b01: SR1 = IR8to6;
            2'b10: SR1 = 3'b110;
            default: SR1 = 0;
        endcase
    end

endmodule
