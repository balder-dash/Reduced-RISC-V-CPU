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

assign opcode = instr[6:0];
//assign fn3 = instr[14:12];
//assign fn7 = instr[31:25];

always_comb begin 
    case (opcode)
        7'b0010011: begin
            ALUctrl = 3'b000;
            ALUsrc = 1'b1;
            ImmSrc = 1'b1;
            PCsrc = 1'b0;
            RegWrite = 1'b1;
        end

        7'b1100011: begin
            ALUctrl = 3'b111; //default 0
            ALUsrc = 1'b0;
            ImmSrc = 1'b0;
            PCsrc = !EQ;
            RegWrite = 1'b0;
        end
        default: begin
            ALUctrl = 3'b0;
            ALUsrc = 1'b0;
            ImmSrc = 1'b0;
            PCsrc = 1'b1;
            RegWrite = 1'b0;
        end
    endcase
end


endmodule
