module ALU #(
    parameter ADDRESS_WIDTH = 32,
              DATA_WIDTH = 8 
)(
    input logic [ADDRESS_WIDTH-1:0] ALUop1,    
    input logic [ADDRESS_WIDTH-1:0] ALUop2,
    input logic [2:0] ALUctrl,
    
    output logic [ADDRESS_WIDTH-1:0] ALUout,
    output logic EQ

);
always_comb begin
    
    case (ALUctrl)
        3'b000:  ALUout <= ALUop1 + ALUop2   ;
       
        3'b001:  ALUout <= ALUop1 - ALUop2  ;

        3'b010:  ALUout <= ALUop1 & ALUop2;   

        3'b011:  ALUout <= ALUop1 | ALUop2;  

        3'b101:  ALUout <= $ signed(ALUop1) < $signed (ALUop2)  ? 1:0;

        default: ALUout = 
    

 // SLT and SLTU perform signed and unsigned compares respectively, writing 1 to rd if rs1 < rs2, 0 otherwise.
        
    endcase

    assign EQ <=  ALUop1 != ALUop2 ? 1:0
    

end

endmodule

//    if (ALUctrl  == 3'b000)   //add
//        ALUout = ALUop1 + ALUop2
 
//    elif (ALUctrl  == 3'b001) //substract
//        ALUout = ALUop1 - ALUop2

//    elif (ALUctrl  == 3'b010)  //and
//        ALUout = ALUop1 & ALUop2

//    elif (ALUctrl  == 3'b011)  //or
//        ALUout = ALUop1 | ALUop2

//    elif(ALUctrl  == 3'b101)   //SLT
//        ALUout = 


//https://medium.com/programmatic/how-to-design-a-risc-v-processor-12388e1163c
//a0
//slt
//result.next = True if (rda.signed() < rdx.signed()) else False