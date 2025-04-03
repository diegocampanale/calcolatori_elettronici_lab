.data
    n0: .word 2004
    n1: .word 2008
    n2: .word 1997
    space: .string " "
    
.text
    main:
        lw t0, n0
        lw t1, n1
        lw t2, n2
     
        bge t0, t1, swap1
        j end1
        
    swap1:
        mv s11, t0
        mv t0, t1
        mv t1, s11
        
    end1:
        bge t0, t2, swap2
        j end2
        
    swap2:
        mv s11, t0
        mv t0, t2
        mv t2, s11
        
    end2:
        bge t1, t2, swap3
        j end3
        
    swap3:
        mv s11, t1
        mv t1, t2
        mv t2, s11
        
    end3:
        mv a0,t0
        li a7,1
        ecall
        la a0, space
        li a7,4
        ecall
        mv a0,t1
        li a7,1
        ecall
        la a0, space
        li a7,4
        ecall
        mv a0,t2
        li a7,1
        ecall

    li a7,10
    ecall