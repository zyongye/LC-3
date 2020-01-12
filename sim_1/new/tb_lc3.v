`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:17:18 PM
// Design Name: 
// Module Name: tb_lc3
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


module tb_lc3(

    );
    reg clk = 0;
    
    always #5 clk = ~clk;
    
    LC3 uut(
        .clk(clk)
    );
    
endmodule
