module systolic_pe #(
    parameter DATA_WIDTH = 8,
    parameter ACC_WIDTH  = 32
)(
    input wire                      clk,
    input wire                      rst_n,
    input wire                      enable,
    input wire                      load_weight,
    input wire                      quantize_mode,
    input wire [DATA_WIDTH-1:0]     act_in,
    input wire [ACC_WIDTH-1:0]      psum_in,
    input wire [DATA_WIDTH-1:0]     weight_load_in,
    output reg [DATA_WIDTH-1:0]     act_out,
    output reg [ACC_WIDTH-1:0]      psum_out
);

    reg [DATA_WIDTH-1:0] weight_storage;

    // 1. Weight Loading
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) weight_storage <= 0;
        else if (load_weight) weight_storage <= weight_load_in;
    end

    // 2. Logic
    wire [DATA_WIDTH-1:0] w_iso = enable ? weight_storage : {DATA_WIDTH{1'b0}};
    wire [DATA_WIDTH-1:0] a_iso = enable ? act_in         : {DATA_WIDTH{1'b0}};

    wire signed [DATA_WIDTH-1:0] w_signed = quantize_mode ? {{4{w_iso[3]}}, w_iso[3:0]} : w_iso;
    wire signed [DATA_WIDTH-1:0] a_signed = quantize_mode ? {{4{a_iso[3]}}, a_iso[3:0]} : a_iso;

    wire signed [2*DATA_WIDTH-1:0] product;
    assign product = w_signed * a_signed;

    // 3. Accumulate & Forward
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            act_out  <= 0;
            psum_out <= 0;
        end else if (enable) begin
            act_out <= act_in; 
            psum_out <= psum_in + {{ (ACC_WIDTH-(2*DATA_WIDTH)){product[2*DATA_WIDTH-1]} }, product};
        end
    end

endmodule
