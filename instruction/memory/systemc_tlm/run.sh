#!/bin/bash

SYSTEMC=/usr/local/systemc-2.3.1a
LIB_DIR=$SYSTEMC/lib-linux64/

LD_LIBRARY_PATH=$LIB_DIR ./addressing_tb
