.equ DIM, 3
.data
    mat1:.word 4, -45, 15565, 6458, 4531, 124, -548, 2124, 31000
    mat2:.word 6, -5421, -547, -99, 4531, 1456, 4592, 118, 31999
    indice:.word 2
    vet_out: .zero DIM*4
.text
    main:
        la a0, mat1
        la a1, mat2
        la a2, vet_out
        li a3, DIM
        la t0, indice
        lw a4, 0(t0)
        jal variazione
        li a7, 10
        ecall
    
    variazione:
        
        #Setup m1
        mv t0, a3       
        slli t0, t0, 2   
        mul t1, a4, t0   # t1 = riga i mat1
        add a0,a0,t1 
        
        slli t2, a4, 2   # t2 = i*4 = colonna i mat2
        add a1,a1,t2     
        
        li t5,100
        li t0, 0
        
        loop_mat:
            bge t0,a3, exit_loop
            lw t3, 0(a0)
            lw t4, 0(a1)

            sub t4,t4,t3 # (valore2-valore1)
            mul t4, t4, t5 # (valore2-valore1) ∙ 100
            div t4, t4, t3 # (valore2-valore1) ∙ 100 / valore1
            sw t4, 0(a2)
            
            addi t0,t0,1
            addi a0, a0, 4
            mv t1, a3 
            slli t1,t1,2
            add a1,a1, t1
            addi a2,a2,4
            j loop_mat
        exit_loop:
            jr ra
            
            
            