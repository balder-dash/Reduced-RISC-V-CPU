module extend #(
    parameter WIDTH = 32
) (
    //interface signals
    input   logic   [WIDTH-1:0]  Imm,                       //32 bit instruction
    input   logic                ImmSrc,                    //Control signal
    output  logic   [WIDTH-1:0]  ImmOp                      //32 bit out
);

always_comb begin
    if (ImmSrc) ImmOp = { {WIDTH-12{Imm[31]}}, Imm[31:20] };                           //I-type when ImmSrc = 1
    else        ImmOp = { {WIDTH-12{Imm[31]}}, Imm[7], Imm[30:25], Imm[11:8], 1'b0 };  //J-type when ImmSrc = 0
end
endmodule
