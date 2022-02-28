`timescale 1ns / 1ns

module d_ff_tb;

   reg clk = 0;
    
   reg d_ff_data_in = 0;
   wire d_ff_data_out;

   initial begin
      $monitor("At time %2t, clk=%b, data_in=%b, data_out=%b", 
               $time, clk, d_ff_data_in, d_ff_data_out);
      #16 $finish;
   end

   initial begin
      #1 d_ff_data_in = 0;
      #4 d_ff_data_in = 1;
      #4 d_ff_data_in = 0;
   end
		   
   initial begin
      $dumpfile("d_ff_tb_verilog_wave.vcd");
      $dumpvars(0,d_ff_0);
   end

   always #2 clk = !clk;

   d_ff d_ff_0(clk, d_ff_data_in, d_ff_data_out);

endmodule
