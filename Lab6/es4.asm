.data
    mesOut: .string "Il massimo del vettore è: "
    vettore: .word 100,76,43,56,120,3
    max: .word 0
    
.text
    main:
        la a0,vettore
        li a1,6
        jal massimo
        mv t0,a0
        la a0,mesOut
        li a7,4
        ecall
        mv a0,t0
        li a7,1
        ecall
        li a7,10
        ecall
        
    massimo:
        
        mv t0,a0 #indirizzo vettore
        mv t1,a1 # lunghezza vettore
        li t2,0 #contatore
        li t4,0
        ciclo:
            add t0,t0,t4
            lw t3,0(t0)
            li t4,4
            lw t5,max
            ble t3,t5,ciclo
        la s11,max
        sw t3,0(s11)
        addi t2,t2,1
        bne t2,t1,ciclo
     
        la s11,max
        lw a0,0(s11)
        jr ra
         
# Da continuare
