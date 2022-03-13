# Tools

Here you can find information about the tools needed to run the examples in the book
Into Computers.

## System Requirements

We have installed, and used, tools on

* Ubuntu
* macOS Monterey

## VHDL

For the VHDL layer, we use [GHDL](ghdl.md).

## Verilog

For the Verilog layer, we use  [Icarus Verilog](iverilog.md).

## SystemC/TLM

For the SystemC/TLM layer, we use [SystemC and TLM](systemc_tlm.md).

## Waveforms

For visualizing waveforms, we use [GTKWave](gtkwave.md).

## RISC-V toolchain

We use a gcc-based RISC-V toolchain, to assemble, compile, and link programs, on 
[Mac](risc_v_toolchain_mac.md) 
and [Ubuntu](risc_v_toolchain_ubuntu.md).

## QEMU

We use QEMU to run programs (as a reference, to compare with the computer
we are building), on 
[Mac](qemu_mac.md) 
and [Ubuntu](qemu_ubuntu.md).

## Expect

We use 
[expect](https://linux.die.net/man/1/expect) for running a test with QEMU. 

You can install expect in Mac, using 
[Homebrew](https://brew.sh/), with the command

    brew install expect

You can install expect in Ubuntu, with the command

    sudo apt install expect

