.ORIG x3000

    ; --- 1. Nh?p 3 s? và chuy?n v? s? th?c ---
    LD R4, ASCII_OFFSET
    NOT R4, R4
    ADD R4, R4, #1

    GETC
    OUT
    ADD R1, R0, R4    ; R1 = s? 1
    GETC
    OUT
    ADD R2, R0, R4    ; R2 = s? 2
    GETC
    OUT
    ADD R3, R0, R4    ; R3 = s? 3

    ; --- 2. Gi? s? ban d?u MAX = R1, MIN = R1 ---
    ADD R5, R1, #0    ; R5 gi? MAX
    ADD R6, R1, #0    ; R6 gi? MIN

    ; --- 3. So sánh v?i R2 ---
    ; Tìm MAX: R2 - R5
    NOT R0, R5
    ADD R0, R0, #1
    ADD R0, R2, R0
    BRnz NOT_NEW_MAX_2
    ADD R5, R2, #0    ; C?p nh?t MAX m?i
NOT_NEW_MAX_2:
    ; R2 ko phai MAX thi Xet R2 la MIN -> Tìm MIN: R2 - R6
    NOT R0, R6
    ADD R0, R0, #1
    ADD R0, R2, R0
    BRzp NOT_NEW_MIN_2
    ADD R6, R2, #0    ; C?p nh?t MIN m?i
NOT_NEW_MIN_2:
	; R2 vua ko phai MAX, vua ko phai MIN -> XET R3 MAX
    ; --- 4. So sánh v?i R3 ---
    ; Tìm MAX: R3 - R5
    NOT R0, R5
    ADD R0, R0, #1
    ADD R0, R3, R0
    BRnz NOT_NEW_MAX_3
    ADD R5, R3, #0    ; C?p nh?t MAX m?i
NOT_NEW_MAX_3:
	; XET R3 MIN
    ; Tìm MIN: R3 - R6
    NOT R0, R6
    ADD R0, R0, #1
    ADD R0, R3, R0
    BRzp PRINT_ALL
    ADD R6, R3, #0    ; C?p nh?t MIN m?i

    ; --- 5. In k?t qu? ---
PRINT_ALL:
    LD R4, ASCII_OFFSET
    ; In MAX
    ADD R0, R5, R4
    OUT
    ; In MIN
    ADD R0, R6, R4
    OUT

    HALT

ASCII_OFFSET .FILL x30
.END