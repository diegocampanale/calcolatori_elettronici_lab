.equ 'A' 65
.equ 'a' 97

.data
    parola: .string "parola\n"

.text
     main:
         la a0,parola
         li a7,4
         ecall
         
         li t0,0
         ciclo:
             la t1,parola
             add t1,t1,t0
             lb a0,0(t1)
             li s11,'A'
             blt a0,s11,exit
             jal toUpper
             sb a0,0(t1)
             addi t0,t0,1
             j ciclo
         exit:
         
         la a0,parola
         li a7,4
         ecall
         
         li a7,10
         ecall
             
     
             
        
     toUpper:
         addi a0,a0,'A'
         li s0,'a'
         sub a0,a0,s0
         jr ra
         