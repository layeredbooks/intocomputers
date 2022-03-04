#!/bin/bash

set -euo pipefail

d_name=$1
output_log=$2

reg_0_value=$(grep -A35 $d_name $output_log | grep reg_0_value | \
                  sed 's/^.*reg_0_value=//' | sed 's/,.*//' | tr '\n' ' ' | \
                  tr -d "\'" | sed 's/[ \t]*$//')

expected_reg_0_value="xxxxxxxx 00001000 00001000 00001000 00000000 00000000 00000000"

if [ "$reg_0_value" != "$expected_reg_0_value" ]; then
    echo "test $d_name: FAIL"
    echo "reg_0_value : $reg_0_value"
    echo "expected_reg_0_value : $expected_reg_0_value"
    exit 1
fi

reg_1_value=$(grep -A35 $d_name $output_log | grep reg_1_value | \
                  sed 's/^.*reg_1_value=//' | sed 's/,.*//' | tr '\n' ' ' | \
                  tr -d "\'" | sed 's/[ \t]*$//')

expected_reg_1_value="xxxxxxxx xxxxxxxx 00002000 00002000 00002000 00000000 00000000"

if [ "$reg_1_value" != "$expected_reg_1_value" ]; then
    echo "test $d_name: FAIL"
    echo "reg_1_value : $reg_1_value"
    echo "expected_reg_1_value : $expected_reg_1_value"
    exit 1
fi

reg_2_value=$(grep -A35 $d_name $output_log | grep reg_2_value | \
                  sed 's/^.*reg_2_value=//' | tr '\n' ' ' | \
                  tr -d "\'" | sed 's/[ \t]*$//')

expected_reg_2_value="xxxxxxxx xxxxxxxx xxxxxxxx 00003000 00003000 00003000 00000000"

if [ "$reg_2_value" != "$expected_reg_2_value" ]; then
    echo "test $d_name: FAIL"
    echo "reg_2_value : $reg_2_value"
    echo "expected_reg_2_value : $expected_reg_2_value"
    exit 1
fi
