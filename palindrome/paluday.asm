DATA SEGMENT
MSG DB 0DH,0AH, "ENTER THE STRING:$"
MSG1 DB 0DH,0AH, "STRING IS A PALINDROME:$"
MSG2 DB 0DH,0AH, "STRING IS NOT A PALINDROME:$"
MSG3 DB 0DH,0AH, "$"
INST DB 20 DUP(0)
DATA ENDS

CODE SEGMENT 
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX

MOV DX,OFFSET MSG
MOV AH,09H
INT 21H
MOV BX,00H
UP:
MOV AH,01H
INT 21H
CMP AL,0DH
JE DOWN
MOV[INST+BX],AL
INC BX
LOOP UP
DOWN:
MOV DI,00
DEC BX
JNZ CHECK
CHECK:
MOV AL,[INST+BX]
CMP AL,[INST+DI]
JNE FAIL
INC DI
DEC BX
JNZ CHECK
JMP FINISH

MOV DX, OFFSET MSG3
MOV AH,09H
INT 21H

FINISH:
MOV DX,OFFSET MSG1
MOV AH,09H
INT 21H
JMP TERM

FAIL:
MOV DX,OFFSET MSG2
MOV AH,09H
INT 21H

TERM:
MOV AH,4CH
INT 21H

CODE ENDS
END START
