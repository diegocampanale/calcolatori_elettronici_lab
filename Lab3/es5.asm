## ESERCIZIO 5 
# Scrivere un programma che legge un numero intero con il segno e lo stampa.

.equ '\n' 10
.equ '0' 48
.equ '9' 57
.equ '+' 43
.equ '-' 45

.data
    input:          .string "Inserisci un numero con il segno: " 
    errore:         .string "Non è un numero"
    successo:       .string  "Numero valido: "
    numOverflow:    .string "Si e' verificato overflow"

.bss
    buffer: .zero   1

.text 
    main:
        la a0, input
        li a7, 4
        ecall

        li a7, 63
        la a1, buffer
        li a2,1
        mv t0,zero         #contatore
        mv t5,zero           #flag segno
    loop:
        li a0, 0
        ecall

        lb t2,0(a1)         #t2 contiene cifra letta
        li t3,'\n'          
        beq t2, t3, exitLoop
        bnez t5,cifre        #se non è il primo carattere salta
        li t3,'+'
        blt t2,t3,notNumber
        li t3,'-'
        bgt t2,t3,notNumber
        li t3, 44
        addi t5,t2,-44            #t5 = -1 se + , t5=1 se -
        bgtz t5,neg
        bltz t5,pos
        j notNumber
    neg:
        li t5,-1
        j loop
    pos: 
        li t5,1
        j loop
    cifre:
        li t3,'9'           #t3 contiene '9'
        bgt t2, t3, notNumber
        li t3,'0'           #t3 contiene '0'
        blt t2, t3, notNumber
        sub t2,t2, t3       #t2 contiene cifra letta - '0'
        li t4,10             #t4 contiene 10
            
        mulh t1,t0,t4
        mul t0,t0,t4        #prodotto tra contatore e 10
        li s0,31
        sra t4,t0,s0
        bne t4,t1,overflow
    
        bgtz t5,positivo
        bltz t5,negativo
    positivo: 
        add t1,t0,t2
        blt t1, t0, overflow    #brench less than
        mv t0, t1
        j loop
    negativo:
        sub t1,t0,t2
        bgt t1, t0, overflow    #brench less than 
        mv t0, t1
        j loop

    notNumber:
        la      a0, errore
        li      a7,4
        ecall
        j       end 

    overflow:
        la      a0, numOverflow
        li      a7,4
        ecall
        j       end

    exitLoop:
        la      a0, successo
        li      a7,4
        ecall
        mv      a0,t0
        li      a7 1
        ecall
        j       end
        
    end:
        li      a7,10
        ecall