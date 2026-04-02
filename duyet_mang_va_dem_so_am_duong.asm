.ORIG x3010

        ; --- PH?N 1: KH?I T?O MÀNG (Ghi t? 1 d?n x0011 vào x3100-x3110) ---
        LD R1, ADRR        ; R1 = x3100 (con tr? d?a ch?)
        AND R2, R2, #0
	ADD R2, R2, #15     ; R2 = 17 (b? d?m vòng l?p kh?i t?o)
	ADD R2, R2, #2

        AND R0, R0, #0
        ADD R0, R0, #-2     ; R0 = 1 (giá tr? b?t d?u ghi)

INIT_LOOP:
	; --- FILL MANG ---
        STR R0, R1, #0     ; Luu R0 vào d?a ch? R1 dang tr?
        ADD R0, R0, #1     ; Tang giá tr? (1, 2, 3...)
        ADD R1, R1, #1     ; Nh?y sang ô nh? ti?p theo
        ADD R2, R2, #-1    ; Gi?m b? d?m
        BRp INIT_LOOP      ; L?p l?i cho d?n khi d? 17 ô

        ; --- PH?N 2: Ð?M S? ÂM, S? DUONG VÀ TÍNH T?NG ---
        LD R1, ADRR        ; RESET R1 v? x3100 d? b?t d?u d?c m?ng
        AND R2, R2, #0
        ADD R2, R2, #15
        ADD R2, R2, #2     ; R2 = 17 (b? d?m vòng l?p x? lý)

        AND R3, R3, #0     ; R3 = SUM (T?ng)
        AND R4, R4, #0     ; R4 = Count POS (Bi?n d?m s? duong)
        AND R5, R5, #0     ; R5 = Count NEG (Bi?n d?m s? âm)

PROCESS_LOOP:
        LDR R0, R1, #0     ; Ð?c giá tr? t? ô nh? vào R0
        
        ; 1. C?ng vào t?ng
        ADD R3, R3, R0     ; SUM = SUM + R0
        
        ; 2. Ki?m tra Âm/Duong (D?a trên c? NZP c?a R0)
        ADD R0, R0, #0     ; Lenh de kiem tra bit thu 15 -> cap nhat flag cho R0
        BRn IS_NEGATIVE
        BRp IS_POSITIVE
        BRnzp NEXT_STEP    ; N?u là s? 0 thì không d?m, nh?y qua luôn

IS_NEGATIVE:
        ADD R5, R5, #1     ; Tang b? d?m s? âm
        BRnzp NEXT_STEP    ; Neu da la so am roi thi khong can cap nhat flag lai nua -> Nhay qua luon

IS_POSITIVE:
        ADD R4, R4, #1     ; Tang b? d?m s? duong

NEXT_STEP:
        ADD R1, R1, #1     ; Tang con tr? d?a ch?
        ADD R2, R2, #-1    ; Gi?m b? d?m vòng l?p
        BRp PROCESS_LOOP

        ; --- PH?N 3: LUU K?T QU? ---
        STI R3, ADDR_SUM   ; Luu T?NG vào x3115
	; XET SO CO 2 CHU SO
	ADD R0, R4, #-9
	BRp DIGIT_2
	BRnz XUAT_DONVI
	 
	; Xu ly so 2 chu so
DIGIT_2:
	AND R1, R1, #0
	ADD R1, R1, #1
	LD R0, ASCII_OFFSET
	ADD R0, R1, R0
	OUT
	BRnzp XUAT_DONVI
        ; XUAT MAN HINH
XUAT_DONVI:

	LD R0, ASCII_OFFSET
	ADD R4, R4, #-10
	ADD R0, R4, R0
	OUT

	LD R0, ASCII_OFFSET

	ADD R0, R5, R0
	OUT

        HALT

; --- D? LI?U ---
ADRR        .FILL x3100
ADDR_SUM    .FILL x3115
ASCII_OFFSET	.FILL x30
        .END