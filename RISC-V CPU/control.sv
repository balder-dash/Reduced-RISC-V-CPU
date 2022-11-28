module control #(
    parameter ADDRESS_WIDTH = 32
)(
    input logic EQ, //if rs1 != rs2, this is 1
    input logic [ADDRESS_WIDTH-1:0] instr, //will need more than this later , for fn3 and 7
    output logic RegWrite,
    output logic [3-1:0] ALUctrl,
    output logic ALUsrc,
    output logic ImmSrc,
    output logic PCsrc 
);

logic [6:0] opcode;
logic [14:12] fn3;
logic [31:25] fn7;
logic [6:0] flags;

assign flags = {RegWrite, ALUctrl[3-1:0], ALUsrc, ImmSrc, PCsrc};
assign opcode = instr[6:0];
assign fn3 = instr[14:12];
assign fn7 = instr[31:25];

always_comb
    casez(opcode) //use begin-end for default and the opcode stuff
        7'b0010011: flags = 7'b1000110; //for op = 19
        7'b1100011: flags = EQ ? 7'b0010001: 7'b0000000; //for op = 99 and EQ is 1, also set ALUctrl to AND, dk if that's right
        default: flags = 7'b0000000;
    endcase

assign {RegWrite, ALUctrl[3-1:0], ALUsrc, ImmSrc, PCsrc} = flags;
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
