.data
str1: .asciz "Estoy en foo!\n"
str2: .asciz "%d\n"

.text
foo:
    pushq %rbp
    xor %eax, %eax
    leaq str1, %rdi
    call printf
    popq %rbp
    ret

suma:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
    movl %edi, -4(%rbp)
    movl %esi, -8(%rbp)
    movl %edx, -12(%rbp)
    movl %ecx, -16(%rbp)
    movl %r8d, -20(%rbp)
    movl %r9d, -24(%rbp)
    call foo
    movl 16(%rbp), %eax
    movl 24(%rbp), %edx
    addl %eax, %edx
    movl -4(%rbp), %eax
    addl %eax, %edx
    movl -8(%rbp), %eax
    addl %edx, %eax
    movq %rbp, %rsp
    popq %rbp
    ret

.global main
main:
    pushq %rbp
    movq %rsp, %rbp
    pushq $8
    pushq $7
    movl $6, %r9d
    movl $5, %r8d
    movl $4, %ecx
    movl $3, %edx
    movl $2, %esi
    movl $1, %edi
    call suma
    movl %eax, %esi
    leaq str2, %rdi
    xor %eax, %eax
    call printf
    movl $0, %eax
    movq %rbp, %rsp
    popq %rbp
    ret


    #(a) el programa debe primir la suma de los argumentos 1,2,7,8: "Estoy en foo!\nLa suma es 18\n"
    
    #(b) elaborar diagrama de la pila que muestre su contenido después de ejecutar el prologo de foo, así como la evolución
    # de los registros rsp y rbp hast alcanzar ese estado. Valores iniciales rsp = 0x7fffffffeb38 y rbp=0x7fffffffebd0

    # Explicar pq es necesaria la instrucción subq $32, &rsp y qué ocurre si se omite

