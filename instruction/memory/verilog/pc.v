module pc(clk, pc_out);

   parameter pc_width = 32;

   input clk;
   output[pc_width-1:0] pc_out;

   wire clk;
   
   reg [pc_width-1:0] pc_value = 'b0;

   always @(posedge clk)
     pc_value <= pc_value + 4;
    
   assign pc_out = pc_value;

endmodule      
