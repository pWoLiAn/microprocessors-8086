; Program for calculating n'th fibonacci number
; 106118042 - Joel Scaria

data segment
    n dw 8h
data ends

code segment
assume cs:code, ds:data
start:
  mov ax, data
  mov ds, ax

  mov bx, 0
  mov cx, 1

  ; Initialize iterator
  mov dx, n
  mov ax, 0
  cmp dx, 1
  jz end_i
  mov ax, 1
  cmp dx, 2
  jz end_i
  sub dx, 2

Loop_i:
  ; This loop runs untill dx is 0
  mov ax, 0
  add ax, bx
  add ax, cx

  ; Update values
  mov bx, cx 
  mov cx, ax 

  dec dx
  cmp dx, 0
  jnz Loop_i

end_i:
  int 3

code ends
end start
