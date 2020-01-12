`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Yongye Zhu
// 
// Create Date: 12/20/2019 03:07:56 PM
// Design Name: 
// Module Name: Memory
// Project Name: LC3 Processor
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


module Memory(
    //***Clock Signal***
    input clk,
    //******************

    //******************
    // Single bit control input
    input GateMDR,
    input LDMAR,
    input LDMDR,
    input MIOEN,
    input RW,
    //******************

    //******************
    // Multi-bit data from bus
    input [15:0] MARFromBus,
    input [15:0] MDRFromBus,
    //******************

    //******************
    // Single bit signal to control
    output R,
    //******************

    //******************
    // Multi-bit output to bus
    output [15:0] MDRToBus
    //******************

    );

    reg [15:0] MAR = 0, MDR = 0;
    reg [15:0] MUXToMDR = 0;
    
    wire [15:0] MDRFromMemory;

    Mem main_memory(
        .clk(clk),
        .addr(MAR),
        .inData(MDR),
        .MIOEN(MIOEN),
        .RW(RW),
        .R(R),
        .outData(MDRFromMemory)
        );

    always @(*) begin
        if(MIOEN)
            MUXToMDR = MDRFromMemory;
        else 
            MUXToMDR = MARFromBus;
    end

    always @(posedge clk) begin
        if(LDMAR) MAR <= MARFromBus;
        if(LDMDR) MDR <= MUXToMDR;
    end

    TriStateBuffer16b MDRBuffer(
            .in(MDR),
            .triStateCtrl(GateMDR),
            .out(MDRToBus)
        );

endmodule
