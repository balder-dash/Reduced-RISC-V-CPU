module top #(
    parameter ADDRESS_WIDTH = 5,
              ALUctrl_WIDTH = 3,
              DATA_WIDTH = 32
)(
  input logic clk,
  // input logic [19:15] AD1,    
  // input logic [24:20] AD2,
  // input logic [11:7] AD3,

  input logic [DATA_WIDTH-1:0] ImmOp,
  input logic RegWrite,
  input logic [ALUctrl_WIDTH-1:0] ALUctrl,
  input logic ALUsrc,
  input logic [ADDRESS_WIDTH-1:0] rs1,
  input logic [ADDRESS_WIDTH-1:0] rs2,
  input logic [ADDRESS_WIDTH-1:0] rd,

  output logic  EQ,
  output logic [DATA_WIDTH-1:0] a0

);
  
   logic [DATA_WIDTH-1:0] ALUop2;
   logic  [DATA_WIDTH-1:0] ALUop1;
   logic [DATA_WIDTH-1:0] regOp2;
   logic [DATA_WIDTH-1:0] ALUout;
   logic [DATA_WIDTH-1:0] RD1;
   logic [DATA_WIDTH-1:0] RD2;

  //  logic [DATA_WIDTH-1:0] RD2;
  //  logic [ADDRESS_WIDTH-1:0] AD2;
  
ram ram (
  .clk (clk),
  .AD1 (rs1),
  .AD2 (rs2),
  .AD3 (rd),
  .WE3 (RegWrite),
  .WD3 (ALUout),
  .a0 (a0),
  .RD1 (ALUop1),
  .RD2 (regOp2)
  
);

// mux2 mux (
//   .ALUsrc (ALUsrc),
//   .ImmOp (ImmOp),
//   .regOp2 (regOp2),
//   .ALUop2 (ALUop2)
//   //.regOp2 (RD2)
// );
//assign ALUop2 = ALUsrc ? ImmOp:regOp2;

ALU ALU (
   .ALUop1 (RD1),
  // .ALUop2 (ALUop2),
   .ALUsrc (ALUsrc),
   .ImmOp (ImmOp),
   .regOp2 (regOp2),
   .ALUctrl (ALUctrl),
   .ALUout (ALUout),
   .EQ (EQ)
);

endmodule
