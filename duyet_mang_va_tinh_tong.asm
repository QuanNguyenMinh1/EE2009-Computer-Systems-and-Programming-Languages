	.ORIG X3010
	LD R6, ADRR
	LD R4, SUM
	AND R1, R1, #0; TEMP
	ADD R5, R1, #10; so lan lap
	ADD R5, R5, #6;	X3110 - X3100 + 1 = 17DEC => 17 o nho
	; Ban dau tro vao 1 o nho roi -> chi can tang con tro them 16 lan la xong yeu cau bai toan
	; Nhung luu la luu 17 o nho
	ADD R5, R5, #1;
	AND R3, R3, #0; SUM

	AND R2, R2, #0	

LOOP:	
	ADD R2, R2, #1;	R2 <- R2 + 1
	STR R2, R6, #0

	LDR R0, R6, #0;	R0 <- M[R6]
	ADD R3, R3, R0
	ADD R6, R6, #1;	R6 <- R6 + 1

	ADD R5, R5, #-1; COUNTER <- COUNTER - 1
	Brp LOOP

	STR R3, R4, #0
HALT
ADRR	.FILL X3100
SUM	.FILL X3115
.END