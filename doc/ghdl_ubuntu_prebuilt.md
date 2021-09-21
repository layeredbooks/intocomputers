# Installing a prebuilt ghdl on Ubuntu

We start with installing gnat, as

    sudo apt install gnat

From the
[GHDL GitHub site](https://github.com/ghdl/ghdl), we learn that
one can use a prebuilt version of GHDL.

A directory for the download can be created, as

    mkdir -p $HOME/sw_download/ghdl
    cd $HOME/sw_download/ghdl

From this page with GHDL
[releases](https://github.com/ghdl/ghdl/releases), a prebuilt version
can be downloaded, as

    curl -L https://github.com/ghdl/ghdl/releases/download/nightly/ghdl-gha-ubuntu-18.04-mcode.tgz --output ghdl-gha-ubuntu-18.04-mcode.tgz

After unpacking, as

    tar zxvf ghdl-gha-ubuntu-18.04-mcode.tgz

and moving the unpacked content to a directory created and chosen for the GHDL
installation, as

    mkdir -p $HOME/sw/ghdl
    mv bin $HOME/sw/ghdl
    mv include $HOME/sw/ghdl
    mv lib $HOME/sw/ghdl

we can try the installation on an example.

Assuming that ghdl is in the *PATH* environment variable, either by
sourcing the file [ubuntu.sh](../setup/ubuntu.sh) or
by a command, such as

    export PATH=$HOME/sw/ghdl/bin:$PATH

we can try the installed GHDL on an example, with VHDL code in a file
[hello.vhdl](../hello/vhdl/hello.vhdl) as

    ghdl -a hello.vhdl
    ghdl -r hello_world

with a resulting printout, as

    Hello, world




