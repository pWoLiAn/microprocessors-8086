
data segment

	arr1 db 0,1,2,3,4,5,6,7,8,9
	str_n db 'odd numbers: $'
        str_r db 'even numbers: $'


data ends

code segment
assume cs:code, ds:data

start:

	mov ax,data
	mov ds,ax

	lea bx,arr1
	mov bp, 0Ah
	mov ch,0h
	mov cl,0h
	mov dh,02
	mov si, 1000h
	mov di, 2000h

L1:
	mov ah, 0h
	mov al, [bx]
	mov dl, al
	div dh
	cmp ah, 0h
	je EVEN1
	mov [si], dl
	inc si
	inc bx
	inc ch
	dec bp
	cmp bp,0h
	jne L1
	jmp STOP


EVEN1:

	mov [di],dl
	inc di
	inc bx
	inc cl
	dec bp
	cmp bp,0h
	jne L1
	jmp STOP

PrintNextLine proc
    push ax
    push dx
    
    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h

    pop dx
    pop ax
    ret
PrintNextLine endp

STOP:
	
	call PrintNextLine
	mov ah, 09h
	lea dx, str_n
	int 21h
	call PrintNextLine
	mov si, 1000h
printodd:
	xor dl,dl
	mov dl, [si]
	add dl, 30h
	mov ah, 02h
	int 21h
	inc si
	dec ch
	call PrintNextLine
	cmp ch ,0h
	jne printodd

	call PrintNextLine
	mov ah, 09h
	lea dx, str_r
	int 21h
	call PrintNextLine
	mov si, 2000h
printeven:
	xor dl,dl
	mov dl, [si]
	add dl, 30h
	mov ah, 02h
	int 21h
	inc si
	dec cl
	call PrintNextLine
	cmp cl ,0h
	jne printeven

	mov ah, 1
	int 21h
	int 3

code ends
end start


	