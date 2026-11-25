.data
str: .asciz "Operando1: %d, Operando2: %d\nResultado de la resta: %d\nCF = %d\nOF = %d\n"

.text
.global main
main:
    pushq %rbp
    movq %rsp, %rbp

    movl $0x81, %esi
    movl $0xFF, %edx
    movl %esi, %ecx 

    subl %edx, %ecx

    pushfq
    popq %r8
    andq $0x1, %r8

    pushfq
    popq %r9
    andq $0x800, %r9


    xorl %eax, %eax
    leaq str, %rdi

    call printf


    movq %rbp, %rsp
    popq %rbp

    retq
