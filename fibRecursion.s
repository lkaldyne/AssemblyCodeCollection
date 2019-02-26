main:
    addi, a0, x0, 3
    addi s1, x0, 1
    jal ra, fib
    j cleanup
fib:
    beq a0, x0, returnZero
    beq a0, s1, returnOne
    addi sp, sp, -8
    sw a0, 0(sp)
    sw ra, 4(sp)
#Left Depth
    addi a0, a0, -1
    jal ra, fib

addi sp, sp, -8
sw a0, 0(sp)
sw ra, 4(sp)

#Right depth
    addi a0, a0, -2
    jal ra, fib

j returnZero

returnOne:
    addi s0, s0, 1
returnZero:
    mv t0, ra
    lw ra, 4(sp)
    lw a0, 0(sp)
    addi sp, sp, 8
    jr t0

cleanup:
    mv a0, s0
    addi ra, x0, 0
    addi t0, x0, 0
    addi sp, x0, 0
    addi s0, x0, 0
    addi s1, x0, 0
