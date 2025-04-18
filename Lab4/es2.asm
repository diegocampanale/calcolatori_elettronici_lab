.equ '0' 48

.data
        
        # Variabili Iniziali
    opa: .word 2043
    opb: .word 5
    res: .zero 4
    
        #Messaggi
    mesStart: .string "\nOperazioni:"
    mesAdd: .string "\n0 : a + b"
    mesSub: .string "\n1 : a - b"
    mesMul: .string "\n2 : a * b"
    mesDiv: .string "\n3 : a / b"
    mesInput: .string "\nInserisci un valore: "
    mesErroreInput: .string "Valore non Valido"
    mesDone: .string "Il risultato è: " 
    
.bss
    buffer: .zero 1

.text
    main:
        li a7,4
        la a0, mesStart
        ecall
        li a7,4
        la a0, mesAdd
        ecall
        li a7,4
        la a0, mesSub
        ecall
        li a7,4
        la a0, mesMul
        ecall
        li a7,4
        la a0, mesDiv
        ecall
        li a7,4
        la a0, mesInput
        ecall
        
            #INPUT SCELTA
        li a7, 63
        la a1, buffer
        li a0,0
        li a2, 255
        ecall
        
            #TRANSOFORM INPUT TO INTEGER
        lb a0, 0(a1)
        li s11, '0'
        sub a0, a0, s11
        
        # CONTROLLO RANGE INPUT 0-4
        blt a0,zero,errore
        li s11,3
        bgt a0,s11,errore
            
            # SWITCH
        mv t0,a0
    
        li t1,0
        beq t0,t1,addizione
        li t1,1
        beq t0,t1,sottrazione
        li t1,2
        beq t0,t1,moltiplicazione
        li t1,3
        beq t0,t1,divisione
    end_switch:             #risultato in a0
        la s11, res
        sw a0,0(s11)
        add t0,x0,a0
        
        li a7,4
        la a0,mesDone
        ecall
        li a7,1
        mv a0,t0
        ecall
         
        j exit
        
    
            #FUNZIONI OPERAZIONI
    addizione:
        lw t0, opa
        lw t3, opb
        add a0, t0, t3   
        j end_switch

    sottrazione:
        lw a0, opa
        lw t3, opb
        sub a0, a0, t3        
        j end_switch
        
    moltiplicazione:
        lw a0, opa
        lw t3, opb
        mul a0, a0, t3
        j end_switch
        
    divisione:
        lw a0, opa
        lw t3, opb
        div a0, a0, t3
        j end_switch
        
    errore:
        li a7,4
        la a0,mesErroreInput
        ecall
        j exit
        
    exit:
        li a7,10
        ecall