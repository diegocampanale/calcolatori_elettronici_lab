.equ '\n' 10
.equ '0' 48
.equ '9' 57

.data
    input:          .string "Inserisci un numero: " 
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
    loop:
        li a0, 0
        ecall

        lb t2,0(a1)         #t2 contiene cifra letta
        li t3,'\n'          
        beq t2, t3, exitLoop
        li t3,'9'           #t3 contiene '9'
        bgt t2, t3, notNumber
        li t3,'0'           #t3 contiene '0'
        blt t2, t3, notNumber
        sub t2,t2, t3       #t2 contiene cifra letta - '0'
        li t4,10             #t4 contiene 10
    
        mulhu   t1,t0, t4
        bne     t1, zero, overflow
        mul     t0,t0,t4
        add     t1,t0,t2
        bltu    t1, t0, overflow    #brench less than unsigned
        mv      t0, t1
        j       loop

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
        li      a7 36
        ecall
        j       end
        
    end:
        li      a7,10
        ecall