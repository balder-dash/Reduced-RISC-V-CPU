module green_top #(
    parameter ADDRESS_WIDTH = 32,

              DATA_WIDTH = 8
)(
    input clk,
    input rst,
    input en,

    input logic EQ,

    output logic [ADDRESS_WIDTH-1:0] ImmOp,
    output logic RegWrite,
    output logic ALUctrl,
    output logic ALUsrc,
    output logic PCsrc,

    output logic [ADDRESS_WIDTH-1:0] instr,
    output logic ImmSrc,
    output logic [ADDRESS_WIDTH-1:0] PC
);
   
    // logic [ADDRESS_WIDTH-1:0] instr;
    // logic ImmSrc;
    // logic [ADDRESS_WIDTH-1:0] PC;

//green

counter addrCount (
    .clk (clk),
    .rst (rst),
    .en (en),
    .count (PC)
);


instrmem rom (
    .A(PC),
    .RD(instr)
);

control ctrl (
    .EQ(EQ),
    .instr(instr), //how to take the last 7 bits of instr from rom
    .RegWrite(RegWrite),
    .ALUctrl(ALUctrl),
    .ALUsrc(ALUsrc),
    .ImmSrc(ImmSrc),
    .PCsrc(PCsrc)
);

extend sign_ext (
    .Imm(instr),  //same here
    .ImmSrc(ImmSrc),
    .ImmOp(ImmOp)
);

endmodule
