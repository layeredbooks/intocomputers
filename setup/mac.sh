#!/bin/bash

# https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo $SCRIPT_DIR

# base dir
export BASE_DIR=$(dirname $SCRIPT_DIR)

echo $BASE_DIR

# export BASE_DIR=$(dirname $0)

# ghdl
export PATH=$HOME/sw/ghdl/bin:$PATH

# gtk_wave
# export GTK_WAVE=$HOME/sw/gtkwave/gtkwave.app/Contents/Resources/bin/gtkwave
export PATH=$HOME/sw/gtkwave/gtkwave.app/Contents/Resources/bin:$PATH
