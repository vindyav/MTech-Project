`timescale 1ns/1ps
`include "pe_array.v"
`include "pe.v"

module tb_pe_array_4x4;

    parameter DATA_WIDTH = 8;
    parameter ACC_WIDTH  = 32;
    parameter ROWS       = 4;
    parameter COLS       = 4;

    reg clk;
    reg rst_n;
    reg enable;
    reg load_weight;
    reg quantize_mode;

    reg  [(DATA_WIDTH*ROWS)-1:0]   act_in_flat;
    reg  [(ACC_WIDTH*COLS)-1:0]    psum_in_flat;
    reg  [(DATA_WIDTH*ROWS)-1:0]   weight_in_flat;
    wire [(ACC_WIDTH*COLS)-1:0]    psum_out_flat;

    reg [DATA_WIDTH-1:0] tb_act_arr   [0:ROWS-1];
    reg [DATA_WIDTH-1:0] tb_weight_arr[0:ROWS-1];
    integer i;

    pe_array_4x4 #(
        .DATA_WIDTH(DATA_WIDTH), .ACC_WIDTH(ACC_WIDTH), .ROWS(ROWS), .COLS(COLS)
    ) u_dut (
        .clk(clk), .rst_n(rst_n),
        .enable(enable), .load_weight(load_weight), .quantize_mode(quantize_mode),
        .act_in_flat(act_in_flat), .psum_in_flat(psum_in_flat),
        .weight_in_flat(weight_in_flat), .psum_out_flat(psum_out_flat)
    );

    always #5 clk = ~clk;

    task update_inputs;
        integer r;
        begin
            for (r=0; r<ROWS; r=r+1) begin
                act_in_flat[r*DATA_WIDTH +: DATA_WIDTH]    = tb_act_arr[r];
                weight_in_flat[r*DATA_WIDTH +: DATA_WIDTH] = tb_weight_arr[r];
            end
        end
    endtask

    initial begin
        $fsdbDumpvars();

        // Init
        clk = 0; rst_n = 0; enable = 0; 
        load_weight = 0; quantize_mode = 0;
        act_in_flat = 0; psum_in_flat = 0; weight_in_flat = 0;
        for(i=0; i<ROWS; i=i+1) begin tb_act_arr[i]=0; tb_weight_arr[i]=0; end
        update_inputs();

        // Synchronized Reset
        @(negedge clk); 
        rst_n = 1;
        enable = 1;

        // =============================================
        // STEP 1: Load Weights (Driven on NEGEDGE)
        // =============================================
        // We drive inputs on the falling edge so they are stable 
        // by the time the rising edge (capture) arrives.
        @(negedge clk);
        tb_weight_arr[0] = 8'd2; tb_weight_arr[1] = 8'd3;
        tb_weight_arr[2] = 8'd4; tb_weight_arr[3] = 8'd5;
        update_inputs();
        load_weight = 1;

        @(negedge clk); // Hold for 1 cycle
        load_weight = 0;
        
        // Clear weights
        for(i=0; i<ROWS; i=i+1) tb_weight_arr[i] = 0;
        update_inputs();

        // =============================================
        // STEP 2: Stream Data (Manual Skewing)
        // =============================================
        
        // Time 0
        @(negedge clk);
        tb_act_arr[0] = 8'd10; tb_act_arr[1] = 0; tb_act_arr[2] = 0; tb_act_arr[3] = 0;
        update_inputs();

        // Time 1
        @(negedge clk);
        tb_act_arr[0] = 0; tb_act_arr[1] = 8'd10; tb_act_arr[2] = 0; tb_act_arr[3] = 0;
        update_inputs();

        // Time 2
        @(negedge clk);
        tb_act_arr[0] = 0; tb_act_arr[1] = 0; tb_act_arr[2] = 8'd10; tb_act_arr[3] = 0;
        update_inputs();

        // Time 3
        @(negedge clk);
        tb_act_arr[0] = 0; tb_act_arr[1] = 0; tb_act_arr[2] = 0; tb_act_arr[3] = 8'd10;
        update_inputs();

        // Time 4 (Clear)
        @(negedge clk);
        tb_act_arr[3] = 0;
        update_inputs();

        // =============================================
        // STEP 3: Check Results
        // =============================================
        repeat(20) @(posedge clk); 

        $display("----------------------------------------");
        $display("Expected: 140");
        $display("Actual:   %d", psum_out_flat[31:0]);
        $display("----------------------------------------");

        if (psum_out_flat[31:0] === 32'd140) 
            $display("SUCCESS: Array Interconnect is working!");
        else 
            $display("FAILURE: Check wiring or PE logic.");

        $finish;
    end
endmodule
