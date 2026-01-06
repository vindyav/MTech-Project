`timescale 1ns/1ps
`include "pe.v"
`include "sram_scratchpad.v"
`include "axi_lite_slave.v"
`include "pe_array.v"
`include "controller.v"
`include "clk_gate.v"
`include "accelerator.v"
module tb_soc_spy;

    reg clk;
    reg rst_n;
    
    // AXI Signals
    reg [3:0] s_axi_awaddr; reg s_axi_awvalid; wire s_axi_awready;
    reg [31:0] s_axi_wdata; reg s_axi_wvalid; wire s_axi_wready;
    reg [3:0] s_axi_araddr; reg s_axi_arvalid; wire s_axi_arready;
    wire [31:0] s_axi_rdata; wire s_axi_rvalid; reg s_axi_rready;

    // Backdoor Memory
    reg host_mem_we;
    reg [9:0] host_mem_addr;
    reg [31:0] host_mem_wdata;

    always #5 clk = ~clk; 

    accelerator_soc u_soc (
        .clk(clk), .rst_n(rst_n),
        .s_axi_awaddr(s_axi_awaddr), .s_axi_awvalid(s_axi_awvalid), .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata),   .s_axi_wvalid(s_axi_wvalid),   .s_axi_wready(s_axi_wready),
        .s_axi_araddr(s_axi_araddr), .s_axi_arvalid(s_axi_arvalid), .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata),   .s_axi_rvalid(s_axi_rvalid),   .s_axi_rready(s_axi_rready),
        .host_mem_we(host_mem_we), .host_mem_addr(host_mem_addr), .host_mem_wdata(host_mem_wdata)
    );

    initial begin
        clk = 0; rst_n = 0;
        host_mem_we = 0; host_mem_addr = 0; host_mem_wdata = 0;
        
        // -------------------------------------------------------------
        // SPY MONITOR: Watch the SRAM Interface Signals directly
        // -------------------------------------------------------------
        // We look INSIDE the SoC to see what the SRAM sees.
        $display("Time  | RST | IDLE | HostWE | Addr | W_WE_Mux | WeightSRAM[0]");
        $monitor("%5t |  %b  |  %b   |   %b    |  %h |    %b     |   %h", 
                 $time, rst_n, u_soc.is_idle, host_mem_we, host_mem_addr, 
                 u_soc.w_we_mux, u_soc.u_sram_weight.ram_block[0]);

        #20 rst_n = 1;
        #20;

        // 1. Attempt to Write Weight
        $display("--- Attempting Write to Weight SRAM ---");
        @(posedge clk); 
        host_mem_we = 1; 
        host_mem_addr = 0; 
        host_mem_wdata = 32'h02020202;
        
        @(posedge clk);
        // Hold for one more cycle to be sure
        @(posedge clk);
        
        host_mem_we = 0;
        $display("--- Write Finished ---");
        
        #100;
        $finish;
    end
endmodule
