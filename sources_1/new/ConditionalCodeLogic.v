`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 06:17:51 PM
// Design Name: 
// Module Name: ConditionalCodeLogic
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


module ConditionalCodeLogic(
    input clk,
    input [15:0] dataFromBus,
    input LDCC,
    output reg [2:0] NZP
    );

    reg [2:0] temp_conditional_code = 0;

    always @(*) begin
        if(dataFromBus[15] == 1'b1)
            temp_conditional_code = 3'b100;
        else if(dataFromBus[14:0] == 0)
            temp_conditional_code = 3'b010;
        else
            temp_conditional_code = 3'b001;
    end

    always @(posedge clk) begin
        if(LDCC)
            NZP = temp_conditional_code;
    end

endmodule
