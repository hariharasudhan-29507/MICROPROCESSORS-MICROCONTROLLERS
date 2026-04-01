        OUTPUT 2500AD
.ORG 2000H
DATA SEGMENT
STR DB "HELLO"
CH DB 'E'
COUNT DB 05H
RES DB 00H
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        MOV AX,DATA
        MOV DS,AX
        LEA DI,STR
        MOV AL,CH
L2:     SCASB
        JNZ L1
        MOV RES,01H
        JMP L3
L1:     INC DI
        DEC CL
        JNZ L2
L3:     HLT
CODE ENDS
END

