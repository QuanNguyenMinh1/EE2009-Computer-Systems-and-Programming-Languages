.ORIG X3050

IN
ADD R1, R0, #0
IN
ADD R2, R0, #0
;----------
LD R3, ASCII_OFFSET
;----------
ADD R4, R4, R3

NOT R4, R4
ADD R4, R4, #1

ADD R1, R1, R4;	so ban dau R1 - offset_ASCII
ADD R2, R2, R4; so ban dau R2 - offset_ASCII
;----------
;ADD R5, R1, #0; R5 la so bi nhan
AND R5, R5, #0
ADD R6, R2, #0; R6 la so nhan - offset_LOOP
NHAN:
ADD R5, R5, R1
ADD R6, R6, #-1
BRp NHAN
;----------
ADD R0, R5, R3
OUT
;----------
HALT
;----------
ASCII_OFFSET .FILL X30
.END