.data
.align 16
v1: .float 3.0, 5.0, 6.0, 2.43
v2: .float 3.0, 2.6, 0.76, 5.176
str: .asciz "resultados: %f %f %f %f\n"

.bss
result: .space 16, 0

.text
.global main

main:
    pushq %rbp
    movq %rsp, %rbp

    # cargando valores en registros
    movaps v1, %xmm0
    movaps v2, %xmm1

    # hacemos la suma
    addps %xmm1, %xmm0

    # movemos el resultado a result
    movups %xmm0, result

    # nos preparamos para llamar a printf
    movl $4, %eax
    leaq str, %rdi

    movss result, %xmm0
    cvtss2sd %xmm0, %xmm0
    movss result+4, %xmm1
    cvtss2sd %xmm1, %xmm1
    movss result+8, %xmm2
    cvtss2sd %xmm2, %xmm2
    movss result+12, %xmm3
    cvtss2sd %xmm3, %xmm3

    call printf

    xorq %rax, %rax

    movq %rbp, %rsp
    popq %rbp
    ret
