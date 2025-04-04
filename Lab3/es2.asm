.equ '\n' 10

.data
    op1: .word 0x0000D000
    op2: .word 0xFFFFD000 
    overflow: .string "overflow"
    
.text
    la s0, op1
    la s1, op2
    lw t0, 0(s0)
    lw t1, 0(s1)
    
    mulh t2, t0,t0
    mul a0, t0, t0
    li s0, 31
    sra t3,a0,s0
    
    beq t2,t3,label
    la a0, overflow
    li a7,4
    ecall
    j next
    label:
        li a7,1
        ecall
    next:
    li a0, '\n'
    li a7, 11
    ecall
    
    mulh t2, t1,t1
    mul a0, t1, t1
    li s0, 31
    sra t3,a0,s0
    
    beq t2,t3,label1
    la a0, overflow
    li a7,4
    ecall
    j next1
    label1:
        li a7,1
        ecall
    next1:
    li a0, '\n'
    li a7, 11
    ecall
        
    mulh t2, t0,t1
    mul a0, t0, t1
    li s0, 31
    sra t3,a0,s0
    
    beq t2,t3,label2
    la a0, overflow
    li a7,4
    ecall
    j next2
    label2:
        li a7,1
        ecall
    next2:
    
    li a7,10
    ecall
    