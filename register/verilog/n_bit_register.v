// fig_begin n_bit_register
module n_bit_register(clk, data_in, data_out);

   parameter N = 8;

   input clk;
   input[N-1:0] data_in;
   output[N-1:0] data_out;

   wire          clk;
   wire [N-1:0]  data_in;
   
   reg [N-1:0]   reg_value;

   always @(posedge clk)
     reg_value <= data_in;
    
   assign data_out = reg_value;

endmodule    
// fig_end n_bit_register
     
   
      
