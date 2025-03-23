.data
var1: .zero 4
var2: .zero 4
message: .string "\nInserisci un numero: "

.bss
buffer: .zero 255

.text
    main:
        la a0, message
        li a7,4
        ecall
        
        li a7,63
        li a0, 0
        la a1, buffer
        li a2, 255
        ecall
        
        lw a0, 0(a1)
        andi a0,a0,255
        li s11, 0x30    #48
        sub a0,a0,s11
        mv t1,a0
        
        #... 
        
        
    li a7,10
    ecall