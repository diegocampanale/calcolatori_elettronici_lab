#   RiscV_9-3
#     
#   Sia data una matrice di byte, contenente numeri senza segno.
#   Si scriva una procedura contaVicini in grado di calcolare 
#   (e restituire come valore di ritorno) la somma dei valori contenuti nelle celle adiacenti 
#   ad una determinata cella.
#
# =======================================================================================
        
        
.equ RIGHE, 4
.equ COLONNE, 5
.data
matrice: .byte 0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9, 24, 8, 25, 43, 62

.text
main:	la a0, matrice
	li a1, 12
	li a2, RIGHE
	li a3, COLONNE
	jal contaVicini
	li a7, 1		# stampa il valore di ritorno
	ecall
	li a7, 10
	ecall

contaVicini:
	addi sp, sp, -4
	sw s0, 0(sp)
	li s0, 0		# somma delle celle vicine

	divu t0, a1, a3		# t0: indice riga
	remu t1, a1, a3		# t1: indice colonna
	li t6, -1
		
# indice riga sopra	
	addi t2, t0, -1
	bne t2, t6, indiceRigaSotto
	mv t2, zero
	
indiceRigaSotto:
	addi t3, t0, 1
	bne t3, a2, indiceColonnaASinistra
	addi t3, a2, -1
	
indiceColonnaASinistra:
	addi t4, t1, -1
	bne t4, t6, indiceColonnaADestra
	mv t4, zero
	
indiceColonnaADestra:
	addi t5, t1, 1
	bne t5, a3, indiciCelle
	addi t5, a3, -1
	
indiciCelle:
	mul t1, t2, a3	
	add t0, t1, t4		# indice dell'elemento a sinistra nella riga sopra
	add t1, t1, t5		# indice dell'elemento a destra nella riga sopra
	
	mul t2, t3, a3	
	add t2, t2, t4		# indice dell'elemento a sinistra nella riga sotto
	
	add t0, t0, a0		# somma l'indirizzo iniziale della matrice
	add t1, t1, a0
	add t2, t2, a0
	add a1, a1, a0

cicloEsterno:	
	mv t3, t0
cicloInterno:
	beq t3, a1, saltaElemento
	lb t4, 0(t3)
	add s0, s0, t4
saltaElemento:
	addi t3, t3, 1
	bleu t3, t1, cicloInterno
	add t0, t0, a3
	add t1, t1, a3
	bleu t0, t2, cicloEsterno

	mv a0, s0
	lw s0, 0(sp)
	addi sp, sp, 4
	jr ra