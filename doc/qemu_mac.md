# QEMU for RISC-V on Mac

We clone the QEMU repo, as

    git clone https://git.qemu.org/git/qemu.git

We navigate to the directory, and acquire submodules, as

    cd qemu
    git submodule init
    git submodule update --recursive
  
A build directory is created, and navigated to, as

    mkdir objdir
    cd objdir

We configure QEMU for 32-bit RISC-V, as

    ../configure --target-list=riscv32-softmmu --prefix=$HOME/sw/qemu_riscv

Building is done, as

    make -j

Installation is done, as
  
    make install
  
We can try the installtion, by starting QEMU, as 

    $HOME/sw/qemu_riscv/bin/qemu-system-riscv32 --help | head

This should give a printout, like

    QEMU emulator version 6.2.50 (v6.2.0-2128-g9d662a6b22)
    Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
    usage: qemu-system-riscv32 [options] [disk_image]

    'disk_image' is a raw hard disk image for IDE hard disk 0

    Standard options:
    -h or -help     display this help and exit
    -version        display version information and exit
    -machine [type=]name[,prop[=value][,...]]

