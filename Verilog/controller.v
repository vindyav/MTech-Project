module iot_controller #(
    parameter ADDR_WIDTH = 10
)(
    input wire                      clk,
    input wire                      rst_n,

    // Interface to AXI Slave
    input wire                      start,
    input wire                      clear_irq, 
    input wire [15:0]               num_vectors, 
    output reg                      done,
    output reg                      idle,

    // Interface to PE Array
    output reg                      pe_enable,
    output reg                      pe_load_weight, 

    // Interface to Weight SRAM 
    output reg [ADDR_WIDTH-1:0]     w_sram_addr,
    output reg                      w_sram_re,

    // Interface to Activation SRAM
    output reg [ADDR_WIDTH-1:0]     act_sram_addr,
    output reg                      act_sram_re,

    // Interface to Output SRAM
    output reg [ADDR_WIDTH-1:0]     out_sram_addr,
    output reg                      out_sram_we
);

    // States
    localparam S_IDLE       = 3'd0;
    localparam S_LOAD_REQ   = 3'd1; 
    localparam S_LOAD_WAIT  = 3'd2; 
    localparam S_COMPUTE    = 3'd3; 
    localparam S_DONE       = 3'd4;

    reg [2:0] state;
    reg [15:0] process_cnt; // Master Time Counter
    reg [15:0] write_cnt;   // Results Written Counter

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_IDLE;
            done <= 0;
            idle <= 1;
            pe_enable <= 0;
            pe_load_weight <= 0;
            w_sram_re <= 0;
            act_sram_re <= 0;
            out_sram_we <= 0;
            process_cnt <= 0;
            write_cnt <= 0;
        end else begin
            
            // Default Pulses
            w_sram_re <= 0;
            act_sram_re <= 0;
            out_sram_we <= 0;

            case (state)
                S_IDLE: begin
                    idle <= 1;
                    if (clear_irq) done <= 0;
                    if (start) begin
                        $display("[CTRL] Received Start Command. Num Vectors: %d", num_vectors);
                        state <= S_LOAD_REQ;
                        idle <= 0;
                    end
                end

                S_LOAD_REQ: begin
                    w_sram_addr <= 0;
                    w_sram_re <= 1;
                    state <= S_LOAD_WAIT;
                end

                S_LOAD_WAIT: begin
                    // Weights are ready. Load them.
                    pe_enable <= 1;      
                    pe_load_weight <= 1; 
                    state <= S_COMPUTE;
                    
                    process_cnt <= 0;
                    write_cnt <= 0;
                    $display("[CTRL] Weights Loaded. Entering COMPUTE.");
                end

                S_COMPUTE: begin
                    pe_enable <= 1;
                    pe_load_weight <= 0;

                    process_cnt <= process_cnt + 1;

                    // 1. Read Logic (Stop reading when we run out of inputs)
                    if (process_cnt < num_vectors) begin
                        act_sram_re <= 1;
                        act_sram_addr <= process_cnt;
                    end

                    // 2. Write Logic (Wait 5 cycles for Systolic Latency)
                    if (process_cnt >= 5) begin
                        if (write_cnt < num_vectors) begin
                            out_sram_we <= 1;
                            out_sram_addr <= 512 + write_cnt;
                            write_cnt <= write_cnt + 1;
                            $display("[CTRL] Writing Result %d to Addr %d", write_cnt, 512 + write_cnt);
                        end
                    end

                    // 3. Exit Condition
                    if (write_cnt >= num_vectors) begin
                        $display("[CTRL] All Vectors Processed. DONE.");
                        state <= S_DONE;
                        pe_enable <= 0; 
                    end
                end

                S_DONE: begin
                    done <= 1;
           //         state <= S_IDLE;
                end
            endcase
        end
    end
endmodule
