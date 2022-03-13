#!/bin/bash

set -euo pipefail

./lib/run_cmd.sh "make clean"

pushd ../hello_asm/asm > /dev/null
make clean
popd > /dev/null
