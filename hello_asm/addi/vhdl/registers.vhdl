library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity registers is
  port(
    clk: in std_logic;

    rs1: in std_logic_vector(4 downto 0);
    rs2: in std_logic_vector(4 downto 0);
    rd: in std_logic_vector(4 downto 0);

    rd_value: in std_logic_vector(31 downto 0);

    write_enable: in std_logic;

    rs1_value: out std_logic_vector(31 downto 0);
    rs2_value: out std_logic_vector(31 downto 0));
  end registers;

architecture rtl of registers is

  type reg_file_array is array(0 to 31) of std_logic_vector(31 downto 0);
  signal reg_file: reg_file_array;

begin

  update: process(clk)
  begin
    if rising_edge(clk) then
      if write_enable = '1' then
        reg_file(to_integer(unsigned(rd))) <= rd_value;
      end if;
    end if;
  end process; 

  rs1_value <= reg_file(to_integer(unsigned(rs1)));
  rs2_value <= reg_file(to_integer(unsigned(rs2)));
  
end rtl; 
