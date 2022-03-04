#!/bin/bash

set -euo pipefail

d_name=$1
output_log=$2

data_out=$(grep -A12 $d_name $output_log | grep data_out | \
           sed 's/^.*data_out=//' | tr '\n' ' ' | tr -d "\'" | sed 's/[ \t]*$//')

expected_data_out="U 0 0 0 1 1 1 0 0 0"

if [ "$data_out" != "$expected_data_out" ]; then
    echo "test $d_name: FAIL"
    echo "data_out : $data_out"
    echo "expected_data_out : $expected_data_out"
    exit 1
fi

