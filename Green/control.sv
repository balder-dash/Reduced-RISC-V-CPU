module control (
    input logic EQ, //if rs1 != rs2, this is 1
    input logic [6:0] instr, //will need more than this later , for fn3 and 7
    output logic RegWrite,
    output logic ALUctrl,
    output logic ALUsrc,
    output logic ImmSrc,
    output logic PCsrc 
);

logic [5:0] flags;

assign flags = {RegWrite, ALUctrl, ALUsrc, ImmSrc, PCsrc}

always_comb
    casez(instr)
        7b'0000011: flags = 5b'10110; //for op = 19
        7b'1100011: flags = EQ ? 5b'01001: 5b'00000; //for op = 99 and EQ is 1
        default: flags = 5b'00000;
    endcase

assign {RegWrite, ALUctrl, ALUsrc, ImmSrc, PCsrc} = flags;
/*
logic branch = 7b'1100011; //99
logic imm = 2b'11;  //19

    //if certain bits are output from the instr mem, then certain flags turn on
    //THink of a better way to do this

    assign RegWrite = (instr == imm) ? 1'b1 : 1'b0; 
    assign ALUctrl = (instr == branch && EQ) ? 1'b1 : 1'b0;   
    assign ALUsrc = (instr == imm) ? 1'b1 : 1'b0;    
    assign ImmSrc = (instr == imm) ? 1'b1 : 1'b0;    
    assign PCsrc = (instr == branch && EQ) ? 1'b1 : 1'b0;
*/

endmodule