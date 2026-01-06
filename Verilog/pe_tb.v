`timescale 1ns/1ps
`include "pe.v"
module tb_systolic_pe;

    // ------------------------------------------------
    // Parameters
    // ------------------------------------------------
    parameter DATA_WIDTH = 8;
    parameter ACC_WIDTH  = 32;

    // ------------------------------------------------
    // Signals
    // ------------------------------------------------
    reg                     clk;
    reg                     rst_n;
    reg                     enable;
    reg                     load_weight;
    reg                     quantize_mode; // 0=INT8, 1=INT4

    reg  [DATA_WIDTH-1:0]   act_in;
    reg  [ACC_WIDTH-1:0]    psum_in;
    reg  [DATA_WIDTH-1:0]   weight_load_in;

    wire [DATA_WIDTH-1:0]   act_out;
    wire [ACC_WIDTH-1:0]    psum_out;

    // ------------------------------------------------
    // DUT Instantiation
    // ------------------------------------------------
    systolic_pe #(
        .DATA_WIDTH(DATA_WIDTH),
        .ACC_WIDTH(ACC_WIDTH)
    ) u_dut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .load_weight(load_weight),
        .quantize_mode(quantize_mode),
        .act_in(act_in),
        .psum_in(psum_in),
        .weight_load_in(weight_load_in),
        .act_out(act_out),
        .psum_out(psum_out)
    );

    // ------------------------------------------------
    // Clock Generation
    // ------------------------------------------------
    always #5 clk = ~clk; // 100 MHz (10ns period)

    // ------------------------------------------------
    // Test Sequence
    // ------------------------------------------------
    initial begin
        $dumpfile("pe_unit_test.vcd");
        $dumpvars(0, tb_systolic_pe);

        // 1. Initialize
        clk = 0; rst_n = 0; enable = 0; 
        load_weight = 0; quantize_mode = 0;
        act_in = 0; psum_in = 0; weight_load_in = 0;

        $display("========================================");
        $display("   Unit Test: Systolic PE Verification");
        $display("========================================");

        // 2. Reset
        #15 rst_n = 1;
        #5  enable = 1;

        // =============================================
        // TEST CASE 1: Standard INT8 Multiply (Positive)
        // =============================================
        $display("[TEST 1] INT8: 2 * 10 + 0 = 20");
        
        // A. Load Weight = 2
        load_weight = 1; 
        weight_load_in = 8'd2;
        #10; // Clock edge occurs here
        load_weight = 0; // Lock weight
        
        // B. Apply Input = 10
        act_in = 8'd10;
        psum_in = 32'd0;
        
        // C. Wait 1 cycle for Register Output
        #10;
        
        if (psum_out === 32'd20) $display("PASS");
        else $display("FAIL: Exp 20, Got %d", psum_out);

        // =============================================
        // TEST CASE 2: Accumulation (Previous + New)
        // =============================================
        $display("[TEST 2] Accumulate: 2 * 5 + 100 = 110");
        
        // Weight is still 2 (Stationary)
        act_in = 8'd5;
        psum_in = 32'd100; // Incoming partial sum from top
        
        #10;
        
        if (psum_out === 32'd110) $display("PASS");
        else $display("FAIL: Exp 110, Got %d", psum_out);

        // =============================================
        // TEST CASE 3: Signed INT8 (Negative Numbers)
        // =============================================
        $display("[TEST 3] Signed INT8: -3 * 4 = -12");
        
        // Load Weight = -3 (Twos complement of 3: 11111101 -> 0xFD)
        load_weight = 1;
        weight_load_in = -8'sd3; 
        #10;
        load_weight = 0;

        act_in = 8'd4;
        psum_in = 0;
        
        #10;
        
        // Check signed result (cast to signed for display)
        if ($signed(psum_out) === -12) $display("PASS");
        else $display("FAIL: Exp -12, Got %d", $signed(psum_out));

        // =============================================
        // TEST CASE 4: INT4 Quantization Mode
        // =============================================
        $display("[TEST 4] INT4 Mode: 2 * -3 = -6");
        // We will input 8-bit garbage, but only lower 4 bits matter
        // Weight = 0x22 (Lower 4 bits = 2)
        // Input  = 0x3D (Lower 4 bits = D = 13 = -3 in 4-bit signed)
        
        quantize_mode = 1; // Enable INT4
        
        load_weight = 1;
        weight_load_in = 8'h22; // Logic should only take '2'
        #10;
        load_weight = 0;

        act_in = 8'h3D; // Logic should only take 'D' (-3)
        psum_in = 0;
        
        #10;
        
        if ($signed(psum_out) === -6) $display("PASS");
        else $display("FAIL: Exp -6, Got %d", $signed(psum_out));

        // =============================================
        // TEST CASE 5: Data Forwarding (Act Out)
        // =============================================
        $display("[TEST 5] Act_Out Forwarding");
        // act_in was 0x3D in previous cycle. act_out should be 0x3D now.
        
        if (act_out === 8'h3D) $display("PASS");
        else $display("FAIL: Exp 0x3D, Got 0x%h", act_out);

        $finish;
    end

endmodule
