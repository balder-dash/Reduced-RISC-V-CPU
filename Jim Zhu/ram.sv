module ram #(
    parameter ADDRESS_WIDTH = 5,
              DATA_WIDTH = 32
)(
    input logic clk,
    input logic [19:15] AD1,    
    input logic [24:20] AD2,
    input logic [11:7] AD3,

    input logic WE3,
    input logic [DATA_WIDTH-1:0] WD3,
    input logic [DATA_WIDTH-1:0] ALUout,

    output logic [DATA_WIDTH-1:0] RD1,
    output logic [DATA_WIDTH-1:0] RD2


);
logic [DATA_WIDTH-1:0] ram_array [2**ADDRESS_WIDTH-1:0];

//initial begin
    //$display("Loading ram2port.");
    //$readmemh("sinerom.mem", rom_array);
//end;

always_ff @(posedge clk) begin
     RD1 <= ram_array [AD1];
     RD2 <= ram_array [AD2];
     if (WE3 == 1'b1)
        ram_array[WD3] <= ALUout;
end;

endmodule