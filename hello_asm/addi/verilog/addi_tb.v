module andi_tb;

   parameter size = 8;

   reg clk = 0;
    
   reg mem_write_enable = 0;
   reg [31:0] data_in = 'b0;

   wire [31:0] pc_value;
   wire [31:0] data_out;

   wire [31:0] pc_address;

   wire [4:0] rs1;
   reg [4:0] rs2 = 5'b0;
   wire [4:0] rd;
   wire [6:0] opcode;
   wire [2:0] funct3;

   wire [31:0]  imm_value;

   reg reg_write_enable = 1;
   wire [31:0]  rd_value;
   wire [31:0]  rs1_value;
   wire [31:0]  rs2_value;
   
   initial begin
      $monitor("At time %2t",$time, 
               "\npc_value=%h, data_out=%h", pc_value, data_out,
               ", rs1=%h", rs1,
               "\nrd=%h, imm_value=%h", rd, imm_value, 
               ", rd_value=%h\n", rd_value);
      #24 $finish;
   end
   
   always #2 clk = ~clk;

   assign pc_address = pc_value >> 2;
    
   pc pc_0(.clk(clk), .pc_out(pc_value));

   memory #(.size(size)) 
     memory_0(clk, mem_write_enable, pc_address, data_in, data_out);

   idecode idecode_0 (data_out, imm_value, rs1, rd, opcode, funct3);

   registers registers_0 (clk, rs1, rs2, rd, rd_value, 
                          reg_write_enable, rs1_value, rs2_value);

   alu alu_0 (imm_value, rs1_value, opcode, funct3, rd_value);
   
endmodule
