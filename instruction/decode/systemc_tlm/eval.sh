#!/bin/bash

set -euo pipefail

d_name=$1
output_log=$2

r0_value=$(grep -A35 $d_name $output_log | grep r0_value | \
                  sed 's/^.*r0_value=//' | sed 's/,.*//' | tr '\n' ' ' | \
                  tr -d "\'" | sed 's/[ \t]*$//')

expected_r0_value="00001000 00001000 00001000 00000000 00000000 00000000"

if [ "$r0_value" != "$expected_r0_value" ]; then
    echo "test $d_name: FAIL"
    echo "r0_value : $r0_value"
    echo "expected_r0_value : $expected_r0_value"
    exit 1
fi

r1_value=$(grep -A35 $d_name $output_log | grep r1_value | \
                  sed 's/^.*r1_value=//' | sed 's/,.*//' | tr '\n' ' ' | \
                  tr -d "\'" | sed 's/[ \t]*$//')

expected_r1_value="00000000 00002000 00002000 00002000 00000000 00000000"

if [ "$r1_value" != "$expected_r1_value" ]; then
    echo "test $d_name: FAIL"
    echo "r1_value : $r1_value"
    echo "expected_r1_value : $expected_r1_value"
    exit 1
fi

r2_value=$(grep -A35 $d_name $output_log | grep r2_value | \
                  sed 's/^.*r2_value=//' | tr '\n' ' ' | \
                  tr -d "\'" | sed 's/[ \t]*$//')

expected_r2_value="00000000 00000000 00003000 00003000 00003000 00000000"

if [ "$r2_value" != "$expected_r2_value" ]; then
    echo "test $d_name: FAIL"
    echo "r2_value : $r2_value"
    echo "expected_r2_value : $expected_r2_value"
    exit 1
fi
