library ieee;
use ieee.std_logic_1164.all; 

-- LUI format:
-- imm [31:12], rd [4:0], opcode[6:0)]= 0110111
-- imm (31:12), rd (11:7), opcode(6:0) = 0110111
-- place imm in top 20 bits of rd, fill with zeros
 
-- ANDI format:
-- imm [11:0], rs1[4:0], funct3[(2:0] = 111, rd[4:0], opcode[6:0] = 0010011
-- imm (31:20), rs1(19:15), funct3(14:12) = 111, rd (11:7), opcode(6:0) = 0010011
-- bitwise and on rs1 and sign-extended imm, store result in rd

entity idecode is
  port(
    instr: in std_logic_vector(31 downto 0);
    imm_value: out std_logic_vector(31 downto 0);
    rs1: out std_logic_vector(4 downto 0);
    rd: out std_logic_vector(4 downto 0);
    opcode: out std_logic_vector(6 downto 0));
  end idecode;

architecture rtl of idecode is

  constant LUI: std_logic_vector(6 downto 0) := b"0110111";
  constant OP_IMM: std_logic_vector(6 downto 0) := b"0010011";

  signal op_s: std_logic_vector(6 downto 0);

  constant zero_12: std_logic_vector(11 downto 0) := (others => '0');
  constant zero_32: std_logic_vector(31 downto 0) := (others => '0');
  
begin

  opcode <= instr(6 downto 0); 

  op_s <= instr(6 downto 0);
  
  imm_value <= instr(31 downto 12) & zero_12 when op_s = LUI else
               (31 downto 11 => instr(31)) & instr(30 downto 20) when op_s = OP_IMM
               else zero_32;
               
  rs1 <= instr(19 downto 15); 

  rd <= instr(11 downto 7); 

end rtl; 
