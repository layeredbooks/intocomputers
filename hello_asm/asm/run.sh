#!/usr/bin/expect

spawn qemu-system-riscv32 -machine sifive_u -nographic -bios none -kernel hello -echr 69

sleep 1

expect -re "^.*H.*o"

send "Ex"

