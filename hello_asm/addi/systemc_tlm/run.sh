#!/bin/bash

UNAME_S=$(uname -s)
 
if [ $UNAME_S == Linux ]; then
    LD_LIBRARY_PATH=$HOME/sw/systemc/lib-linux64 ./addi_tb
else
    ./addi_tb
fi
