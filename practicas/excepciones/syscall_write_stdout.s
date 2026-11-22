.data
str1: .asciz "imprimiendo en consola oh yea\n"

.text
.global main
main:
    
    #llamada a write
    
    movq $1, %rax
    movq $1, %rdi
    leaq str1, %rsi
    movq $30, %rdx
    syscall

    #exit
    
    movq $60, %rax
    xorq %rdi, %rdi
