#!/bin/bash

# set -euo pipefail

date_info=$(date)

for layer in vhdl verilog systemc_tlm
do
   printf "\n--- Test Log - $date_info ---\n\n" > ${layer}_output.log
done

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

# ../hello/systemc_tlm/test.sh

