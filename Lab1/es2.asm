.data
var1: .byte 0x6D
var2: .byte 0x69 
var3: .byte 0x70
var4: .byte 0x73
var5: .byte 0x00

.text
    
main:
    li t1,32

    la s11, var1
    lb t0, var1
    sub t0,t0,t1
    sb t0, 0(s11)
    la s11, var2
    lb t0, 0(s11)
    sub t0,t0,t1
    sb t0, 0(s11)
    la s11, var3
    lb t0, 0(s11)
    sub t0,t0,t1
    sb t0, 0(s11)
    la s11, var4
    lb t0, 0(s11)
    sub t0,t0,t1
    sb t0, 0(s11)
    
    la a0,var1
    li a7,4
    ecall
    
    li a7,10
    ecall