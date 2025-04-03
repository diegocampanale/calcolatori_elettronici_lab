.data

    
.text
    main:
        li t0, 248
        li t1, 254
        
        andi t0, t0, 255
        andi t1, t1, 255
        
        li s0, -1
        xor s1, t0, s0
        or s1, s1, t1
        xor s2, t0, t1
        or s1, s1, s2
        
        mv a0, s1
        li a7, 1
        ecall
 
        li a7, 10
        ecall