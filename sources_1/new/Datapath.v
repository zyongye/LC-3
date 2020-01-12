`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2019 03:07:11 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
//***Clock Signal***
    input clk,    
//******************

//***********************
// Multi-bit input from bus
    input [15:0] pcFromBus,
    input [15:0] regValueFromBus,
    input [15:0] irFromBus,
    input [15:0] testConditionCodeFromBus,
//***********************

//***********************
// Single-bit control signals

// Load signal
    input LDIR,
    input LDBEN,
    input LDREG,       //load signal for saving a register
    input LDCC,
    input LDPC,
    input LDPriv,
    input LDSavedSSP,
    input LDSavedUSP,
    input LDVector,

// Signal that control what data go on bus
    input GatePC,
    input GateALU,
    input GateMARMUX,
    input GateVector,
    input GatePC_Minus_one,
    input GatePSR,
    input GateSP,

// Multiplexing signals that select signal for specific component
    input [1:0] PCMUX,
    input [1:0] DRMUX,
    input [1:0] SR1MUX,
    input ADDR1MUX,
    input [1:0] ADDR2MUX,
    input [1:0] SPMUX,
    input MARMUX,
    input [1:0] VectorMUX,
    input PSRMUX,
//

// ALU operation Control
    input [1:0] ALUK,
//

// Privilege mode setting
    input SetPriv,
//
//***********************

//***********************
// Multi-bit output to bus
    output [15:0] MARToBus,
    output [15:0] PCToBus,
    output [15:0] ALUToBus,
//***********************

//***********************
// output to controller
    output INT,
    output [4:0] IR_15_To_11,
    output BEN,
    output PSR_15
//***********************
    );

    reg [15:0] IR = 0;                  //instruction register

//********** Wire Definition *********
    wire [2:0] NZP;

    wire [2:0] DR, SR1;
    wire [15:0] SR1OUT, SR2OUT;
    wire [15:0] Imm5;
    wire [15:0] offset6, offset9, offset11;
    wire [15:0] trapvect8;
    wire [15:0] currentPC;

    wire [15:0] ADDR_Adder_out;
    wire [15:0] SR2MUXToALU;
    wire [15:0] ADDR1, ADDR2;

//***********************************

//******** Module Initialization *****

    MARMUX MARMUX_m(
        .MARMUX(MARMUX),
        .GateMARMUX(GateMARMUX),
        .MARFromExtender(trapvect8),
        .MARFromAdder(ADDR_Adder_out),
        .MARToBus(MARToBus)
    );

    ZeroExtender8to16 ZeroExtender8to16(
        .in(IR[7:0]),
        .out(trapvect8)
    );

    SignedExtender6to16 SignedExtender6to16(
        .in(IR[5:0]),
        .out(offset6)
    );

    SignedExtender9to16 SignedExtender9to16(
        .in(IR[8:0]),
        .out(offset9)
    );

    SignedExtender11to16 SignedExtender11to16(
        .in(IR[10:0]),
        .out(offset11)
    );

    PC PC(
        .clk(clk),
        .PCFromBus(pcFromBus),
        .PCFromAdder(ADDR_Adder_out),
        .PCMUX(PCMUX),
        .LDPC(LDPC),
        .GatePC(GatePC),
        .PC(currentPC),
        .PCToBus(PCToBus)
    );

    ADDR1MUX ADDR1MUX_m(
        .ADDR1MUX(ADDR1MUX),
        .ADDR1FromPC(currentPC),
        .ADDR1FromRF(SR1OUT),
        .ADDR1(ADDR1)
    );

    ADDR2MUX ADDR2MUX_m(
        .ADDR2MUX(ADDR2MUX),
        .offset6(offset6),
        .offset9(offset9),
        .offset11(offset11),
        .ADDR2(ADDR2)
    );

    AddrAdder AddrAdder(
        .A(ADDR1),
        .B(ADDR2),
        .out(ADDR_Adder_out)
    );

    ConditionalCodeLogic ConditionalCodeLogic(
        .clk(clk),
        .dataFromBus(testConditionCodeFromBus),
        .LDCC(LDCC),
        .NZP(NZP)
    );

    BENLogic BENLogic(
        .clk(clk),
        .IR11to9(IR[11:9]),
        .N(NZP[2]),
        .Zero(NZP[1]),
        .P(NZP[0]),
        .BEN(BEN)
    );

    DRMUX DRMUX_m(
        .IR11to9(IR[11:9]),
        .DRMUX(DRMUX),
        .DR(DR)
    );

    SR1MUX SR1MUX_m(
        .IR11to9(IR[11:9]),
        .IR8to6(IR[8:6]),
        .SR1MUX(SR1MUX),
        .SR1(SR1)
    );

// Register File
    RegisterFile RF(
        .clk(clk),
        .inData(regValueFromBus),
        .DR(DR),
        .SR1(SR1),
        .SR2(IR[2:0]),
        .LDREG(LDREG),
        .SR1OUT(SR1OUT),
        .SR2OUT(SR2OUT)
    );

    SignedExtender5to16 SignedExtender5to16(
        .in(IR[4:0]),
        .out(Imm5)
    );

    SR2MUX SR2MUX(
        .SR2MUX(IR[5]),
        .SR2FromRF(SR2OUT),
        .Imm5(Imm5),
        .SR2(SR2MUXToALU)
    );

    ALU ALU(
        .A(SR1OUT),
        .B(SR2MUXToALU),
        .ALUK(ALUK),
        .GateALU(GateALU),
        .ALU_Out(ALUToBus)
    );

//*****************************

    always @(posedge clk) begin
        if(LDIR) 
            IR <= irFromBus;
    end

    assign IR_15_To_11[4:0] = IR[15:11];

endmodule
