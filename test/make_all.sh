#!/bin/bash

set -euo pipefail

./lib/run_cmd.sh make

pushd ../hello_asm/asm > /dev/null
make
popd > /dev/null
