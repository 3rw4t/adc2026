.data
buffer: .asciz "/mnt/d/Escritorio/adc/Practicas/plancha_4/syscall_write_stdout.s"
imprimir: .asciz "El archivo pesa: %db\n"
.bss
estadisticas: .skip 144

.text
.global main
main:
    pushq %rbp

    # llamada a stat
    movq $4, %rax
    leaq buffer, %rdi
    leaq estadisticas, %rsi
    syscall

    # mostrando el mensaje por std out
    leaq estadisticas, %rbx
    xorq %rax, %rax
    leaq imprimir, %rdi
    movq 48(%rbx), %rsi
    call printf

    # exit
    popq %rbp
    movq $60, %rax
    xorq %rdi, %rdi
    syscall


