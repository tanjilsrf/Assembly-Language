.DATA
 MSG1 DB 10,13,'Enter number: $'
 MSG2 DB 10,13,'Result: Even$'
 MSG3 DB 10,13,'Result: Odd$'
DATA ENDS
DISPLAY MACRO MSG
 MOV AH,9
 LEA DX,MSG
 INT 21H
ENDM

.CODE
 ASSUME CS:CODE,DS:DATA
 START:
  MOV AX,DATA
  MOV DS,AX
  DISPLAY MSG1
  MOV AH,1
  INT 21H
  MOV AH,0
 CHECK: 
  MOV DL,2
  DIV DL
  CMP AH,0
  JNE ODD
 EVEN:
  DISPLAY MSG2
  JMP DONE
 ODD:
  DISPLAY MSG3
 DONE:
  MOV AH,4CH
  INT 21H
CODE ENDS
END START