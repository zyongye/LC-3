`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2019 11:00:46 PM
// Design Name: 
// Module Name: tb_ALU
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


module tb_ALU; 

    reg [15:0] A, B;
    reg [1:0] ALUK;
    wire [15:0] out;
    
    ALU uut(.A(A),
            .B(B),
            .ALUK(ALUK),
            .out_to_tri(out)
    );
    
    initial begin
        A = 0;
        B = 0;
        ALUK = 0;
        #10
        A = 1234;
        B = 2345;
        #10
        A = 16'h1234;
        B = 16'hFFF0;
        ALUK = 1;
        #10
        ALUK = 2;
        #10
        ALUK = 3;
    end
       
    
endmodule
