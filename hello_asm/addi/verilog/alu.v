module alu(a, b, opcode, funct3, result);

   input [31:0] a;
   input [31:0] b;

   input [6:0] opcode;
   input [2:0] funct3;

   output [31:0] result;

   parameter LUI = 7'b0110111;
   parameter OP_IMM = 7'b0010011;
   
   assign result = opcode == LUI ? a :
  	           opcode == OP_IMM && funct3 == 3'b111 ? a & b :
  	           opcode == OP_IMM && funct3 == 3'b000 ? a + b :
  	           32'b0;
  
endmodule
