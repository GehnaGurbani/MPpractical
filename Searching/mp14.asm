data segment
	
	msg1 db 10,13,"Searching an element $"
	msg2 db 10,13,"Enter Elments : $"
	msg3 db,10,13,"Enter Number to be searched : $"
	msg4 db,10,13,"Found at : $"
	msg5 db,10,13,"NOT FOUND $"

data ends

code segment
assume cs:code,ds:data
start:

mov ax,data
mov ds,ax


mov dx,offset msg1
call displaymsg
call entprc
call srchprc
mov ah,4ch
int 21h



displaymsg proc
	mov ah,09
	int 21h
	ret
endp

entprc proc
	mov si,1000h
	mov ch,00h
	mov cl,0Ah
	
	enterelements:
	mov dx,offset msg2
	call displaymsg
	
	mov ah,01
	int 21h
	call ipconvert
	rol al,1
	rol al,1
	rol al,1
	rol al,1
	mov bl,al
	mov ah,01
	int 21h
	call ipconvert
	add bl,al
	
	mov [si],bl
	inc si
	loop enterelements
	
	ret
endp


srchprc proc
	
	mov dx,offset msg3
	call displaymsg
	mov ah,01
	int 21h
	call ipconvert
	rol al,1
	rol al,1	
	rol al,1
	rol al,1
	mov bl,al
	mov ah,01
	int 21h
	call ipconvert
	add bl,al
	mov bh,00h
	mov si,1000h
	mov ch,00h
	mov cl,0Ah
	
	checkno:
	inc bh
	cmp bl,[si]
	jz lab3
	inc si
	loop checkno
	jmp error1
	
	lab3:
	mov dx,offset msg4
	call displaymsg
	mov bl,bh
	and bl,0f0h
	ror bl,1
	ror bl,1
	ror bl,1
	ror bl,1
	call opconvert
	mov bl,bh
	and bl,0fh
	call opconvert

	
	error1:
	mov dx,offset msg5
	call displaymsg
	
	ret
	
endp
ipconvert proc
	cmp al,41h
	jc lab1
	sub al,07h
	lab1:
	sub al,30h
	ret
endp

opconvert proc
	cmp bl,0Ah
	jc lab2
	add bl,07h
	lab2:
	add bl,30h
	mov dl,bl
	mov ah,02
	int 21h
	ret
endp

code ends
end start