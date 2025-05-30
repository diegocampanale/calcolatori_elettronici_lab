.text
# parametri in input: a0 = a, a1 = b, a2 = c
# valore resistuito in a0: numero di soluzioni reali
.globl numSoluzioniReali
numSoluzioniReali:
	mul t0, a1, a1		# t0 = b^2
	mul t1, a0, a2		# t1 = a * c
	slli t1, t1, 2		# t1 = 4 * a * c
	sub t0, t0, t1		# t0 = discriminante
	beq t0, zero, sol_coinc
	slt t1, t0, zero
	bne t1, zero, no_sol
	li a0, 2
	jr ra   
sol_coinc: li a0, 1
	jr ra
no_sol: li a0, 0
	jr ra
