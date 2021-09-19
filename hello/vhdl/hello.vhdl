-- fig_begin hello    
use std.textio.all;

entity hello_world is
end hello_world;

architecture behavior of hello_world is
begin
  process
    variable the_line: line;
  begin
    write(the_line, String'("Hello, world"));
    writeline(output, the_line);
    wait;
  end process;
end behavior;
-- fig_end hello

                 
