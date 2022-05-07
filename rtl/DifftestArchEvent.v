
module DifftestArchEvent(
  input         io_clock,
input  [ 7:0] io_coreid,
input  [31:0] io_intrNO,
input  [31:0] io_cause,
input  [63:0] io_exceptionPC,
input  [31:0] io_exceptionInst
);
`ifndef SYNTHESIS
`ifdef DIFFTEST

import "DPI-C" function void v_difftest_ArchEvent (
input     byte io_coreid,
input      int io_intrNO,
input      int io_cause,
input  longint io_exceptionPC,
input      int io_exceptionInst
);

  always @(posedge io_clock) begin
    v_difftest_ArchEvent (io_coreid,io_intrNO,io_cause,io_exceptionPC,io_exceptionInst);
  end
`endif
`endif
endmodule
