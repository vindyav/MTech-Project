module pe_array_4x4 #(
    parameter DATA_WIDTH = 8,
    parameter ACC_WIDTH  = 32,
    parameter ROWS       = 4,
    parameter COLS       = 4
)(
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire load_weight,
    input wire quantize_mode,
    input wire [(DATA_WIDTH*ROWS)-1:0]  act_in_flat,   
    input wire [(ACC_WIDTH*COLS)-1:0]   psum_in_flat,  
    input wire [(DATA_WIDTH*ROWS)-1:0]  weight_in_flat,
    output wire [(ACC_WIDTH*COLS)-1:0]  psum_out_flat
);
    wire [DATA_WIDTH-1:0]  act_in_arr    [0:ROWS-1];
    wire [ACC_WIDTH-1:0]   psum_in_arr   [0:COLS-1];
    wire [DATA_WIDTH-1:0]  weight_in_arr [0:ROWS-1];

    genvar i;
    generate
        for (i=0; i<ROWS; i=i+1) begin : UNPACK_ACT
            assign act_in_arr[i]    = act_in_flat[i*DATA_WIDTH +: DATA_WIDTH];
            assign weight_in_arr[i] = weight_in_flat[i*DATA_WIDTH +: DATA_WIDTH];
        end
        for (i=0; i<COLS; i=i+1) begin : UNPACK_PSUM
            assign psum_in_arr[i]   = psum_in_flat[i*ACC_WIDTH +: ACC_WIDTH];
        end
    endgenerate

    wire [DATA_WIDTH-1:0] act_wires [0:ROWS-1][0:COLS];
    wire [ACC_WIDTH-1:0]  psum_wires [0:ROWS][0:COLS-1];
    generate
        for (i=0; i<ROWS; i=i+1) begin : LEFT_EDGE
            assign act_wires[i][0] = act_in_arr[i];
        end
        for (i=0; i<COLS; i=i+1) begin : TOP_EDGE
            assign psum_wires[0][i] = psum_in_arr[i];
        end
    endgenerate

    genvar r, c;
    generate
        for (r = 0; r < ROWS; r = r + 1) begin : ROW
            for (c = 0; c < COLS; c = c + 1) begin : COL
                
                systolic_pe #(
                    .DATA_WIDTH(DATA_WIDTH), .ACC_WIDTH(ACC_WIDTH)
                ) u_pe (
                    .clk(clk), .rst_n(rst_n),
                    .enable(enable), .load_weight(load_weight), .quantize_mode(quantize_mode),
                    .act_in         (act_wires[r][c]),
                    .psum_in        (psum_wires[r][c]),
                    .weight_load_in (weight_in_arr[r]), 
                    .act_out        (act_wires[r][c+1]),
                    .psum_out       (psum_wires[r+1][c])
                );
            end
        end
    endgenerate
    generate
        for (i=0; i<COLS; i=i+1) begin : PACK_OUT
            assign psum_out_flat[i*ACC_WIDTH +: ACC_WIDTH] = psum_wires[ROWS][i];
        end
    endgenerate

endmodule
