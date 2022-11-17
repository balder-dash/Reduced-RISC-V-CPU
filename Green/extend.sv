module extend #(
    parameter WIDTH = 32
) (
    //interface signals
    input   logic   [11:0]       Imm,                       //12 bit in
    input   logic                ImmSrc,                    //Control signal
    output  logic   [WIDTH-1:0]  ImmOp                      //32 bit out
);

begin 
    if (ImmSrc) ImmOp = { WIDTH-12{Imm[11]}, Imm[11:0] };   //Sign extend if given Imm control signal
    else        ImmOp = { WIDTH-12{1'b0}, Imm[11:0] };      //Zero extend otherwise
end
endmodule