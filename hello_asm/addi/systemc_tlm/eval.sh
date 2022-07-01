#!/bin/bash

set -euo pipefail

d_name=$1
output_log=$2

rd_value=$(grep -A35 $d_name $output_log | grep rd_value | \
                  sed 's/^.*rd_value=//' | sed 's/,.*//' | tr '\n' ' ' | \
                  tr -d "\'" | sed 's/[ \t]*$//')

expected_rd_value="10010000 00000000 00000048 00000000 00000000 00000000 00000000"

if [ "$rd_value" != "$expected_rd_value" ]; then
    echo "test $d_name: FAIL"
    echo "rd_value : $rd_value"
    echo "expected_rd_value : $expected_rd_value"
    exit 1
fi

rd=$(grep -A35 $d_name $output_log | grep rd= | \
           sed 's/^.*rd=//' | sed 's/,.*//' | tr '\n' ' ' | \
           tr -d "\'" | sed 's/[ \t]*$//')

expected_rd="05 06 06 00 00 00 00"

if [ "$rd" != "$expected_rd" ]; then
    echo "test $d_name: FAIL"
    echo "rd : $rd"
    echo "expected_rd : $expected_rd"
    exit 1
fi

rs1=$(grep -A35 $d_name $output_log | grep rs1= | \
           sed 's/^.*rs1=//' | sed 's/,.*//' | tr '\n' ' ' | \
           tr -d "\'" | sed 's/[ \t]*$//')

expected_rs1="00 06 06 00 00 00 00"

if [ "$rs1" != "$expected_rs1" ]; then
    echo "test $d_name: FAIL"
    echo "rs1 : $rs1"
    echo "expected_rs1 : $expected_rs1"
    exit 1
fi
