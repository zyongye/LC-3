`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 01:35:14 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input [15:0] PCFromBus,
    input [15:0] PCFromAdder,
    input [1:0] PCMUX,
    input LDPC,
    input GatePC,
    output reg [15:0] PC,
    output [15:0] PCToBus
    );

    reg [15:0]  MUXToPC = 0;

    initial PC = 16'h3000;
    

    always @(*) begin
        case(PCMUX)
            2'b00: MUXToPC = PC + 1;
            2'b01: MUXToPC = PCFromBus;
            2'b10: MUXToPC = PCFromAdder;
            default: MUXToPC = PC;
        endcase
    end

    always @(posedge clk) begin
        if(LDPC)
            PC <= MUXToPC;
    end

    TriStateBuffer16b PCBuffer(
        .in(PC),
        .triStateCtrl(GatePC),
        .out(PCToBus)
    );


endmodule
