#!/bin/bash

set -euo pipefail

cmd=$1

d_name=$(dirname $0)
base=$d_name/..

echo $base

source $base/lib/traverse.sh

traverse $base/.. "$dir_list" "$layer_list" "$cmd"

