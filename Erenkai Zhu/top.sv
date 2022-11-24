module top #(
  parameter WIDTH = 32


)(
  input logic    clk,
  input logic    rst,
  input logic [WIDTH-1:0] ImmOp, 
  input logic PCsrc,
  output logic [WIDTH-1:0] PC
);
  logic [WIDTH-1:0] inc_PC;
  logic [WIDTH-1:0] branch_PC;
  logic [WIDTH-1:0] next_PC;
  assign inc_PC = PC + 4; 
  assign branch_PC = PC + ImmOp; 

  assign next_PC = PCsrc ? branch_PC : inc_PC;

/*Mux_1 Mux_1 (
  .PCsrc (PCsrc),
  .inc_PC (inc_PC),
  .branch_PC (branch_PC),
  .next_PC (next_PC)
);
*/
PC_Reg PC_Reg
 (
  .clk (clk),
  .rst (rst),
  .next_PC (next_PC),
  .PC (PC)
);

endmodule
