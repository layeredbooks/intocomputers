library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.string_lib.all;

entity one_instruction_tb is
end one_instruction_tb;

architecture behavior of one_instruction_tb is

  constant size: integer := 12;

  component memory
    generic (size: integer := size);
    port(
      clk: in std_logic;
      write_enable: in std_logic; 
      address: in std_logic_vector(31 downto 0); 
      data_in: in std_logic_vector(31 downto 0);
      data_out: out std_logic_vector(31 downto 0));

  end component;

  component pc
    generic (pc_width: integer := 32);
    port(
      clk: in std_logic;
      pc_out: out std_logic_vector(31 downto 0));

  end component;

  component idecode
    port(
      instr: in std_logic_vector(31 downto 0);
      rd: out std_logic_vector(4 downto 0);
      imm_value: out std_logic_vector(31 downto 0));

  end component;

  component registers is
    port(
      clk: in std_logic;
      write_enable: in std_logic;
      rd: in std_logic_vector(4 downto 0);
      rd_value: in std_logic_vector(31 downto 0);
      r0_value: out std_logic_vector(31 downto 0);
      r1_value: out std_logic_vector(31 downto 0);
      r2_value: out std_logic_vector(31 downto 0));

  end component;

  signal clk: std_logic := '0';

  constant clk_half_period: time := 2 ns; 
  constant n_clk_cycles: integer := 7; 

  signal mem_write_enable: std_logic := '0'; 
  signal data_in: std_logic_vector(31 downto 0) :=
    (others => '0'); 

  signal pc_value: std_logic_vector(31 downto 0);
  signal data_out: std_logic_vector(31 downto 0);

  signal pc_address: std_logic_vector(31 downto 0) := (others => '0');

  signal rd: std_logic_vector(4 downto 0);
  signal imm_value: std_logic_vector(31 downto 0);

  signal reg_write_enable: std_logic := '1'; 
  signal r0_value: std_logic_vector(31 downto 0);
  signal r1_value: std_logic_vector(31 downto 0);
  signal r2_value: std_logic_vector(31 downto 0);

begin

  pc_address <= "00" & pc_value(31 downto 2);

  memory_0: memory
    port map(
      clk => clk,
      write_enable => mem_write_enable,
      address => pc_address,
      data_in => data_in, 
      data_out => data_out);

  pc_0: pc
    port map(
      clk => clk,
      pc_out => pc_value);

  idecode_0: idecode
    port map(
      instr => data_out,
      rd => rd,
      imm_value => imm_value);
  
  registers_0: registers
    port map(
      clk => clk,
      write_enable => reg_write_enable,
      rd => rd,
      rd_value => imm_value,
      r0_value => r0_value, 
      r1_value => r1_value, 
      r2_value => r2_value);

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
         bin_to_hex(reverse_string(std_logic_vector_to_string(data_out))) & 
         LF & "rd=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(rd))) & 
         ", imm_value=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(imm_value))) & 
         LF & "r0_value=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(r0_value))) & 
         ", r1_value=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(r1_value))) & 
         ", r2_value=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(r2_value))) &
         LF;
    end if; 
  end process; 

end behavior; 
