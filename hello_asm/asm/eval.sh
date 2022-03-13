#!/bin/bash

set -euo pipefail

d_name=$1
output_log=$2

output_str=$(grep "Hello" $output_log | wc -l  | sed 's/[ ]*//')

expected_output_str="2"

if [ "$output_str" != "$expected_output_str" ]; then
    echo "test $d_name: FAIL"
    echo "output_str : $output_str"
    echo "expected_output_str : $expected_output_str"
    exit 1
fi
