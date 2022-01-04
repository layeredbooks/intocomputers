#!/bin/bash

# set -euo pipefail

d_name=$1

pushd $d_name > /dev/null
./view.sh &
popd > /dev/null

