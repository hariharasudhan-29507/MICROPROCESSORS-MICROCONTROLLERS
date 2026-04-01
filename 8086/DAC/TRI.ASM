		 OUTPUT 2500AD
.ORG 3000H
DATA SEGMENT
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV AL,80H
        MOV DX,FFE6H
        OUT DX,AL
        MOV AL,00H
L1:
        MOV DX,FFE0H
        OUT DX,AL
        INC AL
        CMP AL,FFH
        JNZ L1
L2:
        MOV DX,FFE0H
        OUT DX,AL
        DEC AL
        CMP AL,00H
        JNZ L2
        JMP L1
CODE ENDS
END