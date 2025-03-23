.data
    wVar: .word 3

.text
    main:

    li t0,10
    la s11, wVar
    sw t0, 0(s11)

    li a7,10
    ecall