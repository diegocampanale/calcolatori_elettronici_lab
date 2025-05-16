.equ '0' 48
.equ '9' 57
.equ 'A' 65

.data
error: .string "si e' verificato un errore"
number: .word 141592653
base: .word 33

.text
main:
    lw s0, number
    lb s2, base
    
    li s1,1 #contatore
    
    loop:
        li t0,1
        beqz s0,stampa_loop
        
        remu t2,s0,s2 #t2 = resto
        divu s0,s0,s2 #s0 = quoziente
        
        mv a0,t2
        jal convert_ASCII
        # a0 contiente carattere
        
        addi sp, sp, -1    # Alloca 1 byte sullo stack
        sb   a0, 0(sp)      # Salva il contenuto di a0 sullo stack
        
        addi s1,s1,1
        j loop
     
    stampa_loop:
        beq t0,s1,exit
        lb a0, 0(sp)      # Carica il contenuto in cima allo stack in a0
        addi sp, sp, 1      # Dealloca 4 byte (ripristina lo stack pointer)
        li a7,11
        ecall
        addi t0,t0,1
        j stampa_loop
        
    exit:
    li a7,10
    ecall
    

    convert_ASCII:
        li t0,9
        bgt a0,t0,letter
        blt a0,zero,errore
        is_digit:
            addi a0,a0,'0'
            jr ra
        
        letter:
            li t0,10
            sub a0,a0,t0
            addi a0,a0,'A'
            jr ra
            
    errore:
        la a0,error
        li a7,4
        ecall
        li a7,10
        ecall
        
        