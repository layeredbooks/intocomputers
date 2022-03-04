module one_instruction_tb;

   parameter size = 7;
 
   reg clk = 0;
    
   reg mem_write_enable = 0;
   reg [31:0] data_in = 'b0;

   wire [31:0] pc_value;
   wire [31:0] data_out;

   wire [31:0] pc_address;

   wire [4:0]  reg_id_d;
   wire [31:0]  imm_value;

   reg reg_write_enable = 1;
   wire [31:0] reg_0_value;
   wire [31:0] reg_1_value;
   wire [31:0] reg_2_value;
      
   initial begin
      $monitor("At time %2t",$time, 
               "\npc_value=%h, data_out=%h", pc_value, data_out,
               "\nreg_id_d=%h, imm_value=%h", reg_id_d, imm_value, 
               "\nreg_0_value=%h", reg_0_value, 
               ", reg_1_value=%h", reg_1_value, 
               ", reg_2_value=%h\n", reg_2_value);
      #24 $finish;
   end
   
   always #2 clk = ~clk;

   assign pc_address = pc_value >> 2;
    
   pc pc_0(.clk(clk), .pc_out(pc_value));

   memory #(.size(size)) 
     memory_0(clk, mem_write_enable, pc_address, data_in, data_out);

   idecode idecode_0 (data_out, reg_id_d, imm_value);

   registers registers_0 (clk, reg_write_enable, reg_id_d, imm_value, 
                          reg_0_value, reg_1_value, reg_2_value);

endmodule
