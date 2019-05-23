.686
.model flat
.stack


public _FindNOD
public _MultMatrix



NOD macro expression1, expression2
	mov eax, expression1;
	mov ebx, expression2;
	_begin:
	cmp eax,0
	je _end
	cmp eax,ebx
	cdq
	je _end;
	jg aGreater
	xchg eax,ebx
	idiv ebx
	mov eax,edx
	jmp _begin
	aGreater:
	idiv ebx;
	mov eax,edx;
	
	jmp _begin
	cdq;
	_end:
endm

.data
	

.code

_MultMatrix proc
     mov eax,[esp + 4]
	 mov ecx,[esp + 8]
	 mov edx,[esp + 12]


	 ; lines
	 _loop1 :

	 mov ebx,dword ptr[eax + ecx*4 - 4]
	 mov esi,ecx
	 mov ecx,edx
	 ; change lines

	 _loop2 :
	 mov edi,dword ptr[ebx + ecx*4 - 4]
	 imul edi,edi
	 mov dword ptr[ebx + ecx*4 - 4], edi
	 loop _loop2

     mov ecx,esi	
	 mov [eax + ecx*4 - 4],ebx
	 loop _loop1
	 ret

_MultMatrix endp

_FindNOD proc
	mov eax, [esp + 4];
	mov ebx, [esp + 8];
	mov ecx,[eax]
	mov edx,[ebx]

	NOD ecx,edx 
	cdq

	mov edi, [esp + 4];
	mov ecx,[esp + 8]
	mov eax,[edi]
	cdq
	idiv ebx
	mov [edi],eax

	mov eax,[ecx]
	cdq
	idiv ebx
	mov [ecx],eax
	

	ret;
_FindNOD endp
end