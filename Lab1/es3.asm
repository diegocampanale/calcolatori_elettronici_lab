.data

op1: .byte 150 # 2^7 = 128 quindi utilizza bit di peso 7
op2: .byte 100

main:
.text

la s11, op1
lbu t0, 0(s11)
lb t1, op2
add a0, t0, t1
addi a7, x0, 1
ecall
addi a7, x0, 10
ecall