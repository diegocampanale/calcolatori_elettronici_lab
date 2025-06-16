    .equ  Paesi, 4
    .equ  Prodotti, 5
    .data
MatricePrezzi:
    .word 700, 620, 680, 690
    .word 400, 460, 430, 420
    .word 50, 20, 40, 52
    .word 28, 30, 27, 26
    .word 25000, 21000, 24000, 23000
MatriceDazi:
    .word 25, 25, 25, 25
    .word 20, 75, 40, 45
    .word 65, 10, 20, 65
    .word 40, 65, 20, 25
    .word 50, 75, 62, 50
    .text
main:
    la    a0, MatricePrezzi
    la    a1, MatriceDazi
    li    a2, Paesi
    li    a3, Prodotti
    jal   calcola_prezzi
    li    a7, 10
    ecall

calcola_prezzi:
    li    s0, 0                      # indice righe
    mv    s1, a3                     # limite max righe (prodotti)
    mv    s3, a2                     #limite max colonne (paesi)
    li    s5, 0                      # offset matrice

loop_righe:
    beq   s0, s1, end_righe

    li    s2, 0                      # indice_colonne
loop_colonne:
    beq   s2,s3,end_colonne

    addi  a0, a0, s5
    addi  a1, a1, s5

# salvo nello stack i registri a0,a1,a2,a3,ra
    addi  sp, sp, -20
    sw    a0, 0(sp)
    sw    a1, 4(sp)
    sw    a2, 8(sp)
    sw    a3, 12(sp)
    sw    ra, 16(sp)

# preparo i parametri da passare alla procedura calcolo
# a0 contiene prezzo , a1 contiene percentuale
    lw    a0, 0(a0)
    lw    a1, 0(a1)
    jal   calcolo
# ritorno a0 con risutato da scrivere nella matrice prezzi
    mv    s6, a0                     # salvo risultato in s6 per ripristinare l'indirizzo della matrice in a0

    lw    a0, 0(sp)
    lw    a1, 4(sp)
    lw    a2, 8(sp)
    lw    a3, 12(sp)
    lw    ra, 16(sp)
    addi  sp, sp, 20

    sw    s6, 0(a0)
    addi  s5, s5, 4                  # incremento offset
    addi  s2,s2,1                    # incremento indice colonne
    j     loop_colonne
end_colonne:

    addi  s0, s0, 1
    j     loop_righe
end_righe:
    jr    ra

calcolo:
# riceve in a0 il prezzo e in a1 la percentuale
    mv    t0, a0
    mul   t0, t0, a1
    li    t1, 100
    div   t0, t0, t1
    add   a0, a0, t0
    jr    ra