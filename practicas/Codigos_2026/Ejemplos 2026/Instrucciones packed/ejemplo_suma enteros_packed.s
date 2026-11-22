.data
.align 16
a: .long 1, 2, 3, 4
b: .long 1, 2, 3, 4
c: .space 16
str: .string "%d %d %d %d\n"

.text
.global main
main:
	movaps a, %xmm0
	movaps b, %xmm1
	paddd %xmm0, %xmm1
	movaps %xmm1, c
	
	//Imprime la suma de los vectores
	leaq str, %rdi
	movl c, %esi
	movl c+4, %edx
	movl c+8, %ecx
	movl c+12, %r8d
	xorl	%eax, %eax
	call printf
	
	xorl	%eax, %eax
	ret