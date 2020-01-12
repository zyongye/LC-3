`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:38:17 PM
// Design Name: 
// Module Name: SignedExtender9to16
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


module SignedExtender9to16(
    input [8:0] in,
    output reg [15:0] out
    );

    always @(*) begin
        out[8:0] = in[8:0];
        if(in[8])
            out[15:9] = 17'b1111111;
        else
            out[15:9] = 0;
    end
endmodule
