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











We can install Icarus Verilog on Mac, using information about
installation from source from this
[installation guide](https://iverilog.fandom.com/wiki/Installation_Guide).

We create a directory for the repo, as

    mkdir -p $HOME/sw_repo
    cd $HOME/sw_repo

We clone the Git repo, as

    git clone https://github.com/steveicarus/iverilog.git

The source can then be extracted and built, using the commands

    cd iverilog
	sh autoconf.sh
	./configure --prefix=$HOME/sw/iverilog
	make
	make install

