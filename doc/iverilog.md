# Icarus Verilog

## Ubuntu

We can install [Icarus Verilog](http://iverilog.icarus.com/) in Ubuntu, as a package, by doing

    sudo apt install iverilog

## Mac

Using [Homebrew](https://brew.sh/) on Mac, we can install Icarus Verilog as

    brew install icarus-verilog

We can try the installed Icarus Verilog on an example, with Verilog code in a file
[hello.v](../hello/verilog/hello.v) by compiling as

    iverilog -o hello hello.v

The above command generates the file hello, which can be run, by doing

    vvp hello

which results in the printout

    Hello, world


