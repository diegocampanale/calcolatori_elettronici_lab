.equ 'DIM',5
.data
    vet1: .word 56, 12, 98, 129, 58
    vet2: .word 1, 0, 245, 129, 12
    risultato: .zero 20
.text
    main:
        la a0,vet1
        la a1,vet2
        la a2,risultato
        li a3,'DIM'
        jal calcola_distanzaH
        li a7,10
        ecall
        
    calcola_distanzaH:
        # a0=vet1 a1=vet2 a2=risultato a3=DIM
        
        li t0,0 # indice
        loop:
            bge t0,a3,end_loop
            lw t1, 0(a0)
            lw t2,0(a1)
         
            
            li s0, 0
            li s1, 
            loopH:
                
                
                j loopH
            end_loopH:
                
                
            addi t0,t0,1
            j loop
        end_loop:
            jr ra
        
:        