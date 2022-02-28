module addressing_tb;

   parameter address_width = 16;
   parameter data_width = 32;
   parameter size = 6;
    
   reg clk = 0;
   reg write_enable = 0;
   reg [data_width-1:0] data_in = 'b0;

   wire [address_width-1:0] pc_value;
   wire [data_width-1:0] data_out;

   wire [address_width-1:0] pc_address;
    
   initial begin
      $monitor("At time %2t, pc_value=%h, data_out=%h",  
               $time, pc_value, data_out);
      #24 $finish;
   end
   
   always #2 clk = ~clk;

   assign pc_address = pc_value >> 2;
    
   pc #(.pc_width(address_width)) pc_0(clk, pc_value);
   
   memory #(.address_width(address_width), .data_width(data_width), .size(size)) 
     memory_0(clk, write_enable, pc_address, data_in, data_out);

endmodule
