@  +8  (FP) = indirizzo di M
@  +10 (FP) = SIZ
@  +14 (FP) = indirizzo di V
COUP:   STMFD   SP!, {FP,LR} @ nuovo frame
        MOV   FP, SP
        SUB     SP, SP, #24  	@ spazio per salvare i registri (dati locali)
        STMDB   FP, {R1-R6}  	@ salva i registri usati
        LDR     R1, [FP,#14] 	@ R1 punta al primo carattere della stringa
        LDR   R3, [FP,#10] 	@ numero di caratteri (SIZ)
        ADD     R2, R1, R3 	@ R2 punta ...
        SUB     R2, R2, #1	@ ... all’ultimo carattere della stringa
        MOV     R3, R3, LSR #1 	@ numero di iterazioni del ciclo (k=SIZ/2)
        MOV R4, #0		@ valore iniziale del contatore di coppie

LOOP:   LDRB    R5, [R1,#2]	@ legge V[i] e incrementa il puntatore
        LDRB    R6, [R2,#-2]	@ legge V[SIZ-1-i] e decrementa il puntatore
        SUB     R6, R6, #0x20	@ toUpperCase(V[SIZ-1-i])
        CMP     R5, R6		@ confronta V[i] con toUpperCase(V[SIZ-1-i])
        ADDEQ   R4, R4, #1  	@ conta se uguali (esecuzione condizionata)
        SUBS 	R3,R3, #1	@ aggiorna contatore iterazioni
        BNE    LOOP		@ cicla se ci sono altre coppie da esaminare
        LDR     R2, [FP,#8] 	@ carica indirizzo risultato
        STR	R4, [R2]	@ scrive il risultato in memoria
        LDMFD  FP, {R1-R6}  	@ ripristina registri
        MOV     SP, FP 		@ rimuove il frame 
        LDMFD   SP!, {FP,PC}  	@ e ritorna al programma chiamante
