`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:38:47 PM
// Design Name: 
// Module Name: SignedExtender6to16
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


module SignedExtender6to16(
    input [5:0] in,
    output reg [15:0] out
    );
    always @(*) begin
        out[5:0] = in[5:0];
        if(in[5])
            out[15:6] = 10'b1111111111;
        else
            out[15:6] = 0;
    end

endmodule
