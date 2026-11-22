.bss
buffer: .skip 64

.text
.global main
main:
    # Lectura de std in con syscall
    movq $0, %rax
    movq $1, %rdi
    leaq buffer, %rsi
    movq $64, %rdx
    syscall

    # Imprimiendo lo leído

    movq %rax, %rdx # Se mueven la cantidad de bytes leidos a la cantidad de bytes a escribir
    movq $1, %rax
    movq $1, %rdi
    leaq buffer, %rsi
    syscall

    # Llamada a exit (es equivalente a escribir ret)

    movq $60, %rax
    xorq %rdi, %rdi
    syscall
