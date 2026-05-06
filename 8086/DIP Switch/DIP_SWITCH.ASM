; ============================================================
; Title   : Interface 8-bit DIP switch with 8086 (Minimum Mode)
; Hardware: DIP switch at I/O port address F0H
;           Address decoder uses 74138 (3-to-8 decoder) + logic gates
;           to assert chip-select when A7-A1 = 1111000B and IOR* is low.
;           DIP switch output lines connect to 8086 data bus D7-D0.
; Operation: IN instruction reads the 8-bit switch state from port F0H.
; ============================================================

             OUTPUT 2500AD
.ORG 2000H

DATA SEGMENT
SWITCH_DATA  DB 00H      ; Memory variable to store DIP switch reading
DATA ENDS

CODE SEGMENT
             ASSUME CS:CODE, DS:DATA
START:
             MOV AX, DATA
             MOV DS, AX
             IN AL, 0F0H            ; Read 8-bit DIP switch at I/O port F0H
             MOV SWITCH_DATA, AL    ; Save the switch state to memory
HERE:
             JMP HERE               ; Halt (infinite loop)
CODE ENDS
END
