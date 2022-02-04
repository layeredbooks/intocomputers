library ieee;
use ieee.std_logic_1164.all; 

entity d_ff is
  port(
    clk: in std_logic;
    data_in: in std_logic;
    data_out: out std_logic);
  end d_ff;

architecture rtl of d_ff is

  signal reg_value: std_logic;

begin

  update: process(clk)
  begin
    if rising_edge(clk) then
      reg_value <= data_in;
    end if;
  end process; 

  data_out <= reg_value;

end rtl; 
