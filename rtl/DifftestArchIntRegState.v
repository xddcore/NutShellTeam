
module DifftestArchIntRegState(
  input         io_clock,
input  [ 7:0] io_coreid,
input  [63:0] io_gpr_0,
input  [63:0] io_gpr_1,
input  [63:0] io_gpr_2,
input  [63:0] io_gpr_3,
input  [63:0] io_gpr_4,
input  [63:0] io_gpr_5,
input  [63:0] io_gpr_6,
input  [63:0] io_gpr_7,
input  [63:0] io_gpr_8,
input  [63:0] io_gpr_9,
input  [63:0] io_gpr_10,
input  [63:0] io_gpr_11,
input  [63:0] io_gpr_12,
input  [63:0] io_gpr_13,
input  [63:0] io_gpr_14,
input  [63:0] io_gpr_15,
input  [63:0] io_gpr_16,
input  [63:0] io_gpr_17,
input  [63:0] io_gpr_18,
input  [63:0] io_gpr_19,
input  [63:0] io_gpr_20,
input  [63:0] io_gpr_21,
input  [63:0] io_gpr_22,
input  [63:0] io_gpr_23,
input  [63:0] io_gpr_24,
input  [63:0] io_gpr_25,
input  [63:0] io_gpr_26,
input  [63:0] io_gpr_27,
input  [63:0] io_gpr_28,
input  [63:0] io_gpr_29,
input  [63:0] io_gpr_30,
input  [63:0] io_gpr_31
);
`ifndef SYNTHESIS
`ifdef DIFFTEST

import "DPI-C" function void v_difftest_ArchIntRegState (
input     byte io_coreid,
input  longint io_gpr_0,
input  longint io_gpr_1,
input  longint io_gpr_2,
input  longint io_gpr_3,
input  longint io_gpr_4,
input  longint io_gpr_5,
input  longint io_gpr_6,
input  longint io_gpr_7,
input  longint io_gpr_8,
input  longint io_gpr_9,
input  longint io_gpr_10,
input  longint io_gpr_11,
input  longint io_gpr_12,
input  longint io_gpr_13,
input  longint io_gpr_14,
input  longint io_gpr_15,
input  longint io_gpr_16,
input  longint io_gpr_17,
input  longint io_gpr_18,
input  longint io_gpr_19,
input  longint io_gpr_20,
input  longint io_gpr_21,
input  longint io_gpr_22,
input  longint io_gpr_23,
input  longint io_gpr_24,
input  longint io_gpr_25,
input  longint io_gpr_26,
input  longint io_gpr_27,
input  longint io_gpr_28,
input  longint io_gpr_29,
input  longint io_gpr_30,
input  longint io_gpr_31
);

  always @(posedge io_clock) begin
    v_difftest_ArchIntRegState (io_coreid,io_gpr_0,io_gpr_1,io_gpr_2,io_gpr_3,io_gpr_4,io_gpr_5,io_gpr_6,io_gpr_7,io_gpr_8,io_gpr_9,io_gpr_10,io_gpr_11,io_gpr_12,io_gpr_13,io_gpr_14,io_gpr_15,io_gpr_16,io_gpr_17,io_gpr_18,io_gpr_19,io_gpr_20,io_gpr_21,io_gpr_22,io_gpr_23,io_gpr_24,io_gpr_25,io_gpr_26,io_gpr_27,io_gpr_28,io_gpr_29,io_gpr_30,io_gpr_31);
  end
`endif
`endif
endmodule
