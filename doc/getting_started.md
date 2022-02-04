# Getting started

Please start by visiting the [tools](tools.md) page.

After you have done the tools installation, you can run a script, to set up some necessary environment variables.

Assuming you are at the base of the repo, you run the script, on Mac, as

~~~
source setup/mac.sh
~~~

and on Ubuntu, as

~~~
source setup/ubuntu.sh
~~~

You can now build, run, and test the example programs.

A *hello world* example can be built and run, for VHDL, as

    cd hello/vhdl
    make
    ./run.sh
    cd ../..
    
For Verilog, the commands are

    cd hello/verilog
    make
    ./run.sh
    cd ../..

For SystemC/TLM, the commands are

    cd hello/systemc_tlm
    make
    ./run.sh
    cd ../..

You can build, run, and test, all examples, by doing

~~~
cd test
./make_all.sh 
./run_all.sh 
./test_all.sh 
~~~

When programs run, they sometimes generate waveforms.

You can view an example waveform, for VHDL, as

~~~
./view_one.sh ../flip_flop/vhdl/
~~~

or for Verilog, as

~~~
./view_one.sh ../flip_flop/verilog/
~~~

You can view all waveforms, by doing

~~~
./view_all.sh
~~~

