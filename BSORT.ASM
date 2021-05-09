;106118042 - joel scaria - bubble sort
data segment
  arr db 20h,16h,42h,39h,08h
  len db len-arr
  desc_bit db 00h
data ends

code segment
assume cs:code, ds:data
start:
  mov ax, data
  mov ds, ax

  mov ch, len
  dec ch
OuterLoop:
  mov cl, ch
  lea si, arr


InnerLoop:
  mov al, [si]
  mov bl, [si + 1]
  cmp desc_bit,00h
  je Ascend
  cmp al,bl
  jnc Continue
  jmp swap

Ascend:
  cmp al,bl
  jc Continue
  jmp swap

Continue:
  inc si
  dec cl
  jnz InnerLoop
  dec ch
  jnz OuterLoop
  jmp stop
  
swap:
  mov dl, [si + 1] 
  xchg [si], dl
  mov [si + 1], dl
  jmp Continue

stop:
  lea si,arr
  ;loading the values in array to view them in data registers
  mov ah,[si]
  mov bh,[si+1]
  mov ch,[si+2]
  mov dh,[si+3]
  mov al,[si+4] 
  int 3

code ends
end start
