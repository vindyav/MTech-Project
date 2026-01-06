module sram_scratchpad #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 10
)(
    input wire                     clk,
    input wire                     we_a,
    input wire [ADDR_WIDTH-1:0]    addr_a,
    input wire [DATA_WIDTH-1:0]    wdata_a,
    input wire                     re_b,
    input wire [ADDR_WIDTH-1:0]    addr_b,
    output reg [DATA_WIDTH-1:0]    rdata_b
);

    reg [DATA_WIDTH-1:0] ram_block [0:(1<<ADDR_WIDTH)-1];
    integer i;
    initial begin
        for (i=0; i<(1<<ADDR_WIDTH); i=i+1) begin
            ram_block[i] = 0;
        end
        rdata_b = 0; 
    end

    // Port A: Write
    always @(posedge clk) begin
        if (we_a) begin
            ram_block[addr_a] <= wdata_a;
            $display("[SRAM DEBUG] Write Occurred! Addr: %d, Data: %h", addr_a, wdata_a);
        end
    end

    // Port B: Read
    always @(posedge clk) begin
        if (re_b) begin
            rdata_b <= ram_block[addr_b];
        end
    end

endmodule
