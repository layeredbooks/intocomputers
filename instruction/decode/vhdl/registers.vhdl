library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity registers is
  port(
    clk: in std_logic;
    write_enable: in std_logic;
    rd: in std_logic_vector(4 downto 0);
    rd_value: in std_logic_vector(31 downto 0);
    r0_value: out std_logic_vector(31 downto 0);
    r1_value: out std_logic_vector(31 downto 0);
    r2_value: out std_logic_vector(31 downto 0));
  end registers;

architecture rtl of registers is

  signal reg_0: std_logic_vector(31 downto 0);
  signal reg_1: std_logic_vector(31 downto 0);
  signal reg_2: std_logic_vector(31 downto 0);

begin

  update: process(clk)
  begin
    if rising_edge(clk) then
      if write_enable = '1' then
        case to_integer(unsigned(rd) - 5) is
          when 0 =>
            reg_0 <= rd_value;
          when 1 =>
            reg_1 <= rd_value;
          when 2 =>
            reg_2 <= rd_value;
          when others =>
        end case; 
      end if;
    end if;
  end process; 

  r0_value <= reg_0;
  r1_value <= reg_1;
  r2_value <= reg_2;
  
end rtl; 
