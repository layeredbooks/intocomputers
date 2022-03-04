module registers(clk, write_enable, reg_id_d, reg_d_value, 
                 reg_0_value, reg_1_value, reg_2_value);

   input clk;
   input write_enable;
   
   input [4:0] reg_id_d;
   input [31:0]  reg_d_value;

   output [31:0] reg_0_value;
   output [31:0] reg_1_value;
   output [31:0] reg_2_value;
   
   reg [31:0] reg_0;
   reg [31:0] reg_1;
   reg [31:0] reg_2;

  
   always @(posedge clk) begin
     if (write_enable == 1)
     begin
	case (reg_id_d - 5)
            0: reg_0 <= reg_d_value;
            1: reg_1 <= reg_d_value;
            2: reg_2 <= reg_d_value;
            default:;
        endcase
     end 
   end

   assign reg_0_value = reg_0;
   assign reg_1_value = reg_1;
   assign reg_2_value = reg_2;

endmodule
   
