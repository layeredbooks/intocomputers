library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity pc is
  port(
    clk: in std_logic;
    pc_out: out std_logic_vector(31 downto 0) := (others => '0'));
  end pc;

architecture rtl of pc is

  signal pc_value: std_logic_vector(31 downto 0) := (others => '0');

begin

  update: process(clk)
  begin
    if rising_edge(clk) then
      pc_value <= std_logic_vector(unsigned(pc_value) + 4);
    end if;
  end process; 

  pc_out <= pc_value;

end rtl; 
