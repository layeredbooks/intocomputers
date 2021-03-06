module one_instruction_tb;

   parameter size = 7;
 
   reg clk = 0;
    
   reg mem_write_enable = 0;
   reg [31:0] data_in = 'b0;

   wire [31:0] pc_value;
   wire [31:0] data_out;

   wire [31:0] pc_address;

   wire [4:0]  rd;
   wire [31:0]  imm_value;

   reg reg_write_enable = 1;
   wire [31:0] r0_value;
   wire [31:0] r1_value;
   wire [31:0] r2_value;
      
   initial begin
      $monitor("At time %2t",$time, 
               "\npc_value=%h, data_out=%h", pc_value, data_out,
               "\nrd=%h, imm_value=%h", rd, imm_value, 
               "\nr0_value=%h", r0_value, 
               ", r1_value=%h", r1_value, 
               ", r2_value=%h\n", r2_value);
      #24 $finish;
   end
   
   always #2 clk = ~clk;

   assign pc_address = pc_value >> 2;
    
   pc pc_0(.clk(clk), .pc_out(pc_value));

   memory #(.size(size)) 
     memory_0(clk, mem_write_enable, pc_address, data_in, data_out);

   idecode idecode_0 (data_out, imm_value, rd);

   registers registers_0 (clk, rd, imm_value, reg_write_enable,
                          r0_value, r1_value, r2_value);

endmodule
