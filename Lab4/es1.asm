.data
    array: .zero 80
.text
    main:
        mv s1,zero #contatore
        la s0, array
        li t1,0
        sw zero, 0(s0)    #a[0] = 0
        addi s1,s1,1
        slli t0, s1, 2     #t0 = i*4 (offset)
        add t0,t0,s0        # t0 = offset + array
        li t2,1            
        sw t2,0(t0)        # array[1] = 1
        li s2,20
    loop:
        bge s1, s2, done 
        slli t0, s1, 2     #t0 = i*4 (offset)
        add t0,t0,s0        # t0 = offset + array
        add t3,t1,t2
        sw t3,0(t0)
        mv t1,t2
        mv t2,t3
        addi s1, s1, 1
        j loop
    done:
        li a7,10
        ecall