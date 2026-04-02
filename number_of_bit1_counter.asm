.ORIG x3000

IN                  ; Gi? s? nh?p '6', R0 = x0036
LD R3, ASCII_OFFSET 

; --- Dua so vua nhap vao ve dang co the tinh toan duoc ---
ADD R4, R3, #0
NOT R4, R4
ADD R4, R4, #1

ADD R0, R0, R4
; ------------------------------------------------

; --- Buoc quan tr?ng: Ðua ma ASCII lên 8 bit cao ---
AND R2, R2, #0
ADD R2, R2, #8
PRE_SHIFT:          ; D?ch trái 8 l?n
    ADD R0, R0, R0
    ADD R2, R2, #-1
    BRp PRE_SHIFT
; ------------------------------------------------

AND R1, R1, #0      ; R1 là bi?n ð?m
ADD R2, R2, #8      ; L?p l?i 8 l?n ð? ð?m 8 bit ðó

LOOP:
    ADD R0, R0, #0  ; Ki?m tra bit 15
    BRzp SKIP
    ADD R1, R1, #1  ; N?u là bit 1 th? tãng R1
SKIP:
    ADD R0, R0, R0  ; D?ch trái ti?p
    ADD R2, R2, #-1
    BRp LOOP

    ADD R0, R1, R3  ; C?ng offset x30 ð? in
    OUT
    HALT

ASCII_OFFSET .FILL x30
.END