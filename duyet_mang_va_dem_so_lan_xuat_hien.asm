.ORIG x3010

; --- NH?P K VÀ CHUY?N SANG S? ---
IN
LD R1, ASCII_OFFSET
NOT R1, R1
ADD R1, R1, #1
ADD R0, R0, R1    ; R0 = giá tr? s? k
ST R0, K_VALUE    ; Luu k vào nhãn n?i b? cho nhanh

; --- PH?N 1: KH?I T?O M?NG (x3100 - x3110: 17 ph?n t?) ---
LD R1, ADRR       ; R1 = x3100
AND R2, R2, #0
ADD R2, R2, #15
ADD R2, R2, #2    ; R2 = 17 (b? d?m)

AND R0, R0, #0
ADD R0, R0, #-5   ; Th? kh?i t?o t? -5 d? có c? s? âm l?n duong

INIT_LOOP:
STR R0, R1, #0
ADD R0, R0, #1
ADD R1, R1, #1
ADD R2, R2, #-1
BRp INIT_LOOP

; --- PH?N 2: X? LÝ M?NG ---
LD R1, ADRR       ; Reset con tr? v? x3100
LD R2, COUNT_17   ; B? d?m 17
AND R3, R3, #0    ; R3 = SUM
AND R4, R4, #0    ; R4 = POS
AND R5, R5, #0    ; R5 = NEG
AND R6, R6, #0    ; R6 = COUNT_K

PROCESS_LOOP:
LDR R0, R1, #0    ; L?y giá tr? t? m?ng

; 1. Tính t?ng
ADD R3, R3, R0

; 2. Ki?m tra s? dó có b?ng K không?
LD R7, K_VALUE
NOT R7, R7
ADD R7, R7, #1
ADD R7, R0, R7    ; R7 = R0 - K
BRnp SKIP_K
ADD R6, R6, #1    ; N?u b?ng K thì tang R6
SKIP_K:

; 3. Ki?m tra Âm/Duong
ADD R0, R0, #0    ; C?p nh?t c? cho R0
BRz NEXT_STEP     ; S? 0 không âm không duong
BRn IS_NEG
ADD R4, R4, #1    ; Là s? duong
BRnzp NEXT_STEP
IS_NEG:
ADD R5, R5, #1    ; Là s? âm

NEXT_STEP:
ADD R1, R1, #1
ADD R2, R2, #-1
BRp PROCESS_LOOP

; --- PH?N 3: LUU K?T QU? ---
STI R3, ADDR_SUM
STI R6, ADDR_k_count

; --- PH?N 4: XU?T S? DUONG (R4) ---
; Gi? s? R4 < 20 d? don gi?n hóa logic 2 ch? s?
ADD R0, R4, #-10
BRn ONLY_1_DIGIT
; Xu?t hàng ch?c (s? 1)
LD R0, ASCII_OFFSET
ADD R0, R0, #1
OUT
; Xu?t hàng don v?
ADD R4, R4, #-10
ONLY_1_DIGIT:
LD R0, ASCII_OFFSET
ADD R0, R4, R0
OUT

HALT

; --- D? LI?U ---
ADRR          .FILL x3100
COUNT_17      .FILL #17
ADDR_SUM      .FILL x3115
ADDR_k_count  .FILL x3140
K_VALUE       .BLKW 1
ASCII_OFFSET  .FILL x30
.END