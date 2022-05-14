module memory(clk, write_enable, address, data_in, data_out);

   parameter size = 256;

   input clk;
   input write_enable;
   input [31:0] address;
   input [31:0] data_in;
   output[31:0] data_out;

   wire clk;
   wire write_enable;
   wire [31:0] address;
   wire [31:0] data_in;

   reg [31:0] memory [0:size-1];

   initial begin
     $readmemh("../memory_contents.txt", memory);
   end

   always @(posedge clk) begin
     if (write_enable == 1) 
       memory[address] <= data_in;
   end 

   assign data_out = memory[address];

endmodule    
