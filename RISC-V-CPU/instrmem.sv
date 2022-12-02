module instrmem #(
    parameter ADDRESS_WIDTH = 32, 
              DATA_WIDTH = 32
) (
    //input logic clk,
    input logic [ADDRESS_WIDTH-1:0] A,
    output logic [DATA_WIDTH-1:0] RD
);

//The dumb method. it also works (probably. maybe?)
always_comb 
    case(A)
        32'h00000000: RD = 32'h0FF00313;
        32'h00000004: RD = 32'h00000513;
        32'h00000008: RD = 32'h00000593;
        32'h0000000c: RD = 32'h00058513;
        32'h00000010: RD = 32'h00158593;
        32'h00000014: RD = 32'hFE659CE3;
        32'h00000018: RD = 32'hFE0318E3;
        default: RD = 32'h00000000;
    endcase

/*
logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0]; //this v big

initial begin
    $display("loading instr."); //remove
    $readmemh("instr.mem", rom_array);
end

always_ff @(posedge A, negedge A) // needs to be async, so the value changes immediately. HOW??
RD <= rom_array [A];
*/


endmodule
