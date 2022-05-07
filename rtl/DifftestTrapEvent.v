
module DifftestTrapEvent(
  input         io_clock,
input  [ 7:0] io_coreid,
input         io_valid,
input  [63:0] io_cycleCnt,
input  [63:0] io_instrCnt,
input  [ 2:0] io_code,
input  [63:0] io_pc
);
`ifndef SYNTHESIS
`ifdef DIFFTEST

import "DPI-C" function void v_difftest_TrapEvent (
input     byte io_coreid,
input      bit io_valid,
input  longint io_cycleCnt,
input  longint io_instrCnt,
input     byte io_code,
input  longint io_pc
);

  always @(posedge io_clock) begin
    v_difftest_TrapEvent (io_coreid,io_valid,io_cycleCnt,io_instrCnt,io_code,io_pc);
  end
`endif
`endif
endmodule
