
sort:
	pop ax 			;return Address of Subrouitne 
	pop si 			;base address of Array 
	pop cx 			;counter register 
	push ax 		

	mov es:[0x4500],si 	;temp storage of regsiter 
	mov es:[0x4502],cx 	
	mov es:[0x4504],cx 	;upper counter 
	xor ax,ax		;clear register 

repeat_sort:
	mov ah,[si]
	cmp ah,[si+1]
	jc notswap_sort
		xchg ah,[si+1]
		mov [si],ah 
	notswap_sort:
	inc si 
	loopnz repeat_sort
	mov cx,es:[0x4502]
	mov si,es:[0x4500]
	dec es:[0x4504]
	jnc repeat_sort
	ret
