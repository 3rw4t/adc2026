.data
d:  .long 0
    .long 10, 20, 30, 40,50
str: .asciz "%d\n"   

.text
.global main
main:
	movq $d, %rbx
	movl $5, %ecx   # Contador
	movl $0, %eax   # Índice
	movl $0, %esi    # Sumador
bucle:	
	movl 4(%rbx,%rax,4), %edx
	addl %edx, %esi
	incl %eax
	loop bucle
	
	movq $str, %rdi
	xor	%eax, %eax
	call printf
	ret