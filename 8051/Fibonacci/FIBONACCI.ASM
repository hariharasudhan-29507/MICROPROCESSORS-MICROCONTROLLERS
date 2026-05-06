; ============================================================
; Title   : Generate Fibonacci series - 8051 ALP
; Operation: Generates 10 terms of the Fibonacci series and
;            stores them in external RAM starting at 9000H.
;            Series: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 ...
; Registers: R2 = remaining term counter
;            R3 = F(n-2), R4 = F(n-1)
; ============================================================

        .ORG 8000H

START:
        ; Store first term F(0) = 0
        MOV  DPTR, #9000H
        MOV  A, #00H
        MOVX @DPTR, A           ; [9000H] = 0

        ; Store second term F(1) = 1
        INC  DPTR
        MOV  A, #01H
        MOVX @DPTR, A           ; [9001H] = 1

        ; Initialize for loop: generate 8 more terms (total = 10)
        MOV  R3, #00H           ; R3 = F(n-2) = 0
        MOV  R4, #01H           ; R4 = F(n-1) = 1
        MOV  R2, #08H           ; Loop counter = 8

LOOP:
        MOV  A, R3
        ADD  A, R4              ; A = F(n) = F(n-2) + F(n-1)
        INC  DPTR
        MOVX @DPTR, A           ; Store F(n) in external RAM
        MOV  R3, R4             ; F(n-2) <- F(n-1)
        MOV  R4, A              ; F(n-1) <- F(n)
        DJNZ R2, LOOP           ; Repeat for next term

DONE:
        SJMP DONE               ; Halt
        END
