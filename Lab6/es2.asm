.equ '*' 42
.equ '\n' 10
.equ '0' 48

.data
    mesInput: .string "Inserisci dimensione lato: "

.bss
     buffer: .zero 1
    
.text
    main:
        la a0,mesInput
        li a7, 4
        ecall
        
        li a0,0
        la a1,buffer
        li a2,1
        li a7,63
        ecall
        
        lb a0,0(a1)
        li s0,'0'
        sub a0,a0,s0
        mv t5,a0
        jal ra, stampaTriangolo
        mv a0,t5
        jal ra, stampaQuadrato
        
        
        li a7,10
        ecall
    
    stampaTriangolo:
        li t0,1
        mv t1,a0
        ciclo1: 
            li s0, 1 # contatore
            # t0 = num asterischi da stampare
            ciclo2:
                li a0,42
                li a7,11
                ecall
                
                addi s0, s0, 1
                bgt s0, t0, end_ciclo2
                
                jal x0, ciclo2
        end_ciclo2:
            li a0,'\n'
            li a7,11
            ecall
            
            addi t0,t0,1
            bgt t0,t1,end_ciclo1
            
            jal x0,ciclo1
            
        end_ciclo1:
            jr ra
            
    stampaQuadrato:
        li t0,1
        mv t1,a0
        ciclo1_square:
            li s0,1
            # t1 = num asterischi per riga
            ciclo2_square:
                li a0,'*'
                li a7,11
                ecall
                addi s0,s0,1
                bgt s0,t1,end_ciclo2_square
                j ciclo2_square 
            end_ciclo2_square:
                li a0, '\n'
                li a7,11
                ecall
                addi t0,t0,1
                bgt t0,t1,end_ciclo1_square
                j ciclo1_square
            end_ciclo1_square:
                jr ra
        