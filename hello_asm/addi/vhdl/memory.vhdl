library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity memory is
  generic (size: integer := 256);
  port(
    clk: in std_logic;
    write_enable: in std_logic; 
    address: in std_logic_vector(31 downto 0); 
    data_in: in std_logic_vector(31 downto 0);
    data_out: out std_logic_vector(31 downto 0));

end memory;

architecture rtl of memory is

  type memory_type is array(0 to size-1) of
    std_logic_vector(31  downto 0); 

  impure function init_memory return memory_type is
    file in_file: text is in "../memory_contents.txt";
    variable in_line: line;
    variable s: std_logic_vector(31 downto 0);
    variable m: memory_type; 
  begin
    for i in 1 to integer(m'length) loop
      if not endfile(in_file) then
        readline(in_file, in_line);
        hread(in_line, s);
        m(i-1) := s; 
      else
        m(i-1) := (others => 'X');
      end if; 
    end loop;
    return m;
  end function;
  
  signal mem: memory_type := init_memory;

begin

  update: process(clk)
  begin
    if rising_edge(clk) then 
      if write_enable = '1' then
        mem(to_integer(unsigned(address))) <= data_in;
      end if;
    end if;
  end process;
  
  data_out <= mem(to_integer(unsigned(address))); 

end rtl; 
