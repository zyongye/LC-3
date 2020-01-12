`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2019 03:07:29 PM
// Design Name: 
// Module Name: Controller
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


module Controller(
    input clk,
    input INT,
    input R,
    input [4:0] IR_15_To_11,
    input BEN,
    input PSR_15,

    output reg LDMAR,
    output reg LDMDR,
    output reg LDIR,
    output reg LDBEN,
    output reg LDREG,
    output reg LDCC,
    output reg LDPC,
    output reg LDPriv,
    output reg LDSavedSSP,
    output reg LDSavedUSP,
    output reg LDVector,

    output reg GatePC,
    output reg GateMDR,
    output reg GateALU,
    output reg GateMARMUX,
    output reg GateVector,
    output reg GatePC_Minus_one,
    output reg GatePSR,
    output reg GateSP,

    output reg [1:0] PCMUX,
    output reg [1:0] DRMUX,
    output reg [1:0] SR1MUX,
    output reg ADDR1MUX,
    output reg [1:0] ADDR2MUX,
    output reg [1:0] SPMUX,
    output reg MARMUX,
    output reg [1:0] VectorMUX,
    output reg PSRMUX,
    output reg [1:0] ALUK,
    output reg MIOEN,
    output reg RW, 
    output reg SetPriv
    );


    reg IRD = 0;
    reg [2:0] COND = 0;
    reg [5:0] J = 18;

    wire [5:0] uPC;
    wire [48:0] uInstruction;

    uSequencer uSequencer(
        .IR_15_To_11(IR_15_To_11),
        .INT(INT),
        .PSR_15(PSR_15),
        .BEN(BEN),
        .R(R),
        .IRD(IRD),
        .COND(COND),
        .J(J),
        .uPC(uPC)
    );

    CtrlStore store(
        .uPC(uPC),
        .uInstruction(uInstruction)
    );

    

    always @(posedge clk) begin
        {IRD, COND, J, LDMAR, LDMDR, LDIR, LDBEN, LDREG, LDCC, LDPC, LDPriv, LDSavedSSP, LDSavedUSP, LDVector, GatePC, GateMDR, GateALU, GateMARMUX, GateVector, GatePC_Minus_one, GatePSR, GateSP, PCMUX, DRMUX, SR1MUX, ADDR1MUX, ADDR2MUX, SPMUX, MARMUX, VectorMUX, PSRMUX, ALUK, MIOEN, RW, SetPriv} = uInstruction;
    end

endmodule
