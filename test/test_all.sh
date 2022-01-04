#!/bin/bash

# set -euo pipefail

date_info=$(date)
printf "\n--- Test Log - $date_info ---\n\n" > output.log

./test_one.sh ../hello/vhdl
./test_one.sh ../hello/verilog
./test_one.sh ../hello/systemc_tlm

./test_one.sh ../flip_flop/vhdl
./test_one.sh ../flip_flop/verilog
./test_one.sh ../flip_flop/systemc_tlm

# ../hello/systemc_tlm/test.sh

