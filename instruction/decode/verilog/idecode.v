module idecode(instr, reg_id_d, imm_value);

   input [31:0] instr;
   output [4:0]  reg_id_d;
   output [31:0]  imm_value;

   assign reg_id_d = instr[11:7];
   assign imm_value = {instr[31:12], 12'b0};
   
endmodule
