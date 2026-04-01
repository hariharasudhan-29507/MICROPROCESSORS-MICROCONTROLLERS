		OUTPUT 2500AD
.ORG 2000H

DATA SEGMENT
STR DB 'HELLO'
VOW DB 'AEIOU'
CNT DB 00H
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA, ES:DATA
        MOV AX, DATA
        MOV DS, AX
        MOV ES, AX  
        LEA SI, STR
        MOV BL, 05H         
L1:     MOV AL, [SI]
        LEA DI, VOW
        MOV CL, 05H         
        MOV CH, 00H
        CLD
L2:     SCASB
        JZ L3
        LOOP L2
        JMP L4
L3:     INC CNT
L4:     INC SI
        DEC BL
        JNZ L1
        HLT
CODE ENDS
END

