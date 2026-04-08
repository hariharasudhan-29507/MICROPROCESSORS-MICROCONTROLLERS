.ORG 8000H
START:
	MOV R2,#00H
    MOV DPTR,#9000H
    MOVX A,@DPTR      
    MOV R0,A         
    INC DPTR          
    MOVX A,@DPTR      
    MOV R1,A           
    INC DPTR          
    MOVX A,@DPTR
	CLR C
    ADD A,R0         
    MOV R1,A
	INC DPTR
    MOVX A,@DPTR          
    ADDC A,R1
	JNC L1
	INC R2
L1:	INC DPTR
    MOVX @DPTR,A
	INC DPTR
	MOV A,R3
	MOVX @DPTR,A
	INC DPTR
	MOV A,R2
	MOVX @DPTR,A
END

