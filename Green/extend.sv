module extend #(
    parameter WIDTH = 32
) (
    //interface signals
    input   logic   [11:0]  Imm,
    output  logic   [WIDTH-1:0]  ImmExt     
);

assign ImmExt = { WIDTH-12{Imm[11]}, Imm[11:0] }

endmodule