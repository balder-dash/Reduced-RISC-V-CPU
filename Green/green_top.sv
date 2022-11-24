module green #(
    parameter ADDRESS_WIDTH = 32,

              DATA_WIDTH = 8
)(
    input clk,
    input rst,
    input en,

    input logic [ADDRESS_WIDTH-1:0] PC,
    input logic [DATA_WIDTH-1:0] EQ,

    output logic [ADDRESS_WIDTH-1:0] ImmOp,
    output logic RegWrite,
    output logic ALUctrl,
    output logic ALUsrc,
    output logic PCsrc, 
);
   
    logic [ADDRESS_WIDTH-1:0] instr,
    logic ImmSrc,

//green

counter count (
    .counter addrCounter(
    .clk (clk),
    .rst (rst),
    .en (en),
    .count (PC)
);
)

instrmem rom (
    .A(PC),
    .RD(instr)
)

control ctrl (
    .EQ(EQ),
    .instr(instr), //how to take the last 7 bits of instr from rom
    .RegWrite(RegWrite),
    .ALUctrl(ALUctrl),
    .ALUsrc(ALUsrc),
    .Immsrc(Immsrc),
    .PCsrc(PCsrc)
)

extend sign_ext (
    .Imm(instr),  //same here
    .Immsrc(Immsrc),
    .ImmOp(ImmOp)
)

endmodule
