`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:33:00 PM
// Design Name: 
// Module Name: MARMUX
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


module MARMUX(
    input MARMUX,
    input GateMARMUX,
    input [15:0] MARFromExtender,
    input [15:0] MARFromAdder,
    output [15:0] MARToBus
    );

    reg [15:0] MARData = 0;

    always @(*) begin
        if(MARMUX)
            MARData = MARFromAdder;
        else
            MARData = MARFromExtender;
    end

    TriStateBuffer16b MARBuffer(
        .in(MARData),
        .triStateCtrl(GateMARMUX),
        .out(MARToBus)
    );

endmodule
