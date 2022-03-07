# A RISC-V toolchain on Mac

We use a gcc-based 
[RISC-V toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain).

Before cloning the repo for the toolchain, we create, as
[recommended](https://github.com/riscv-collab/riscv-gnu-toolchain#readme),
a case-sensitive
partition on the Mac filesystem.

We do this, using the 
[Disk
Utility](https://kb.sandisk.com/app/answers/detail/a_id/20985/~/how-to-access-disk-utility-on-mac-os)
program, where we create a new, case-sensitive, image, following instructions from
[this post](https://coderwall.com/p/mgi8ja/case-sensitive-git-in-mac-os-x-like-a-pro).

We clone the repo, using

    git clone https://github.com/riscv-collab/riscv-gnu-toolchain

Some programs are installed, as
[recommended](https://github.com/riscv-collab/riscv-gnu-toolchain#readme),
by doing

    brew install python3 gawk gnu-sed gmp mpfr libmpc isl zlib expat
    brew tap discoteq/discoteq
    brew install flock

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
