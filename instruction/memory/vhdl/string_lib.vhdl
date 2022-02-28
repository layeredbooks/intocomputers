library ieee;
use ieee.std_logic_1164.all; 

package string_lib is

  function std_logic_vector_to_string(s : std_logic_vector) return string;

  function reverse_string (s : string) return string;
  
  function bin_to_hex (s : string) return string;

end;

package body string_lib is

  function std_logic_vector_to_string(s : std_logic_vector) return string is
    variable ret_string : string(1 to s'length); 
  begin
    for i in 0 to integer(s'length)-1 loop
      if s(i) = '0' then
        ret_string(i+1) := '0';
      elsif s(i) = '1' then
        ret_string(i+1) := '1';
      else
        ret_string(i+1) := 'x';
      end if;
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
  
  function bin_to_hex (s : string) return string is
    variable n_hex_chars : integer := s'length / 4;
    variable ret_string : string(1 to n_hex_chars);
    variable four_string : string(1 to 4);
  begin
    for i in 1 to n_hex_chars loop
      four_string := s(1 + (i - 1)*4 to i*4);
      case four_string is
        when "0000" => ret_string(i) := '0';
        when "0001" => ret_string(i) := '1';
        when "0010" => ret_string(i) := '2';
        when "0011" => ret_string(i) := '3';
        when "0100" => ret_string(i) := '4';
        when "0101" => ret_string(i) := '5';
        when "0110" => ret_string(i) := '6';
        when "0111" => ret_string(i) := '7';
        when "1000" => ret_string(i) := '8';
        when "1001" => ret_string(i) := '9';
        when "1010" => ret_string(i) := 'a';
        when "1011" => ret_string(i) := 'b';
        when "1100" => ret_string(i) := 'c';
        when "1101" => ret_string(i) := 'd';
        when "1110" => ret_string(i) := 'e';
        when "1111" => ret_string(i) := 'f';
        when others => ret_string(i) := 'x';
      end case;
    end loop;
    return ret_string;
  end function;

end package body;

