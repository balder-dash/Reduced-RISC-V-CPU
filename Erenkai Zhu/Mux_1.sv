module mux1(input logic [3:0] branch_PC,
            input logic     PCsrc,
            input logic inc_PC,
            output logic [3:0] next_PC);
    assign next_PC = PCsrc? branch_PC:inc_PC;
endmodule


// d1 = branch_PC
// d0 = inc_PC
// y = next_PC
