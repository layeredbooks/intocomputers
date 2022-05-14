// LUI format:
// imm [31:12], rd [4:0], opcode[6:0)]= 0110111
// imm (31:12), rd (11:7), opcode(6:0) = 0110111
// place imm in top 20 bits of rd, fill with zeros

// ANDI format:
// imm [11:0], rs1[4:0], funct3[(2:0] = 111, rd[4:0], opcode[6:0] = 0010011
// imm (31:20), rs1(19:15), funct3(14:12) = 111, rd (11:7), opcode(6:0) = 0010011
// bitwise and on rs1 and sign-extended imm, store result in rd

module idecode(instr, imm_value, rs1, rd, opcode);

   input [31:0] instr;

   output [31:0] imm_value;
   output [4:0] rs1;
   output [4:0] rd;
   output [6:0] opcode;

   parameter LUI = 7'b0110111;
   parameter OP_IMM = 7'b0010011;

   assign opcode = instr[6:0];
   
   assign imm_value = opcode == LUI ? {instr[31:12], 12'b0} :
   		      opcode == OP_IMM ? { {21{instr[31]}}, instr[30:20] } :
		      32'b0;
   
   assign rs1 = instr[19:15];

   assign rd = instr[11:7];
   
endmodule
