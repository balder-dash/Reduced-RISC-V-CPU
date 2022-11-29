module ALU #(
    parameter 
              DATA_WIDTH = 32
)(
    input logic [DATA_WIDTH-1:0] ALUop1,
    input logic [DATA_WIDTH-1:0] ALUop2,
    input logic [2:0] ALUctrl,
    
    output logic [DATA_WIDTH-1:0] ALUout,
    output logic EQ

);
always_comb begin
    
    casez (ALUctrl)
        3'b000:  ALUout = ALUop1 + ALUop2;
       
        3'b001:  ALUout = ALUop1 - ALUop2;

        3'b010:  ALUout = ALUop1 & ALUop2;

        3'b011:  ALUout = ALUop1 | ALUop2;

        3'b101:  ALUout = ( $signed(ALUop1) < $signed (ALUop2) ) ? 1:0 ;

        default: ALUout = 0;

 // SLT and SLTU perform signed and unsigned compares respectively, writing 1 to rd if rs1 < rs2, 0 otherwise.

    endcase
end

assign EQ =  (ALUop1 != ALUop2) ? 1:0;    //output 1 if not equal

endmodule
