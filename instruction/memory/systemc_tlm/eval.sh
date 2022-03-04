#!/bin/bash

set -euo pipefail

d_name=$1
output_log=$2

data_out=$(grep -A12 $d_name $output_log | grep data_read | \
           sed 's/^.*data_read=//' | tr '\n' ' ' | tr -d "\'" | sed 's/[ \t]*$//')

expected_data_out="000012b7 00002337 000033b7 000002b7 00000337 000003b7 00000000"

if [ "$data_out" != "$expected_data_out" ]; then
    echo "test $d_name: FAIL"
    echo "data_out : $data_out"
    echo "expected_data_out : $expected_data_out"
    exit 1
fi
