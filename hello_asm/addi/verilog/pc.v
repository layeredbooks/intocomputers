module pc(clk, pc_out);

   input clk;
   output[31:0] pc_out;

   wire clk;
   
   reg [31:0] pc_value = 'b0;

   always @(posedge clk)
     pc_value <= pc_value + 4;
    
   assign pc_out = pc_value;

endmodule    
