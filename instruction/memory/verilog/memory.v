module memory(clk, write_enable, address, data_in, data_out);

   parameter address_width = 32;
   parameter data_width = 32;
   parameter size = 256;

   input clk;
   input write_enable;
   input [address_width-1:0] address;
   input [data_width-1:0] data_in;
   output[data_width-1:0] data_out;

   wire clk;
   wire write_enable;
   wire [address_width-1:0] address;
   wire [data_width-1:0] data_in;

   reg [data_width-1:0] memory [0:size-1];

   initial begin
     $readmemh("../memory_contents.txt", memory);
   end

   always @(posedge clk) begin
     if (write_enable == 1) 
       memory[address] <= data_in;
   end 

   assign data_out = memory[address];

endmodule    
