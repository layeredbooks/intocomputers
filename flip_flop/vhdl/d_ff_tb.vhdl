library ieee; 
use ieee.std_logic_1164.all;

entity d_ff_tb is
end d_ff_tb;

architecture behavior of d_ff_tb is

  component d_ff
    port(
      clk: in std_logic;
      data_in: in std_logic;
      data_out: out std_logic);
  end component;

  signal clk: std_logic := '0';

  constant clk_half_period: time := 2 ns; 
  constant n_clk_cycles: integer := 4; 

  signal d_ff_data_in: std_logic := '0'; 
  signal d_ff_data_out: std_logic;

begin

  d_ff_0: d_ff
    port map(
      clk => clk,
      data_in => d_ff_data_in,
      data_out => d_ff_data_out);

  clk_gen: process is
  begin
    for i in 1 to n_clk_cycles loop
      wait for clk_half_period;
      clk <= '1';
      wait for clk_half_period; 
      clk <= '0';
    end loop;
    wait; 
  end process;

  stim_gen: process is
  begin
    wait for 1 ns;
    d_ff_data_in <= '0';
    wait for 4 ns;
    d_ff_data_in <= '1';
    wait for 4 ns;
    d_ff_data_in <= '0';
    wait;
  end process; 

  reporter: process(clk, d_ff_data_in) is
  begin
    if (rising_edge(clk) or falling_edge(clk) or d_ff_data_in'event) then
       report "data_in=" & std_logic'image(d_ff_data_in) & 
              ", data_out=" & std_logic'image(d_ff_data_out);
    end if; 
  end process; 

end behavior; 
