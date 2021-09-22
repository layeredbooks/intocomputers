// fig_begin d_ff
module d_ff(clk, data_in, data_out);

   input clk;
   input data_in;
   output data_out;

   wire clk, data_in;

   reg 	reg_value;

   always @(posedge clk)
     reg_value <= data_in;
    
   assign data_out = reg_value;

endmodule    
// fig_end d_ff
     
   
      
