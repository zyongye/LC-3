`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2019 11:28:43 PM
// Design Name: 
// Module Name: tb_triStateBuffer
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


module tb_triStateBuffer;
    reg [15:0] in;
    reg ctrl;
    wire [15:0] out;
    
    TriStateBuffer16b uut(.in(in),
                      .triStateCtrl(ctrl),
                      .out(out)
                      );
    
    initial begin
        in = 1234;
        #20
        in = 3245;
        ctrl = 1;
        #20
        ctrl = 0;
    
    end
    
endmodule
