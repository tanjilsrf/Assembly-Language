DATA SEGMENT
    STR1 DB "My Code$"
    STR2 DB 7 DUP ('$')
    MSG1 DB 10,13,'STORED STRING IN MEMORY IS : $'
    MSG2 DB 10,13,'REVERSE STRING IS : $'
DATA ENDS
DISPLAY MACRO MSG
    MOV AH,9
    LEA DX,MSG
    INT 21H
ENDM   
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX                
               
        DISPLAY MSG1
                    
        DISPLAY STR1
                       
        LEA SI,STR2
        LEA DI,STR1
        ADD DI,5
               
        MOV CX,6
REVERSE:
        MOV AL,[DI]
        MOV [SI],AL
        INC SI
        DEC DI
        LOOP REVERSE
       
        DISPLAY MSG2
                   
        DISPLAY STR2
                     
        MOV AH,4CH
        INT 21H
CODE ENDS
END START