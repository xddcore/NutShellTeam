
`timescale 1 ns / 1 ps

  module process_element_mul_mul_7s_15ns_22_4_1_DSP48_6(clk, rst, ce, a, b, p);
input clk;
input rst;
input ce;
input signed [7 - 1 : 0] a;
input [15 - 1 : 0] b;
output signed [22 - 1 : 0] p;

reg signed [22 - 1 : 0] p_reg; 

reg signed [7 - 1 : 0] a_reg; 
reg [15 - 1 : 0] b_reg; 

reg signed [22 - 1 : 0] p_reg_tmp; 

always @ (posedge clk) begin
    if (ce) begin
        a_reg <= a;
        b_reg <= b;
        p_reg_tmp <= $signed (a_reg) * $signed ({1'b0, b_reg});
        p_reg <= p_reg_tmp;
    end
end

assign p = p_reg;

endmodule
`timescale 1 ns / 1 ps
module process_element_mul_mul_7s_15ns_22_4_1(
    clk,
    reset,
    ce,
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



process_element_mul_mul_7s_15ns_22_4_1_DSP48_6 process_element_mul_mul_7s_15ns_22_4_1_DSP48_6_U(
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

