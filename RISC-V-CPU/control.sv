module control #(
    parameter ADDRESS_WIDTH = 32
)(
    input logic EQ, //if rs1 != rs2, this is 1
    input logic [ADDRESS_WIDTH-26:0] instr, //will need more than this later , for fn3 and 7
    output logic RegWrite,
    output logic [3-1:0] ALUctrl,
    output logic ALUsrc,
    output logic ImmSrc,
    output logic PCsrc 
);

logic [6:0] opcode;
//logic [14:12] fn3;
//logic [31:25] fn7;
logic [5:0] flags;

assign opcode = instr[6:0];
//assign fn3 = instr[14:12];
//assign fn7 = instr[31:25];

always_comb begin
    casez(opcode) 
        7'b0010011: flags = 6'b100011; //for op = 19
        7'b1100011: flags = 6'b000100; //for op = 99 and EQ is 1 (which means not eq = true), (set ALUCTRL to subtract - L7 S18)
        default: flags = 6'b000000;
    endcase
end

assign {RegWrite, ALUctrl[3-1:0], ALUsrc, ImmSrc} = flags;
assign PCsrc = EQ;

endmodule
