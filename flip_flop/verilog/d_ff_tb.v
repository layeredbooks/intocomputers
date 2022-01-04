// fig_begin d_ff_tb
`timescale 1ns / 1ns

module d_ff_tb;

   reg clk = 0;
    
   reg d_ff_data_in = 0;
   wire d_ff_data_out;

   // fig_begin report_gen
   initial begin
      $monitor("At time %2t, clk=%b, data_in=%b, data_out=%b", 
               $time, clk, d_ff_data_in, d_ff_data_out);
      #16 $finish;
   end
   // fig_end report_gen

   // fig_begin input_gen
   initial begin
      #1 d_ff_data_in = 0;
      #5 d_ff_data_in = 1;
      #3 d_ff_data_in = 0;
   end
   // fig_end input_gen
		   
   initial begin
      $dumpfile("d_ff_tb_verilog_wave.vcd");
      $dumpvars(0,d_ff_0);
   end

   // fig_begin clk_gen
   always #2 clk = !clk;
   // fig_end clk_gen

   d_ff d_ff_0(clk, d_ff_data_in, d_ff_data_out);

endmodule
// fig_end d_ff_tb
