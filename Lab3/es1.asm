.data
    op1: .word 0x0000D000
    op2: .word 0xFFFFD000 
    overflow: .string "\noverflow"
    
.text
    main:
    la s0, op1
    la s1, op2
    lw t0, 0(s0)
    lw t1, 0(s1)
    
    mulhu t3,t0,t0
    bne t3,zero,label
    mul a0, t0,t0
    li a7,36
    ecall
    j next
    label:
        li a7, 4
        la a0,overflow
        ecall
    next:
        
    mulhu t3,t1,t1
    bne t3,zero,label1
    mul t2, t1,t1
    li a7,36
    mv a0, t2
    ecall
    j next1
    label1:
        li a7, 4
        la a0,overflow
        ecall
    next1:
        
     mulhu t3,t1,t1
    bne t3,zero,label2
    mul t2, t1,t1
    li a7,36
    mv a0, t2
    ecall
    j next2
    label2:
        li a7, 4
        la a0,overflow
        ecall
    next2:
    
    li a7,10
    ecall
    