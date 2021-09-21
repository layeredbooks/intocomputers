# SystemC/TLM on Mac

We can download SystemC and TLM
from [Accellera](http://accellera.org/downloads/standards/systemc).

A directory for the download can be created, as

    mkdir -p $HOME/sw_download/systemc
    cd $HOME/sw_download/systemc

The source code from SystemC and TLM can be downloaded, as

curl -L https://accellera.org/images/downloads/standards/systemc/systemc-2.3.3.tar.gz  --output systemc-2.3.3.tar.gz

We unpack the file, using the command

    tar zxvf systemc-2.3.3.tar.gz

A directory for the installation is created, as

    mkdir -p $HOME/sw/systemc

A build directory is created, and navigated to, as

    cd systemc-2.3.3
    mkdir objdir
    cd objdir

Configure and build can now be done, as

    ../configure --prefix=$HOME/sw/systemc CXXFLAGS="-Wall -std=c++11"
    make -j

We can test the build, by doing

    make -j check

which takes some time to execute.

As a last step, we can install by doing

    make install

We can try the installed SystemC on an example, with C++ code in a file
[hello.cpp](../hello/systemc_tlm/hello.cpp).

We compile the C++ code, as

    g++ -Wall -std=c++11 -c -I $HOME/sw/systemc/include hello.cpp

Linking is done by

    g++ -o hello hello.o -L $HOME/sw/systemc/lib-macosx64 -lsystemc

The program can be run on Mac by giving the command

    ./hello

resulting in a printout of the form

            SystemC 2.3.3-Accellera --- Sep 21 2021 06:25:05
            Copyright (c) 1996-2018 by all Contributors,
            ALL RIGHTS RESERVED
    Hello, world
