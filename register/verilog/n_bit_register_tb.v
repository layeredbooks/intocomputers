`timescale 1ns / 1ns

module n_bit_register_tb;

   parameter N=4;
    
   reg clk = 1;
    
   reg [N-1:0] reg_data_in = 1'b1;
   wire[N-1:0] reg_data_out;

   n_bit_register #(.N(N)) reg_0(clk, reg_data_in, reg_data_out);

   always #2 
     clk = !clk;

   always @(posedge clk)
     reg_data_in <= reg_data_in + 1;

   initial begin
      $monitor("At time %2t, data_in=%b, data_out=%b", 
               $time, reg_data_in, reg_data_out);
      #16 $finish;
   end
   
   initial begin
      $dumpfile("n_bit_register_tb_verilog_wave.vcd");
      $dumpvars(0,reg_0);
   end

endmodule
