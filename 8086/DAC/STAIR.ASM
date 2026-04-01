 OUTPUT 2500AD
.ORG 2000H
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
L1:
        MOV AL,80H
        MOV DX,FFE0H
        OUT DX,AL
        CALL DELAY
        MOV AL,C0H
        MOV DX,FFE0H
        OUT DX,AL
        CALL DELAY
        MOV AL,FFH
        MOV DX,FFE0H
        OUT DX,AL
        CALL DELAY
        MOV AL,80H
        MOV DX,FFE0H
        OUT DX,AL
        CALL DELAY
        JMP L1
DELAY:
        MOV BX,AAAH
L2:
        DEC BX
        JNZ L2
        RET
CODE ENDS
END