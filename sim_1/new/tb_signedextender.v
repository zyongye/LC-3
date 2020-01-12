`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:43:45 PM
// Design Name: 
// Module Name: tb_signedextender
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


module tb_signedextender;
    reg [4:0] in = 5'b11001;
    wire [15:0] out;
    
    SignedExtender5to16 uut(.in(in),
                            .out(out)
                            );

    initial begin
        #20 in = 5'b00111;  
    end

endmodule
