; 106118042 JOEL SCARIA binary to grey
data segment
	opr db 2Ch
	; 0010 1100
	; 0001 0110
	; 0011 1010
	; 3A
	res db ?
data ends

code segment
assume cs:code,ds:data

start:

	mov ax,data
	mov ds,ax
	mov al,opr
	mov bl,al
	shr al,01h
	xor al,bl
	mov res,al
	int 3
code ends
end start
