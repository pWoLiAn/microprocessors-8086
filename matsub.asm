;106118042 - joel scaria - matrix subtraction
data segment

  ; 3x2 matrices mat1 and mat2

  mat1 dw 1h, 2h, 3h, 4h, 5h, 6h

  mat2 dw 1h, 1h, 1h, 1h, 1h, 1h

  a dw 3h
  b dw 2h

data ends

code segment
assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax

    mov ax, a
    mul b

    mov cx, ax
    lea si, mat1
    lea di, mat2

Loop_i:
    mov ax, [si]
    mov bx, [di]
    sub ax, bx
    
    mov [si], ax
    add si, 2h
    add di, 2h
    sub cx, 0001h
    
    cmp cx, 0
    jnz Loop_i

    lea si,mat1
    mov ah,[si]
    mov al,[si+2]
    mov bh,[si+4]
    mov bl,[si+6]
    mov ch,[si+8]
    mov cl,[si+10]

    int 3

    int 21h
code ends
end start 