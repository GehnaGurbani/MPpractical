data segment
	
	msg1 db 10,13,"Des Order $"
	msg2 db 10,13,"Enter Elments : $"
	msg3 db,10,13,"Sorted Array is : $"
	

data ends

code segment
assume cs:code,ds:data
start:

mov ax,data
mov ds,ax


mov dx,offset msg1
call displaymsg
call entprc

call descprc
mov ah,4ch
int 21h



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

descprc proc
	mov bl,0Ah
	dec bl
	mov dh,00h
	
		loop1d:
			mov si,1000h
			mov ch,00h
			mov cl,0Ah
			dec cl
			
			loop2d:
			
				mov ah,[si]
				inc si
				mov al,[si]
				
				cmp ah,al
				jnc lab10
				
				xchg ah,al
				dec si
				mov [si],ah
				inc si
				mov [si],al
				
			lab10:
				loop loop2d
				
		inc dh
		cmp dh,bl
		jc loop1d
	
	
	mov si,1000h
	mov ch,00h
	mov cl,0Ah	
	printd:
	mov dx,offset msg3
	call displaymsg
	
	mov bx,[si]
	and bl,0f0h
	ror bl,1
	ror bl,1
	ror bl,1
	ror bl,1
	call opconvert
	mov bx,[si]
	and bl,0fh
	call opconvert
	inc si
	loop printd
	
	
	ret
endp

	

displaymsg proc
	mov ah,09
	int 21h
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




