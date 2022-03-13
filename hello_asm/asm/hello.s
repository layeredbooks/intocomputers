.global _start

_start:

    # the value loaded in t0 is the upper 20 bits of the base for
    # SIFIVE_U_DEV_UART0 in sifive_u_memmap struct in
    # https://git.qemu.org/?p=qemu.git;a=blob;f=hw/riscv/sifive_u.c
    lui t0, 0x10010

    andi t1, t1, 0
    addi t1, t1, 72
    sw t1, 0(t0)

    andi t1, t1, 0
    addi t1, t1, 101
    sw t1, 0(t0)

    andi t1, t1, 0
    addi t1, t1, 108
    sw t1, 0(t0)

    andi t1, t1, 0
    addi t1, t1, 108
    sw t1, 0(t0)

    andi t1, t1, 0
    addi t1, t1, 111
    sw t1, 0(t0)

    andi t1, t1, 0
    addi t1, t1, 10
    sw t1, 0(t0)

finish:
    beq t1, t1, finish
