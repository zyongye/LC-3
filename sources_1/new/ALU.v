`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2019 03:07:20 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [15:0] A,
    input [15:0] B,
    input [1:0] ALUK,
    input GateALU,
    output [15:0] ALU_Out
    );

    reg [15:0] out_to_tri = 0;

    always @(*) begin
        case(ALUK) 
            2'b00: out_to_tri = A + B;
            2'b01: out_to_tri = A & B;
            2'b10: out_to_tri = ~A;
            2'b11: out_to_tri = A;
            default: out_to_tri = 0;
        endcase
    end

    TriStateBuffer16b ALUBuffer(
        .in(out_to_tri),
        .triStateCtrl(GateALU),
        .out(ALU_Out)
    );

endmodule
