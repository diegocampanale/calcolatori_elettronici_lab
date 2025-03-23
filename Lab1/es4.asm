.data
var: .word 0x3FFFFFF0
mes: .string "\n"

.text
    main:
        lw t0, var
        add t1,t0,t0
        li a7,1
        add a0, zero, t1
        ecall
        
        la a0,mes
        li a7, 4
        ecall
        
        addi a0,t1,40
        li a7,1
        ecall

        
        li a7,10
        ecall