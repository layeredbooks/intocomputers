#!/bin/bash

set -euo pipefail

d_name=$1

grep -A5 $d_name output.log | grep -q 'Hello, world'
