.ORG 8000H
START:
	; Compute X^2 - Y^2
	; X at XRAM 9000H, Y at XRAM 9001H
	; Result (16-bit) stored at 9002H (low) and 9003H (high)
	;
	MOV	DPTR,#9000H

	; --- X^2 ---
	MOVX:A,@DPTR			; A = X
	MOV	B,A			; B = X
	MUL	AB			; AB = X*X (A=low, B=high)
	MOV	R1,A			; R1 = low(X^2)
	MOV	R2,B			; R2 = high(X^2)

	; --- Y^2 ---
	INC	DPTR			; DPTR = 9001H
	MOVX:A,@DPTR			; A = Y
	MOV	B,A			; B = Y
	MUL	AB			; AB = Y*Y
	MOV	R3,A			; R3 = low(Y^2)
	MOV	R4,B			; R4 = high(Y^2)

	; --- (X^2 - Y^2) 16-bit subtraction ---
	CLR	C			; clear borrow
	MOV	A,R1
	SUBB	A,R3
	MOV	R1,A			; low result
	MOV	A,R2
	SUBB	A,R4
	MOV	R2,A			; high result

	; --- store result ---
	INC	DPTR			; DPTR = 9002H
	MOV	A,R1
	MOVX	@DPTR,A			; store low byte
	INC	DPTR			; DPTR = 9003H
	MOV	A,R2
	MOVX	@DPTR,A			; store high byte

HERE:	SJMP	HERE			; stop/halt

END