module registers(clk, rs1, rs2, rd, rd_value, we, rs1_value, rs2_value);

   parameter n_regs = 32;
   
   input clk;

   input [4:0] rs1;
   input [4:0] rs2;
   input [4:0] rd;

   input [31:0]  rd_value;

   input we;

   output [31:0]  rs1_value;
   output [31:0]  rs2_value;
   
   reg [31:0] reg_file[1:n_regs];

   always @(posedge clk) begin
     if (we == 1) begin
	reg_file[rd] <= rd_value;
     end 
   end

   assign rs1_value = reg_file[rs1];
   assign rs2_value = reg_file[rs2];

endmodule
