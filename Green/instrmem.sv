module instrmem #(
    parameter ADDRESS_WIDTH = 16, 
              DATA_WIDTH = 32
) (
    //input logic clk,
    input logic [ADDRESS_WIDTH-1:0] A,
    output logic [DATA_WIDTH-1:0] RD
);

logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0]; //this v big

initial begin
    $display("loading instr."); //remove
    $readmemh("instr.mem", rom_array);
end

always_ff @(posedge A, negedge A) // needs to be async, so the value changes immediately. HOW??
RD <= rom_array [A];

endmodule
