`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 12:02:44 PM
// Design Name: 
// Module Name: tb_mem
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


module tb_mem;
    reg clk = 0;
    reg [15:0] addr = 0;
    reg [15:0] inData = 0;
    reg MIOEN = 0, RW = 0;
    wire [15:0] outData;
    wire R;

    Mem uut(
        .clk(clk),
        .addr(addr),
        .inData(inData),
        .MIOEN(MIOEN),
        .RW(RW),
        .outData(outData),
        .R(R)
        );
    
    always #5 clk = ~clk;
        
    initial begin
        inData = 1234;
        addr = 16'h3000;
        MIOEN = 1;
        RW = 1;
    #10
        inData = 1235;
        addr = 16'h3001;
        MIOEN = 1;
        RW = 1;
    #10
        addr = 16'h3000;
        MIOEN = 1;
        RW = 0;
    #10
        MIOEN = 0;
    end
    
endmodule
