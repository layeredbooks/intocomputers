#!/bin/bash

set -euo pipefail

cmd=$1

d_name=$(dirname $0)
base=$d_name/..

echo $base

source $base/lib/traverse.sh

# function traverse {
#     base=$1
#     dir_list=$2
#     layer_list=$3
#     cmd=$4
#     echo "$@"
#     echo  "$1"
#     echo  "$2"
#     echo  "$3"
#     echo  "$4"
#     for dir in $dir_list; do
#         for l_dir in $layer_list; do
#             echo $dir/$l_dir
#             pushd $base/$dir/$l_dir
#             eval $cmd
#             popd
#         done
#     done
# }

traverse $base/.. "$dir_list" "$layer_list" "$cmd"

# for dir in $dir_list; do
#     for l_dir in $layer_list; do
#         echo $dir/$l_dir
#         pushd $base/$dir/$l_dir
#         eval $cmd
#         popd
#     done
# done

# pushd $base/hello/systemc_tlm
# make
# popd > /dev/null


