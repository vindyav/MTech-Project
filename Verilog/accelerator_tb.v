`timescale 1ns/1ps
`include "pe.v"
`include "sram_scratchpad.v"
`include "axi_lite_slave.v"
`include "pe_array.v"
`include "controller.v"
`include "clk_gate.v"
`include "accelerator.v"

module tb_soc_final;

    reg clk;
    reg rst_n;
    
    // AXI Signals
    reg [3:0] s_axi_awaddr; reg s_axi_awvalid; wire s_axi_awready;
    reg [31:0] s_axi_wdata; reg s_axi_wvalid; wire s_axi_wready;
    reg [3:0] s_axi_araddr; reg s_axi_arvalid; wire s_axi_arready;
    wire [31:0] s_axi_rdata; wire s_axi_rvalid; reg s_axi_rready;

    // Backdoor Memory (Declared wider to prevent truncation bugs)
    reg host_mem_we;
    reg [15:0] host_mem_addr; 
    reg [31:0] host_mem_wdata;

    always #5 clk = ~clk; 

    // Instantiate with Explicit Widths
    accelerator_soc #(
        .DATA_WIDTH(32), .ADDR_WIDTH(10)
    ) u_soc (
        .clk(clk), .rst_n(rst_n),
        .s_axi_awaddr(s_axi_awaddr), .s_axi_awvalid(s_axi_awvalid), .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata),   .s_axi_wvalid(s_axi_wvalid),   .s_axi_wready(s_axi_wready),
        .s_axi_araddr(s_axi_araddr), .s_axi_arvalid(s_axi_arvalid), .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata),   .s_axi_rvalid(s_axi_rvalid),   .s_axi_rready(s_axi_rready),
        // Truncate the 16-bit TB address to the 10-bit Port
        .host_mem_we(host_mem_we), .host_mem_addr(host_mem_addr[9:0]), .host_mem_wdata(host_mem_wdata)
    );

    // AXI Write Task
    task axi_write;
        input [3:0] addr;
        input [31:0] data;
        begin
            @(posedge clk);
            s_axi_awaddr = addr; s_axi_awvalid = 1;
            s_axi_wdata = data;  s_axi_wvalid = 1;
            wait(s_axi_awready && s_axi_wready);
            @(posedge clk);
            s_axi_awvalid = 0; s_axi_wvalid = 0;
        end
    endtask

    initial begin
        $fsdbDumpvars();

        clk = 0; rst_n = 0;
        s_axi_awvalid=0; s_axi_wvalid=0; s_axi_arvalid=0; s_axi_rready=0;
        host_mem_we=0; host_mem_addr=0; host_mem_wdata=0;

        $display("   IoT AI Accelerator: Final Verification");

        #20 rst_n = 1;
        #20;
        $display("[DMA] Loading Weights to Addr 0...");
        @(posedge clk); 
        host_mem_we = 1; 
        host_mem_addr = 0; 
        host_mem_wdata = 32'h02020202; 
        @(posedge clk); 
        host_mem_we = 0; // Turn OFF

        @(posedge clk); 

        $display("[DMA] Loading Inputs to Addr 512...");
        host_mem_addr = 512; 
        host_mem_wdata = 32'h0A0A0A0A; 
        host_mem_we = 1; // Turn ON
        @(posedge clk); 
        host_mem_we = 0; // Turn OFF

        $display("[DMA] Load Complete.");

        axi_write(4'h8, 32'd1); 
        axi_write(4'hC, 32'd0); // INT8

        $display("[HOST] Starting Inference...");
        axi_write(4'h0, 32'd1); 

        $display("[HOST] Waiting for hardware to finish...");
        repeat(200) @(posedge clk);

        $display("[CHECK] Reading Result Memory at Addr 512...");
        
        if (u_soc.u_sram_act.ram_block[512] === 32'd80) begin
            $display("SUCCESS: Calculated 80 (0x50) correctly!");
        end else begin
            $display("FAILURE: Expected 80, Got %d (Hex: %h)", 
                     u_soc.u_sram_act.ram_block[512], u_soc.u_sram_act.ram_block[512]);
        end

        $finish;
    end
endmodule
