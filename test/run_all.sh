#!/bin/bash

set -euo pipefail

./lib/run_cmd.sh ./run.sh

pushd ../hello_asm/asm > /dev/null
./run.sh
popd > /dev/null
