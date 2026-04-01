.ORG 8000H
START:
    MOV DPTR,#9000H
    MOVX A,@DPTR      
    MOV R1,A         
    INC DPTR          
    MOVX A,@DPTR      
    MOV B,A           
    MOV A,R1          
    DIV AB        
    INC DPTR          
    MOVX @DPTR,A      
    MOV A,B           
    INC DPTR          
    MOVX @DPTR,A     
END

