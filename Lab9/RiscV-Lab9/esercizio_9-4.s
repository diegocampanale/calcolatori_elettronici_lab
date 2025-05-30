#   RiscV_9-4
# 
#   Si scriva una procedura CalcolaDistanzaH in linguaggio assembly MIPS32 che calcoli 
#   la distanza di Hamming binaria tra gli elementi di indice corrispondente di due vettori di word 
#   di lunghezza DIM (dichiarato come costante).
#
# =======================================================================================

    .equ 'DIM',5

	.data
vet1:       .word     56, 12, 98, 129, 58
vet2:       .word     1, 0, 245, 129, 12
risultato:  .zero    20

	.text
  
main:
	
        la     a0,vet1
        la     a1,vet2
        la     a2,risultato
        li     a3,'DIM'
      
        jal   calcola_distanzaH


        li a7,10
        ecall
  
  
calcola_distanzaH:   
      #  a0=vet1   a1=vet2     a2=risultato   a3=DIM
      
      # Ciclo
      li   s0,0        # t0 contatore Cicli                
ciclo:
      beq  s0,a3,fine_ciclo
  
calcoloH:     
          lw    s7,0(a0)
          lw    s8,0(a1)
          xor   s2,s7,s8      
          andi  s3,s3,0         # azzeramento risultato
          andi  s4,s4,0         # azzeramento indice
          li    s5,1            # mask per lettura bit a 1
cicloH:   and   s6,s2,s5
          beqz  s6,nextH
          addi  s3,s3,1
nextH:    li    s11,1
          sll   s5,s5,s11
          addi  s4,s4,1
          li    s11,16
          bne   s4,s11, cicloH          

          # In  s3 il risultato         
          sw     s3,0(a2)
      
          addi   s0,s0,1
       
          addi   a0,a0,4
          addi   a1,a1,4
          addi   a2,a2,4
   
      j ciclo
      
fine_ciclo:    
      jr  ra
	

	

	
	
