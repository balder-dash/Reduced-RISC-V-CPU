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

    output logic [DATA_WIDTH-1:0] a0,
    output logic [DATA_WIDTH-1:0] RD1,
    output logic [DATA_WIDTH-1:0] RD2

);

logic [DATA_WIDTH-1:0] ram_array [2**ADDRESS_WIDTH-1:0];
assign ram_array[5'b00000] = {DATA_WIDTH{1'b0}};

//initial begin
    //$display("Loading ram2port.");
    //$readmemh("sinerom.mem", rom_array);
//end;

//two read ports of reg file should be async, write port sync
always_ff @(posedge clk) begin
    RD1 <= ram_array [AD1];
    RD2 <= ram_array [AD2];
     a0 <= ram_array [5'b01010];
     if (WE3 == 1'b1)
        ram_array[AD3] <= WD3;
end

endmodule
