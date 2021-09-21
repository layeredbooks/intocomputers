# Into Computers

This is the software repo for the book
[Into Computers](https://theintobooks.com/computers/intocomputers_vhdl.html).

The software is licensed under GNU GPL, as specified in the file
[LICENSE](LICENSE.md), with copyright as

    Copyright (c) 2021 Ola Dahl

To get started, consider installing the necessary [tools](doc/tools.md).

After tools are installed, please do (on Ubuntu)

    source setup/ubuntu.sh

or (on Mac)

    source setup/mac.sh

To build and run, use the embedded makefiles and *run.sh* scripts.

You can test your tools installation, by running the *hello world* example.

This is done, for VHDL, as

    cd hello/vhdl
    make
    ./run.sh

For Verilog, the commands are

    cd hello/verilog
    make
    ./run.sh
