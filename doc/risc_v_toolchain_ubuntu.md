# A RISC-V toolchain on Ubuntu

We use a gcc-based 
[RISC-V toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain).

We clone the repo, using

    git clone https://github.com/riscv-collab/riscv-gnu-toolchain

Some programs are installed, as
[recommended](https://github.com/riscv-collab/riscv-gnu-toolchain#readme),
by doing

    sudo apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev

We navigate to the cloned repo, as
    
    cd riscv-gnu-toolchain

where we create a build directory, as

    mkdir objdir
    cd objdir/

We configure, by doing 

    ../configure --prefix=$HOME/sw/gcc_riscv --with-arch=rv32gc --with-abi=ilp32d

The build (which takes time, and emits several warnings), is then started, by doing

    make -j

You can check that the compiler can be started, by doing

    $HOME/sw/gcc_riscv/bin/riscv32-unknown-elf-gcc -v

This should give a printout, like

    riscv32-unknown-elf-gcc () 11.1.0
    Copyright (C) 2021 Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
