library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.string_lib.all;

entity addressing_tb is
end addressing_tb;

architecture behavior of addressing_tb is

  constant address_width: integer := 16;
  constant data_width: integer := 32;
  constant size: integer := 12;
  
  component memory
    generic (address_width: integer := address_width;
             data_width: integer := data_width;
             size: integer := size);
    port(
      clk: in std_logic;
      write_enable: in std_logic; 
      address: in std_logic_vector(address_width-1 downto 0); 
      data_in: in std_logic_vector(data_width-1 downto 0);
      data_out: out std_logic_vector(data_width-1 downto 0));

  end component;

  component pc
    generic (pc_width: integer := address_width);
    port(
      clk: in std_logic;
      pc_out: out std_logic_vector(address_width-1 downto 0));

  end component;

  signal clk: std_logic := '0';

  constant clk_half_period: time := 2 ns; 
  constant n_clk_cycles: integer := 7; 

  signal write_enable: std_logic := '0'; 
  signal data_in: std_logic_vector(data_width-1 downto 0) :=
    (others => '0'); 

  signal pc_value: std_logic_vector(address_width-1 downto 0);
  signal data_out: std_logic_vector(data_width-1 downto 0);

  signal pc_address: std_logic_vector(address_width-1 downto 0) := (others => '0');

begin

  pc_address <= "00" & pc_value(address_width-1 downto 2);

  memory_0: memory
    port map(
      clk => clk,
      write_enable => write_enable,
      address => pc_address,
      data_in => data_in, 
      data_out => data_out);

  pc_0: pc
    port map(
      clk => clk,
      pc_out => pc_value);

  clk_gen: process is
  begin
    for i in 1 to n_clk_cycles loop
      clk <= '0';
      wait for clk_half_period;
      clk <= '1';
      wait for clk_half_period; 
    end loop;
    wait; 
  end process;

  reporter: process(clk) is
  begin
    if (rising_edge(clk)) then
       report LF & "pc_value=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(pc_value))) & 
         ", data_out=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(data_out)));
    end if; 
  end process; 

end behavior; 
