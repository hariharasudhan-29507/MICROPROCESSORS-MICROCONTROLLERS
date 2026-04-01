		OUTPUT 2500AD
.ORG 2000H
DATA SEGMENT
H DB 76H        
A DB 77H      
I DB 70H
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE, DS:DATA

        MOV AX, DATA
        MOV DS, AX 
        MOV DX, FFE6H
        MOV AL, 80H          
        OUT DX, AL
REPEAT:       
        MOV DX, FFE0H      
        MOV AL, 76H         
        OUT DX, AL
        MOV DX, FFE2H       
        MOV AL, 77H        
        OUT DX, AL
        CALL DELAY
        MOV DX, FFE0H     
        MOV AL, 06H         
        OUT DX, AL
        MOV DX, FFE2H      
        MOV AL, 77H         
        OUT DX, AL
        CALL DELAY    
        MOV DX, FFE0H      
        MOV AL, 06H         
        OUT DX, AL
        MOV DX, FFE2H
        MOV AL, 76H          
        OUT DX, AL
        CALL DELAY    
        MOV DX, FFE0H
        MOV AL, 77H          
        OUT DX, AL
        MOV DX, FFE2H       
        MOV AL, 76H          
        OUT DX, AL
        CALL DELAY
        JMP REPEAT            

DELAY:
        MOV CX, FFFFH      
L1:     MOV BX, FFFFH      
L2:     DEC BX
        JNZ L2
        LOOP L1
        RET
CODE ENDS
END