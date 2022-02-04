-- fig_begin n_bit_register
library ieee;
use ieee.std_logic_1164.all; 

entity n_bit_register is
  generic (N: integer := 8); 
  port(
    clk: in std_logic;
    data_in: in std_logic_vector(N-1 downto 0);
    data_out: out std_logic_vector(N-1 downto 0));
  end n_bit_register;

architecture rtl of n_bit_register is

  signal reg_value: std_logic_vector(N-1 downto 0);

begin

  update: process(clk)
  begin
    if rising_edge(clk) then
      reg_value <= data_in;
    end if;
  end process; 

  data_out <= reg_value;

end rtl; 
-- fig_end n_bit_register
