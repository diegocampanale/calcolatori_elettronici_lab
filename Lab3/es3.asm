.equ '\n' 10
.equ '0' 48
.equ '9' 57

.data
    input: .string "Inserisci un numero:"
    errore: .string "Non è un numero"
    successo: .string "Numero valido"

.bss
    buffer: .zero 1
    
.text
    main:
        la a0, input
        li a7,4
        ecall
        
        li a7,63
        la a1,buffer
        li a2, 1
        mv t0, zero #contatore
    loop:
        li a0,0
        ecall
        lb t2, 0(a1)
        li t3, '\n'
        beq t2,t3,exitLoop
        li t3, '0'
        blt t2,t3,notNumber
        li t3, '9'
        bgt t2,t3,notNumber
        addi t0,t0,1
        j loop
  
    notNumber:  
        la a0, errore
        li a7,4
        ecall
        j end
    exitLoop:
        la a0, successo
        li a7,4
        ecall
        j end
    end:
    
    li a7,10
    ecall
    

    