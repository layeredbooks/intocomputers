library ieee;
use ieee.std_logic_1164.all; 

entity idecode is
  port(
    instr: in std_logic_vector(31 downto 0);
    reg_id_d: out std_logic_vector(4 downto 0);
    imm_value: out std_logic_vector(31 downto 0));
  end idecode;

architecture rtl of idecode is

  constant zero_12: std_logic_vector(11 downto 0) := (others => '0');
  
begin

  reg_id_d <= instr(11 downto 7); 
  imm_value <= instr(31 downto 12) & zero_12;

end rtl; 
