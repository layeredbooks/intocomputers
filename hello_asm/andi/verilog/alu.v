module alu(a, b, opcode, result);

   input [31:0] a;
   input [31:0] b;

   input [6:0] opcode;

   output [31:0] result;

   parameter LUI = 7'b0110111;
   parameter OP_IMM = 7'b0010011;
   
   assign result = opcode == LUI ? a :
  	           opcode == OP_IMM ? a & b :
  	           32'b0;
   
endmodule
