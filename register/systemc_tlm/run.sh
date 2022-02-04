#!/bin/bash

UNAME_S=$(uname -s)

if [ $UNAME_S == Linux ]; then
    LD_LIBRARY_PATH=$HOME/sw/systemc/lib-linux64 ./n_bit_register_tb
else
    ./n_bit_register_tb
fi
