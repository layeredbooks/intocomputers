#!/bin/bash

set -euo pipefail

dir_list="hello flip_flop register"

layer_list="vhdl verilog systemc_tlm"

function traverse {
    base=$1
    dir_list=$2
    layer_list=$3
    cmd=$4
    for dir in $dir_list; do
        for l_dir in $layer_list; do
            echo $dir/$l_dir
            pushd $base/$dir/$l_dir > /dev/null
            eval $cmd
            popd > /dev/null
        done
    done
}
