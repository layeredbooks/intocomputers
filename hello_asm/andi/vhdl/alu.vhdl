library ieee;
use ieee.std_logic_1164.all; 

entity alu is
  port(
    a: in std_logic_vector(31 downto 0);
    b: in std_logic_vector(31 downto 0);
    opcode: in std_logic_vector(6 downto 0);
    result: out std_logic_vector(31 downto 0));
  end alu;

architecture rtl of alu is

  constant LUI: std_logic_vector(6 downto 0) := b"0110111";
  constant OP_IMM: std_logic_vector(6 downto 0) := b"0010011";

  constant zero_32: std_logic_vector(31 downto 0) := (others => '0');
  
begin

  result <= a when opcode = LUI else
            a and b when opcode = OP_IMM
            else zero_32;

end rtl; 
