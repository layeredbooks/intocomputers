library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity n_bit_register_tb is
end n_bit_register_tb;

architecture behavior of n_bit_register_tb is

  constant N: integer := 4;
  
-- fig_begin component
  component n_bit_register
    generic (N: integer := N); 
    port(
      clk: in std_logic;
      data_in: in std_logic_vector(N-1 downto 0);
      data_out: out std_logic_vector(N-1 downto 0));
  end component;
-- fig_end component

  signal clk: std_logic := '0';

  constant clk_half_period: time := 2 ns; 
  constant n_clk_cycles: integer := 5; 

  signal reg_data_in: std_logic_vector(N-1 downto 0) :=
    (0 => '1', others => '0'); 
  signal reg_data_out: std_logic_vector(N-1 downto 0);

  function std_logic_to_character(s : std_logic) return character is
    variable ch : character;
  begin
    case s is
      when 'U' => ch := 'U';
      when 'X' => ch := 'X';
      when '0' => ch := '0';
      when '1' => ch := '1';
      when 'Z' => ch := 'Z';
      when 'W' => ch := 'W';
      when 'L' => ch := 'L';
      when 'H' => ch := 'H';
      when '-' => ch := '-';
    end case;
    return ch;
  end std_logic_to_character; 

  function std_logic_vector_to_string(s : std_logic_vector) return string is
    variable ret_string : string(1 to s'length); 
  begin
    for i in 0 to integer(s'length)-1 loop
      ret_string(i+1) := std_logic_to_character(s(i)); 
    end loop;
    return ret_string;
  end function;

  function reverse_string (s : string) return string is
    variable ret_string : string(1 to s'length);
  begin
    for i in 1 to s'length loop
      ret_string(s'length - i + 1) := s(i);
    end loop;
    return ret_string;
  end function;

begin

  n_bit_register_0: n_bit_register
    port map(
      clk => clk,
      data_in => reg_data_in,
      data_out => reg_data_out);

  clk_gen: process is
  begin
    for i in 1 to n_clk_cycles loop
      clk <= '1';
      wait for clk_half_period;
      clk <= '0';
      wait for clk_half_period; 
    end loop;
    wait; 
  end process;

  stim_gen: process(clk) is
  begin
    if (rising_edge(clk)) then
      reg_data_in <= std_logic_vector(
        unsigned(reg_data_in) + 1);
    end if; 
  end process; 

  reporter: process(clk) is
  begin
    if (rising_edge(clk)) then
       report "data_in=" &
         reverse_string(std_logic_vector_to_string(reg_data_in)) & 
         ", data_out=" &
         reverse_string(std_logic_vector_to_string(reg_data_out));
    end if; 
  end process; 

end behavior; 
