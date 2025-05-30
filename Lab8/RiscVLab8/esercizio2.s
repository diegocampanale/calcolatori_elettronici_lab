	.data
matrix: .word  1, 0, 0, 0, 0
        .word  0, 2, 0, 1, 0
        .word  0, 0, 3, 0, 0
        .word  0, 1, 0, 4, 0
        .word  0, 0, 0, 0, 5
        
	.text	 
main: 	la a0, matrix
	li a1, 5
	jal diagonale_o_simmetrica
		
	# visualizza il risultato
	li a7, 1
	ecall
		
	li a7, 10
	ecall
		
.globl diagonale_o_simmetrica
diagonale_o_simmetrica:
	# salvo s0 nello stack per preservarlo
	addi sp, sp, -4
	sw s0, 0(sp)
	li t0, 2		# t0 conterrà il risultato (ipotesi iniziale: diagonale)
	slli t1, a1, 2		# t1: offset per passare alla riga successiva della matrice
	addi t2, t1, 4		# t2: offset tra gli elementi lungo la diagonale
	addi a1, a1, -1		# a1: contatore ciclo esterno
ciclo1:	mv t3, a1		# t2: contatore ciclo interno
	mv t4, a0		# t3: puntatore a elementi su riga
	mv t5, a0		# t4: puntatore a elementi su colonna
ciclo2: addi t4, t4, 4
	add t5, t5, t1
	lw t6, 0(t4)
	beq t6, zero, next       
        li t0, 1		# non è diagonale
next:	lw s0, 0(t5)
	bne t6, s0, no_simm	# se non è simmetrica (né diagonale), esco dal ciclo
	addi t3, t3, -1
	bne t3, zero, ciclo2
		 
	add a0, a0, t2
	addi a1, a1, -1
	bne a1, zero, ciclo1
	j fine

no_simm: li t0, 0
fine:	mv a0, t0
	lw s0, 0(sp)		# ripristino s0
	addi sp, sp, 4
	jr ra
		