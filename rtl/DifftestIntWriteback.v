
module DifftestIntWriteback(
  input         io_clock,
input  [ 7:0] io_coreid,
input         io_valid,
input  [31:0] io_dest,
input  [63:0] io_data
);
`ifndef SYNTHESIS
`ifdef DIFFTEST

import "DPI-C" function void v_difftest_IntWriteback (
input     byte io_coreid,
input      bit io_valid,
input      int io_dest,
input  longint io_data
);

  always @(posedge io_clock) begin
    v_difftest_IntWriteback (io_coreid,io_valid,io_dest,io_data);
  end
`endif
`endif
endmodule
