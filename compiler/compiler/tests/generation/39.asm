.686
include \masm32\include\masm32rt.inc

.data
	g_i dd 0
	g_j dd 0
	g_str1 db " " , 0
	g_format_int db "%d" , 0
	g_format_real db "%f" , 0
	g_new_line db "\n" , 0
.code
start:
	finit
	push 1
	push offset g_i
	pop ebx
	pop eax
	mov dword ptr [ebx], eax
	push 10
	pop ebx
	push g_i
	pop ecx
label_1:
	cmp ecx, ebx
	jg label_2
	push offset g_i
	pop eax
	mov dword ptr [eax], ecx
	push ebx
	push ecx
	push 1
	push offset g_j
	pop ebx
	pop eax
	mov dword ptr [ebx], eax
	push 10
	pop ebx
	push g_j
	pop ecx
label_3:
	cmp ecx, ebx
	jg label_4
	push offset g_j
	pop eax
	mov dword ptr [eax], ecx
	push ebx
	push ecx
	push g_i
	push g_j
	pop ebx
	pop eax
	xor edx, edx
	imul ebx
	push eax
	push offset g_format_int
	call crt_printf
	add esp, 8
	push offset g_str1
	call crt_printf
	add esp, 4
	pop ecx
	pop ebx
	inc ecx
	jmp label_3
label_4:
	pop ecx
	pop ebx
	inc ecx
	jmp label_1
label_2:
	INVOKE ExitProcess, 0
end start