
import "DPI-C" function void put_pixel(input int pixel);
import "DPI-C" function void vmem_sync();

module FBHelper (
  input clk,
  input valid,
  input [31:0] pixel,
  input sync
);

  always@(posedge clk) begin
    if (valid) put_pixel(pixel);
    if (sync) vmem_sync();
  end

endmodule
     