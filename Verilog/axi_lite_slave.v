module axi_lite_slave #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 4
)(
    input wire clk,
    input wire rst_n,

    // AXI4-Lite Interface (Connects to RISC-V Interconnect)
    input wire [ADDR_WIDTH-1:0]     aw_addr,
    input wire                      aw_valid,
    output reg                      aw_ready,
    input wire [DATA_WIDTH-1:0]     w_data,
    input wire [3:0]                w_strb, 
    input wire                      w_valid,
    output reg                      w_ready,
    output wire [1:0]               b_resp,
    output wire                     b_valid,
    input wire                      b_ready,
    input wire [ADDR_WIDTH-1:0]     ar_addr,
    input wire                      ar_valid,
    output reg                      ar_ready,
    output reg [DATA_WIDTH-1:0]     r_data,
    output wire [1:0]               r_resp,
    output reg                      r_valid,
    input wire                      r_ready,
    // User Interface (Wires to your Controller)
    output reg                      o_start,
    output reg                      o_clear_irq, 
    output reg [15:0]               o_num_pixels,
    output reg                      o_quant_mode,
    input wire                      i_done     
);

    // Internal Registers
    // 0x00: Control (Bit 0=Start, Bit 1=Clear)
    // 0x04: Status  (Bit 0=Done) - Read Only
    // 0x08: Pixel Count
    // 0x0C: Quant Mode
    reg [31:0] reg_ctrl;
    reg [31:0] reg_status;
    reg [31:0] reg_pixel_cnt;
    reg [31:0] reg_quant;

    // AXI State Logic
    assign b_resp = 2'b00; 
    assign r_resp = 2'b00; 
    assign b_valid = (aw_ready && w_ready);

    // Write State Machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            aw_ready <= 0;
            w_ready  <= 0;
            reg_ctrl <= 0;
            reg_pixel_cnt <= 0;
            reg_quant <= 0;
            
            // Pulse outputs
            o_start <= 0;
            o_clear_irq <= 0;
        end else begin
            // 1. Handshaking
            if (~aw_ready && aw_valid && w_valid) begin
                aw_ready <= 1;
                w_ready <= 1;
            end else begin
                aw_ready <= 0;
                w_ready <= 0;
            end

            // 2. Write Logic
            o_start <= 0;
            o_clear_irq <= 0;

            if (aw_ready && w_ready) begin
                case (aw_addr[3:0]) 
                    4'h0: begin 
                        reg_ctrl <= w_data;
                        if (w_data[0]) o_start <= 1;      
                        if (w_data[1]) o_clear_irq <= 1; 
                    end
                    4'h8: reg_pixel_cnt <= w_data;
                    4'hC: reg_quant     <= w_data;
                    default: ; 
                endcase
            end
        end
    end

    // Read State Machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ar_ready <= 0;
            r_valid <= 0;
            r_data <= 0;
            reg_status <= 0;
        end else begin
            // 1. Update Status Register
            reg_status[0] <= i_done;

            // 2. Handshaking
            if (~ar_ready && ar_valid)
                ar_ready <= 1;
            else
                ar_ready <= 0;

            // 3. Read Logic
            if (ar_ready && ar_valid && ~r_valid) begin
                r_valid <= 1;
                case (ar_addr[3:0])
                    4'h0: r_data <= reg_ctrl;
                    4'h4: r_data <= reg_status; 
                    4'h8: r_data <= reg_pixel_cnt;
                    4'hC: r_data <= reg_quant;
                    default: r_data <= 32'hDEADBEEF; 
                endcase
            end else if (r_valid && r_ready) begin
                r_valid <= 0;
            end
        end
    end

    always @(*) begin
        o_num_pixels = reg_pixel_cnt[15:0];
        o_quant_mode = reg_quant[0];
    end

endmodule
