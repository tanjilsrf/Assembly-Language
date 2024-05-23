.model small
.stack 100h
.data
 
    ask db 'ENTER A UPPERCAE LATTER: $'
    val db ?
    str db 0ah,0dh,'YOUR ENTERED LOWERCASE LATER IS: '
    ans db ?
    finish db '$'
 
.code

main proc
 
 
    mov ax,@data
    mov ds,ax
 
    mov ah,9
    lea dx,ask
    int 21h
 
    mov ah,1
    int 21h
    mov val,al
 
    add al,20h
    mov ans,al
 
    mov ah,9
    lea dx,str
    int 21h
 
    mov ah,4ch
    int 21h

    main endp
end main