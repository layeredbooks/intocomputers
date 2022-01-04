#!/bin/bash

# set -euo pipefail

d_name=$1

c_dir=$(PWD)

pushd $d_name > /dev/null

echo "--- $d_name" >> $c_dir/output.log
./run.sh $d_name >> $c_dir/output.log 2>&1
echo " " >> $c_dir/output.log

popd > /dev/null

$d_name/eval.sh $d_name

if [ $? -eq 0 ]; then
    echo $d_name: PASS
else
    echo $d_name: FAIL
    exit 1
fi
