#!/bin/bash

# set -euo pipefail

date_info=$(date)

for layer in vhdl verilog systemc_tlm
do
   printf "\n--- Test Log - $date_info ---\n\n" > ${layer}_output.log
done

printf "\n--- Test Log - $date_info ---\n\n" > all_output.log

./test_one.sh ../hello/vhdl vhdl
./test_one.sh ../hello/verilog verilog
./test_one.sh ../hello/systemc_tlm systemc_tlm

./test_one.sh ../flip_flop/vhdl vhdl
./test_one.sh ../flip_flop/verilog verilog
./test_one.sh ../flip_flop/systemc_tlm systemc_tlm

./test_one.sh ../register/vhdl vhdl
./test_one.sh ../register/verilog verilog
./test_one.sh ../register/systemc_tlm systemc_tlm

./test_one.sh ../instruction/memory/vhdl vhdl
./test_one.sh ../instruction/memory/verilog verilog
./test_one.sh ../instruction/memory/systemc_tlm systemc_tlm

./test_one.sh ../instruction/decode/vhdl vhdl
./test_one.sh ../instruction/decode/verilog verilog
./test_one.sh ../instruction/decode/systemc_tlm systemc_tlm

./test_one.sh ../hello_asm/asm all

./test_one.sh ../hello_asm/andi/vhdl vhdl
./test_one.sh ../hello_asm/andi/verilog verilog
./test_one.sh ../hello_asm/andi/systemc_tlm systemc_tlm

