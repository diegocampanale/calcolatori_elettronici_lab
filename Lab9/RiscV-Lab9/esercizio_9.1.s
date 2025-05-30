#   RiscV_9-1
#
#   Sono date due matrici quadrate contenenti numeri con segno, memorizzate per righe, di DIMxDIM 
#   elementi. 
#   Si scriva una procedura Variazione in linguaggio MIPS in grado di calcolare la variazione 
#   percentuale (troncata all’intero) tra gli elementi di indice corrispondente della riga I 
#   della prima matrice ([I, 0], [I, 1], [I, 2]...) e della colonna I della seconda ([0, I ], [1, I ], [2, I ]...).
#
# =======================================================================================


.equ DIM, 3
.data
mat1:	.word 4, -45, 15565,    6458, 4531, 124,    -548, 2124, 31000
mat2:	.word 6, -5421, -547,   -99, 4531, 1456,    4592, 118, 31999
indice:	.word 2
vet_out: .zero DIM*4

.text
main:	la a0, mat1
	la a1, mat2
	la a2, vet_out
	li a3, DIM
	la t0, indice
	lw a4, 0(t0)
	jal variazione
	li a7, 10
	ecall

variazione:		
	addi sp, sp, -12	
	sw ra, 0(sp)		# salvo ra perché la procedura non è leaf
	sw s0, 4(sp)		
	sw s1, 8(sp)
		 
	slli s0, a3, 2
	mul t1, a4, s0
	add a0, a0, t1		# indirizzo riga i della matrice 1
		
	slli a4, a4, 2
	add a1, a1, a4		# indirizzo colonna i della matrice 2		
	li s1, 0		# contatore

ciclo1:	addi sp, sp, -16
	sw a0, 0(sp)		
	sw a1, 4(sp)		
	sw a2, 8(sp)		# salvo i registri a2 e a3 nello stack
	sw a3, 12(sp)		# perché calcoloVariazione potrebbe modificarli
	lw a0, 0(a0)		# primo argomento: valore1
	lw a1, 0(a1)		# secondo argomento: valore2
	jal calcoloVariazione
	lw a1, 4(sp)
	lw a2, 8(sp)
	lw a3, 12(sp)
	sw a0, 0(a2)		# il valore di ritorno di calcoloVariazione è salvato nel vettore a2
	lw a0, 0(sp)		# ripristina a0
	addi sp, sp, 16
		
	addi a0, a0, 4
	add a1, a1, s0
	addi a2, a2, 4
	addi s1, s1, 1			                
	bne s1, a3, ciclo1                  
   
	lw ra, 0(sp)
	lw s0, 4(sp)
	lw s1, 8(sp)
	addi sp, sp, 12
	jr ra


calcoloVariazione:  		# lavoro nell'ipotesi di non avere overflow
	sub t0, a1, a0
	li t1, 100
	mul t0, t0, t1
	div a0, t0, a0
	jr ra
