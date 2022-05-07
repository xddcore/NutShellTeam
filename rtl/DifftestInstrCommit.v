
module DifftestInstrCommit(
  input         io_clock,
input  [ 7:0] io_coreid,
input  [ 7:0] io_index,
input         io_valid,
input  [ 7:0] io_special,
input         io_skip,
input         io_isRVC,
input         io_rfwen,
input         io_fpwen,
input  [31:0] io_wpdest,
input  [ 7:0] io_wdest,
input  [63:0] io_pc,
input  [31:0] io_instr
);
`ifndef SYNTHESIS
`ifdef DIFFTEST

import "DPI-C" function void v_difftest_InstrCommit (
input     byte io_coreid,
input     byte io_index,
input      bit io_valid,
input     byte io_special,
input      bit io_skip,
input      bit io_isRVC,
input      bit io_rfwen,
input      bit io_fpwen,
input      int io_wpdest,
input     byte io_wdest,
input  longint io_pc,
input      int io_instr
);

  always @(posedge io_clock) begin
    v_difftest_InstrCommit (io_coreid,io_index,io_valid,io_special,io_skip,io_isRVC,io_rfwen,io_fpwen,io_wpdest,io_wdest,io_pc,io_instr);
  end
`endif
`endif
endmodule
