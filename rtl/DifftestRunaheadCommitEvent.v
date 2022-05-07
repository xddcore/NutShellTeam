
module DifftestRunaheadCommitEvent(
  input         io_clock,
input  [ 7:0] io_coreid,
input  [ 7:0] io_index,
input         io_valid,
input  [63:0] io_pc
);
`ifndef SYNTHESIS
`ifdef DIFFTEST

import "DPI-C" function void v_difftest_RunaheadCommitEvent (
input     byte io_coreid,
input     byte io_index,
input      bit io_valid,
input  longint io_pc
);

  always @(posedge io_clock) begin
    v_difftest_RunaheadCommitEvent (io_coreid,io_index,io_valid,io_pc);
  end
`endif
`endif
endmodule
