                OUTPUT 2500AD
.ORG 2000H
DATA SEGMENT
FWD DB 01H,02H,04H,08H
REV DB 08H,04H,02H,01H
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV AL,80H
        MOV DX,FFE6H        
        OUT DX,AL
        MOV SI, OFFSET FWD
        MOV CX,0019H        
L1:
        MOV AL,[SI]
        MOV DX,FFE0H        
        OUT DX,AL
        CALL DELAY
        INC SI
        CMP SI, OFFSET FWD + 4
        JNE SKIP1
        MOV SI, OFFSET FWD
SKIP1:
        DEC CX
        JNZ L1
        MOV SI, OFFSET REV
        MOV CX,0019H        
L2:
        MOV AL,[SI]
        MOV DX,FFE0H
        OUT DX,AL
        CALL DELAY
        INC SI
        CMP SI, OFFSET REV + 4
        JNE SKIP2
        MOV SI, OFFSET REV
SKIP2:
        DEC CX
        JNZ L2
        HLT
DELAY:
        MOV BX,AAAAH
L3:
        DEC BX
        JNZ L3
        RET
CODE ENDS
END

