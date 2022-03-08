#!/bin/bash

# set -euo pipefail

d_name=$1
layer=$2

c_dir=$PWD
output_log=$c_dir/${layer}_output.log

pushd $d_name > /dev/null

echo "--- $d_name" >> $output_log
./run.sh $d_name >> $output_log 2>&1
echo " " >> $output_log

popd > /dev/null

$d_name/eval.sh $d_name $output_log

if [ $? -eq 0 ]; then
    echo $d_name: PASS
else
    echo $d_name: FAIL
    exit 1
fi
