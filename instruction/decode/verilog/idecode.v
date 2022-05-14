module idecode(instr, imm_value, rd);

   input [31:0] instr;

   output [31:0]  imm_value;
   output [4:0]  rd;

   assign imm_value = {instr[31:12], 12'b0};
   assign rd = instr[11:7];
   
endmodule
