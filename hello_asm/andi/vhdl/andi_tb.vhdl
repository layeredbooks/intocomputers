library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.string_lib.all;

entity andi_tb is
end andi_tb;

architecture behavior of andi_tb is

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
    port(
      clk: in std_logic;
      pc_out: out std_logic_vector(31 downto 0));

  end component;

  component idecode
    port(
      instr: in std_logic_vector(31 downto 0);
      imm_value: out std_logic_vector(31 downto 0);
      rs1: out std_logic_vector(4 downto 0);
      rd: out std_logic_vector(4 downto 0);
      opcode: out std_logic_vector(6 downto 0));

  end component;

  component registers is
    port(
      clk: in std_logic;

      rs1: in std_logic_vector(4 downto 0);
      rs2: in std_logic_vector(4 downto 0);
      rd: in std_logic_vector(4 downto 0);

      rd_value: in std_logic_vector(31 downto 0);

      write_enable: in std_logic;

      rs1_value: out std_logic_vector(31 downto 0);
      rs2_value: out std_logic_vector(31 downto 0));

  end component;

  component alu is
    port(
      a: in std_logic_vector(31 downto 0);
      b: in std_logic_vector(31 downto 0);
      opcode: in std_logic_vector(6 downto 0);
      result: out std_logic_vector(31 downto 0));

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

  signal rs1: std_logic_vector(4 downto 0);
  signal rs2: std_logic_vector(4 downto 0) := (others => '0');
  signal rd: std_logic_vector(4 downto 0);
  signal opcode: std_logic_vector(6 downto 0);

  signal imm_value: std_logic_vector(31 downto 0);

  signal reg_write_enable: std_logic := '1'; 
  signal rd_value: std_logic_vector(31 downto 0);
  signal rs1_value: std_logic_vector(31 downto 0);
  signal rs2_value: std_logic_vector(31 downto 0);

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
      imm_value => imm_value,
      rs1 => rs1,
      rd => rd,
      opcode => opcode);
  
  registers_0: registers
    port map(
      clk => clk,
      rs1 => rs1,
      rs2 => rs2,
      rd => rd,
      rd_value => rd_value,
      write_enable => reg_write_enable,
      rs1_value => rs1_value, 
      rs2_value => rs2_value);

  alu_0: alu
    port map(
      a => imm_value,
      b => rs1_value,
      opcode => opcode,
      result => rd_value);

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
         ", rs1=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(rs1))) & 
         LF & "rd=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(rd))) & 
         ", imm_value=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(imm_value))) & 
         ", rd_value=" &
         bin_to_hex(reverse_string(std_logic_vector_to_string(rd_value)));
    end if; 
  end process; 

end behavior; 
