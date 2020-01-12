`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2019 02:52:55 PM
// Design Name: 
// Module Name: LC3
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


//This is the top module

module LC3(
        input clk
    );

    wire [15:0] Bus;

    wire LDMAR, LDMDR, LDIR, LDBEN, LDREG, LDCC, LDPC, LDPriv, LDSavedSSP, LDSavedUSP, LDVector, GatePC, GateMDR, GateALU, GateMARMUX, GateVector, GatePC_Minus_one, GatePSR, GateSP, ADDR1MUX, MARMUX, PSRMUX, MIOEN, RW, SetPriv;

    wire [1:0] PCMUX, DRMUX, SR1MUX, ADDR2MUX, SPMUX, VectorMUX, ALUK;

    wire INT, BEN, PSR_15, R;

    wire [4:0] IR_15_To_11;


    
    Datapath path(
        .clk(clk),
        .pcFromBus(Bus),
        .regValueFromBus(Bus),
        .irFromBus(Bus),
        .testConditionCodeFromBus(Bus),
        
        .LDIR(LDIR),
        .LDBEN(LDBEN),
        .LDREG(LDREG),
        .LDCC(LDCC),
        .LDPC(LDPC),
        .LDPriv(LDPriv),
        .LDSavedSSP(LDSavedSSP),
        .LDSavedUSP(LDSavedUSP),
        .LDVector(LDVector),

        .GatePC(GatePC),
        .GateALU(GateALU),
        .GateMARMUX(GateMARMUX),
        .GateVector(GateVector),
        .GatePC_Minus_one(GatePC_Minus_one),
        .GatePSR(GatePSR),
        .GateSP(GateSP),

        .PCMUX(PCMUX),
        .DRMUX(DRMUX),
        .SR1MUX(SR1MUX),
        .ADDR1MUX(ADDR1MUX),
        .ADDR2MUX(ADDR2MUX),
        .SPMUX(SPMUX),
        .MARMUX(MARMUX),
        .VectorMUX(VectorMUX),
        .PSRMUX(PSRMUX),

        .ALUK(ALUK),

        .SetPriv(SetPriv),

        .MARToBus(Bus),
        .PCToBus(Bus),
        .ALUToBus(Bus),

        .INT(INT),
        .IR_15_To_11(IR_15_To_11),
        .BEN(BEN),
        .PSR_15(PSR_15)
    );   

    Controller control_unit(
        .clk(clk),
        .INT(0),
        .R(R),
        .IR_15_To_11(IR_15_To_11),
        .BEN(BEN),
        .PSR_15(PSR_15),

        .LDMAR(LDMAR),
        .LDMDR(LDMDR),
        .LDIR(LDIR),
        .LDBEN(LDBEN),
        .LDREG(LDREG),
        .LDCC(LDCC),
        .LDPC(LDPC),
        .LDPriv(LDPriv),
        .LDSavedSSP(LDSavedSSP),
        .LDSavedUSP(LDSavedUSP),
        .LDVector(LDVector),

        .GatePC(GatePC),
        .GateMDR(GateMDR),
        .GateALU(GateALU),
        .GateMARMUX(GateMARMUX),
        .GateVector(GateVector),
        .GatePC_Minus_one(GatePC_Minus_one),
        .GatePSR(GatePSR),
        .GateSP(GateSP),

        .PCMUX(PCMUX),
        .DRMUX(DRMUX),
        .SR1MUX(SR1MUX),
        .ADDR1MUX(ADDR1MUX),
        .ADDR2MUX(ADDR2MUX),
        .SPMUX(SPMUX),
        .MARMUX(MARMUX),
        .VectorMUX(VectorMUX),
        .PSRMUX(PSRMUX),

        .ALUK(ALUK),
        .MIOEN(MIOEN),
        .RW(RW),
        .SetPriv(SetPriv)
    
    );

    Memory memory_unit(
        .clk(clk),

        .GateMDR(GateMDR),
        .LDMAR(LDMAR),
        .LDMDR(LDMDR),
        .MIOEN(MIOEN),
        .RW(RW),

        .MARFromBus(Bus),
        .MDRFromBus(Bus),

        .R(R),

        .MDRToBus(Bus)
    );

endmodule
