#!/bin/bash

set -euo pipefail

d_name=$1
output_log=$2

grep -A2 $d_name $output_log | grep -q 'Hello, world'
