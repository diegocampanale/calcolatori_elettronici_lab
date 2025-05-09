.equ '*' 42
.equ '\n' 10

.data
    
.text
    main:
    
        li a0,8
        jal ra, stampaTriangolo
        li a0,8
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
        