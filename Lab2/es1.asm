.data
    msg: .string "\nInserire un numero: "
    pari: .string "\nIl numero è pari"
    dispari: .string "\nIl numero è dispari"
    
.bss
    buffer: .zero 255

.text
    main:
        la a0,msg
        li a7, 4
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
        
        andi a0, a0, 1
     
        beq a0,zero,label
        la a0, dispari
        j end
        
        label:
        la a0, pari
        
        end:
        li a7, 4
        ecall
        
    li a7,10
    ecall