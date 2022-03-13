#!/bin/bash

qemu-system-riscv32 -machine sifive_u -nographic -bios none -kernel hello
