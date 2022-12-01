//This has not been updated to a working version yet
module Top #(
    parameter ADDRESS_WIDTH = 32,

              DATA_WIDTH = 8
)(
  input logic clk,
  input logic  rst,
  output logic [DATA_WIDTH-1:0] a0
);

    logic [19:15] AD1,    
    logic [24:20] AD2,
    logic [11:7] AD3,
    logic WE3,
    logic [DATA_WIDTH-1:0] WD3,
    logic [ADDRESS_WIDTH-1:0] ImmOp,

    logic [ADDRESS_WIDTH-1:0] instr,
    logic RegWrite,
    logic ALUctrl,
    logic ALUsrc,
    logic ImmSrc,
    logic PCsrc, 

    logic   [11:0]       Imm, 

    logic [ADDRESS_WIDTH-1:0] PC,
    logic [DATA_WIDTH-1:0] ALUout,
    logic [DATA_WIDTH-1:0] EQ,

//PC
mux1 Mux_1 (
  .PCsrc (PCsrc),
  .inc_PC (inc_PC),
  .branch_PC (branch_PC),
  .next_PC (next_PC)
);

PCReg PC_Reg
 (
  .clk (clk),
  .rst (rst),
  .next_PC (next_PC),
  .PC (PC),
);
//green

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
//blue  
ram ram (
  .clk (clk),
  .AD1 (rs1),
  .AD2 (rs2),
  .AD3 (rd)
  .WE3 (RegWrite),
  .WD3 (ALUout),
  .a0 (a0)

);

mux mux2 (
  .ALUsrc (ALUsrc),
  .Immop (Immop),
  .regOp2 (RD2),
  .ALUop2 (ALUop2)

);

ALU ALU (
   .ALUop1 (RD1),
   .ALUop2 (ALUop2),
   .ALUctrl (ALUctrl),
   .ALUout (ALUout),
   .EQ (EQ)
);

endmodule
