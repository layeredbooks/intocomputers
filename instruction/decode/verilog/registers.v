module registers(clk, rd, rd_value, we, r0_value, r1_value, r2_value);

   input clk;

   input [4:0] rd;

   input [31:0]  rd_value;

   input we;
   
   output [31:0] r0_value;
   output [31:0] r1_value;
   output [31:0] r2_value;
   
   reg [31:0] reg_0;
   reg [31:0] reg_1;
   reg [31:0] reg_2;

   always @(posedge clk) begin
     if (we == 1)
     begin
	case (rd - 5)
            0: reg_0 <= rd_value;
            1: reg_1 <= rd_value;
            2: reg_2 <= rd_value;
            default:;
        endcase
     end 
   end

   assign r0_value = reg_0;
   assign r1_value = reg_1;
   assign r2_value = reg_2;

endmodule
   
