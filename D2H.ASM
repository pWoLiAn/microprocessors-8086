; 106118042 JOEL SCARIA decimal to hexadecimal
data segment
	a db 19h
	; 19 -> 25
	; 0001 1001
	; 13
	b db ?
data ends
code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov bl,a
	and bl,0fh
	mov al,a
	mov dx,00f0h
	and al,dl
	mov cl,04h
	ror al,cl
	mov dl,0ah
	mul dl
	add al,bl
	mov b,al
	int 3
code ends
end start