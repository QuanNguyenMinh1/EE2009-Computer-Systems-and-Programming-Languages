.ORIG x3000

; --- Bu?c 1: Kh?i t?o vùng nh? d?m (x4000 d?n x40FF) ---
    	LD R0, ADDR_COUNT   ; R0 = x4000
    	AND R1, R1, #0      ; R1 = 0
    	LD R2, CLEAR_COUNT  ; R2 = 256 (s? lu?ng ký t? ASCII)
CLEAR_LOOP:
    	STR R1, R0, #0
    	ADD R0, R0, #1
    	ADD R2, R2, #-1
    	BRp CLEAR_LOOP

; --- Bu?c 2: Duy?t chu?i và tang t?n su?t ---
    	LEA R1, STRING      ; R1 tr? vào d?u chu?i
READ_CHAR:
	LDR R0, R1, #0	; R0 <- M[M[R1]] 
	BRz TIM_MAX	; R0 = '0' hay NULL

	LD R2, ADDR_COUNT
	ADD R2, R2, R0	; Ánh xa -> Table luu tan suat (co vi tri nhu bang ASCII)
	; R2 là con tro Table -> muon R3 de: M[M[R2]]++
	LDR R3, R2, #0	; R3 <- M[M[R2]] = M[x4000 + ASCII_CODE] = tan suat xhien tuong ung
	ADD R3, R3, #1	; BIEN TAN SUAT XUAT HIEN++
	STR R3, R2, #0	; ++TAN SUAT XONG TRA LAI VI TRI CU TRONG TABLE

	ADD R1, R1, #1	; TANG CON TRO tai STRING
	BRnzp READ_CHAR
TIM_MAX:
	LD R0, ADDR_COUNT	; R0 lam con tro Table
	LD R1, CLEAR_COUNT	; 256 : Duôi cua Table
	AND R2, R2, #0		; R2: 
	AND R4, R4, #0		; R4 = Ky tu xuat hien MAX (o dang ASCII)
	
LOOP_MAX:
	LDR R3, R0, #0		; R3 <- M[R0]. PARAM2 la LABLE truc tiep thi moi LDI
	;NOT R2, R2	; CHUA CO MAX MOI->SKIP:TANG CON TRO TABLE->LOOP_MAX
	;ADD R2, R2, #1
	;ADD R5, R2, #0	; R5 <- (-R2)
	NOT R5, R2
	ADD R5, R5, #1
	ADD R5, R3, R5	; R5 <- R3 + (-R2)
	BRnz SKIP	; bién t.suát cua ktu h.tai bé hon/bàng R2->ko có max mói=skip

	; CAP NHAT MAX COUNT - Vo duoc day thi chac chan co MAX moi
	ADD R2, R3, #0
	;Ky tu MAX moi = dia chi cua ky tu do trong Table (R0) - Dàu cua Table
	LD R6, ADDR_COUNT; CHON R6 làm dàu cua Table

	NOT R6, R6
	ADD R6, R6, #1	; R6 = -x4000

	ADD R4, R0, R6	; R4 <- dia chi hien tai trong Table - x4000
	; R4 chac chan la MAX tai vòng lap LOOP_MAX làn cuoi cùng
SKIP:
	ADD R0, R0, #1	; TRO TABLE++
	ADD R1, R1, #-1	; DUÔI TABLE--
	BRp LOOP_MAX
; --- XUAT ---
	; SAU R1: DUÔI_TABLE = 0 -> R4 = MAX
	ADD R0, R4, #0
    	OUT                 ; In ra màn hình console
    	HALT

; --- Data ---
ADDR_COUNT  .FILL x4000
CLEAR_COUNT .FILL #256
STRING      .STRINGZ "ABCDAZY" ; Chu?i m?u t? ?nh
.END