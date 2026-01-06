module icg_cell (
    input wire clk_in,
    input wire en,
    input wire test_mode,
    output wire clk_out
);
    reg latch_en;
    
    always @(clk_in or en or test_mode) begin
        if (!clk_in) 
            latch_en <= en | test_mode;
    end
    
    assign clk_out = clk_in & latch_en;

endmodule
