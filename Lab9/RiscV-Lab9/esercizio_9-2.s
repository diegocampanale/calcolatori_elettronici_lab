#   RiscV_9-2
#
#   Si scriva una procedura sostituisci in grado di espandere una stringa precedentemente inizializzata 
#   sostituendo tutte le occorrenze del carattere % con un'altra stringa data.  
#
# =======================================================================================
 

.equ '%', 37
.data
str_orig: .string "% nella citta' dolente, % nell'eterno dolore, % tra la perduta gente"
str_sost: .string "per me si va"
str_new:  .zero 200

.text
main:	la a0, str_orig
	la a1, str_sost
	la a2, str_new
	jal sostituisci
	la a0, str_new		# stampa la stringa finale
	li a7, 4        
	ecall
	li a7, 10
	ecall

sostituisci: 
    addi sp, sp, -4
	sw a2, 0(sp)		# salvataggio indirizzo str_new (per calcolo lunghezza)
	li t4, '%'
ciclo1:	lbu t0, 0(a0)
	beq t0, zero, fine	# controllo fine stringa
	bne t0, t4, copia	# controllo carattere da sostituire
	mv t1, a1         	# sostituzione
ciclo2:	lbu t2, 0(t1)
	beq t2, zero, next
	sb t2, 0(a2)
	addi t1, t1, 1
	addi a2, a2, 1
	j ciclo2				 
copia:	sb t0, 0(a2)		# copia caratteri stringa
	addi a2, a2, 1
next:	addi a0, a0, 1
	j ciclo1
fine:	sb zero, 0(a2)
	lw t0, 0(sp)		# calcolo lunghezza della nuova stringa
	addi sp, sp, 4
	sub a0, a2, t0
	jr ra
