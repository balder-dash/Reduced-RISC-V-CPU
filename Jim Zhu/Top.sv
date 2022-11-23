module Top #(
    parameter ADDRESS_WIDTH = 32,

              DATA_WIDTH = 8
)(
  input logic clk,
  input logic [19:15] AD1,    
  input logic [24:20] AD2,
  input logic [11:7] AD3,
  input logic WE3,
  input logic [DATA_WIDTH-1:0] WD3,
  input logic [ADDRESS_WIDTH-1:0] ImmOp
 
  output logic [DATA_WIDTH-1:0] ALUout,
  output logic [DATA_WIDTH-1:0] EQ,
  output logic [DATA_WIDTH-1:0] a0


);
  
  
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

//