.global main
main:
	movl $0x7fffffff, %eax
	movl $2, %ebx           # CF=1 y OF=1, indicando que el resultado (signed) es incorrecto
	imul %ebx
	
	movl $0x7fffffff, %eax
	movl $4, %ebx
	mul %ebx                # CF=1 y OF=1, indicando que el resultado (unsigned) es incorrecto
	xor	%eax, %eax
	ret