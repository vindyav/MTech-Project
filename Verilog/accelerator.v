module accelerator_soc #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 10
)(
    input wire                      clk,
    input wire                      rst_n,

    // AXI4-Lite Interface
    input wire [3:0]                s_axi_awaddr,
    input wire                      s_axi_awvalid,
    output wire                     s_axi_awready,
    input wire [31:0]               s_axi_wdata,
    input wire                      s_axi_wvalid,
    output wire                     s_axi_wready,
    input wire [3:0]                s_axi_araddr,
    input wire                      s_axi_arvalid,
    output wire                     s_axi_arready,
    output wire [31:0]              s_axi_rdata,
    output wire                     s_axi_rvalid,
    input wire                      s_axi_rready,

    // Backdoor Memory Access
    input wire                      host_mem_we,
    input wire [ADDR_WIDTH-1:0]     host_mem_addr,
    input wire [31:0]               host_mem_wdata
);

    // Internal Signals
    wire start_pulse, clear_pulse, done_signal, is_idle;
    wire [15:0] num_pixels_cfg_raw;
    wire quant_mode_cfg_raw;       
    wire pe_en_ctrl_raw, pe_load_ctrl;
    wire [127:0] pe_result_flat; 
    wire pe_en_ctrl = (pe_en_ctrl_raw === 1'bx) ? 1'b0 : pe_en_ctrl_raw;
    wire quant_mode_cfg = (quant_mode_cfg_raw === 1'bx) ? 1'b0 : quant_mode_cfg_raw;
    wire [15:0] num_pixels_cfg = (num_pixels_cfg_raw === 16'bx) ? 16'd0 : num_pixels_cfg_raw;

    // 1. Instantiations
    axi_lite_slave u_axi_slave (
        .clk(clk), .rst_n(rst_n),
        .aw_addr(s_axi_awaddr), .aw_valid(s_axi_awvalid), .aw_ready(s_axi_awready),
        .w_data(s_axi_wdata),   .w_valid(s_axi_wvalid),   .w_ready(s_axi_wready),
        .b_ready(1'b1),
        .ar_addr(s_axi_araddr), .ar_valid(s_axi_arvalid), .ar_ready(s_axi_arready),
        .r_data(s_axi_rdata),   .r_valid(s_axi_rvalid),   .r_ready(s_axi_rready),
        .o_start(start_pulse), .o_clear_irq(clear_pulse),
        .o_num_pixels(num_pixels_cfg_raw), 
        .o_quant_mode(quant_mode_cfg_raw), 
        .i_done(done_signal)
    );

    wire [ADDR_WIDTH-1:0] ctrl_w_addr, ctrl_act_addr, ctrl_out_addr;
    wire ctrl_w_re, ctrl_act_re, ctrl_out_we;

    iot_controller u_ctrl (
        .clk(clk), .rst_n(rst_n),
        .start(start_pulse), .clear_irq(clear_pulse),
        .num_vectors(num_pixels_cfg), .done(done_signal), .idle(is_idle),
        .pe_enable(pe_en_ctrl_raw), .pe_load_weight(pe_load_ctrl),
        .w_sram_addr(ctrl_w_addr), .w_sram_re(ctrl_w_re),
        .act_sram_addr(ctrl_act_addr), .act_sram_re(ctrl_act_re),
        .out_sram_addr(ctrl_out_addr), .out_sram_we(ctrl_out_we)
    );

    // Bypass ICG for simulation stability
    wire pe_clk_gated = clk; 

    // Memory Muxing
    wire [ADDR_WIDTH-1:0] w_addr_mux = is_idle ? {1'b0, host_mem_addr[8:0]} : ctrl_w_addr;
    wire w_we_mux = is_idle ? (host_mem_we && (host_mem_addr[9]==0)) : 1'b0;
    wire [31:0] w_sram_rdata;

    sram_scratchpad #(.DATA_WIDTH(32)) u_sram_weight (
        .clk(clk), .we_a(w_we_mux), .addr_a(w_addr_mux), .wdata_a(host_mem_wdata),
        .re_b(ctrl_w_re), .addr_b(ctrl_w_addr), .rdata_b(w_sram_rdata)
    );

    wire [ADDR_WIDTH-1:0] act_addr_mux = is_idle ? {1'b0, host_mem_addr[8:0]} : ctrl_out_addr;
    wire act_we_mux  = is_idle ? (host_mem_we && (host_mem_addr[9]==1)) : ctrl_out_we;
    wire [31:0] act_wdata_mux = is_idle ? host_mem_wdata : pe_result_flat[31:0]; 
    wire [31:0] act_sram_rdata;

    sram_scratchpad #(.DATA_WIDTH(32)) u_sram_act (
        .clk(clk), .we_a(act_we_mux), .addr_a(act_addr_mux), .wdata_a(act_wdata_mux),
        .re_b(ctrl_act_re), .addr_b(ctrl_act_addr), .rdata_b(act_sram_rdata)
    );

    // 2. Data Logic
    reg act_data_valid;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) act_data_valid <= 0;
        else       act_data_valid <= ctrl_act_re;
    end
    
    wire [31:0] safe_rdata = (act_sram_rdata === 32'bx) ? 32'd0 : act_sram_rdata;
    wire [31:0] clean_data = act_data_valid ? safe_rdata : 32'd0;

    // Skewing Logic
    reg [7:0] row1_d1;
    reg [7:0] row2_d1, row2_d2;
    reg [7:0] row3_d1, row3_d2, row3_d3;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            row1_d1 <= 0;
            row2_d1 <= 0; row2_d2 <= 0;
            row3_d1 <= 0; row3_d2 <= 0; row3_d3 <= 0;
        end else if (pe_en_ctrl) begin
            row1_d1 <= clean_data[15:8];
            row2_d1 <= clean_data[23:16]; row2_d2 <= row2_d1;
            row3_d1 <= clean_data[31:24]; row3_d2 <= row3_d1; row3_d3 <= row3_d2;
        end
    end

    wire [31:0] skewed_act_flat;
    assign skewed_act_flat[7:0]   = clean_data[7:0]; 
    assign skewed_act_flat[15:8]  = row1_d1;         
    assign skewed_act_flat[23:16] = row2_d2;         
    assign skewed_act_flat[31:24] = row3_d3;         

    pe_array_4x4 #(
        .DATA_WIDTH(8), .ACC_WIDTH(32), .ROWS(4), .COLS(4)
    ) u_pe_array (
        .clk(pe_clk_gated), .rst_n(rst_n),
        .enable(pe_en_ctrl), .load_weight(pe_load_ctrl), 
        .quantize_mode(quant_mode_cfg),
        .act_in_flat(skewed_act_flat), .psum_in_flat(128'd0),          
        .weight_in_flat(w_sram_rdata), .psum_out_flat(pe_result_flat)  
    );
    
    always @(posedge clk) begin
        if (quant_mode_cfg_raw === 1'bx) 
            $display("[SOC WARNING] Quant Mode is X! Forcing to 0.");
    end

endmodule
