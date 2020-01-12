`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2019 11:03:56 PM
// Design Name: 
// Module Name: Mem
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


module Mem(
    input clk,
    input [15:0] addr,
    input [15:0] inData,
    input MIOEN,
    input RW,
    output reg R,
    output [15:0] outData
    );

    reg [15:0] memory[65535:0]; 

    initial begin
        R = 0;
        memory[12288] = 16'h5260;
        memory[12289] = 16'h56E0;
        memory[12290] = 16'h2009;
        memory[12291] = 16'h126A;
        memory[12292] = 16'h0405;
        memory[12293] = 16'h6400;
        memory[12294] = 16'h16C2;
        memory[12295] = 16'h1021;
        memory[12296] = 16'h127F;
        memory[12297] = 16'h0FFA;
        memory[12298] = 16'hB602;
        memory[12299] = 16'hF025;
        memory[12300] = 16'h3100;
        memory[12301] = 16'h3200;
        
        memory[12544] = 1;
        memory[12545] = 2;
        memory[12546] = 3;
        memory[12547] = 4;
        memory[12548] = 5;
        memory[12549] = 6;
        memory[12550] = 7;
        memory[12551] = 8;
        memory[12552] = 9;
        memory[12553] = 10;
    end
    always @(posedge clk) begin
        if(MIOEN) begin
            R <= 1;
            if(RW) begin
                memory[addr] <= inData;
            end
        end
    end
    
    assign outData = memory[addr];
    
endmodule
