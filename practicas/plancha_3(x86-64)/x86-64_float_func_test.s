.data
str: .asciz "Entero: %d\nFloat: %f\n"
a: .long 56
b: .float 3.14

.text
.global main
main:
    # prologo #
    
    pushq %rbp              # pila alineada a 16 bytes
    movq %rsp, %rbp

    # preparación para llamar printf #

    leaq str, %rdi          # se carga la dirección de la cadena a imprimir en %rdi
    movl a, %esi            # Importante acá agarrar exactamente los 4 bytes del dato tipo long.
    movss b, %xmm0          # se mueve el escalar de simple precisión guardado en B a %xmm0, primer y único argumento de tipo escalar para printf
    cvtss2sd %xmm0, %xmm0   # printf necesita que el dato sea de doble precisión (64 bits). Float, en cambio, es un dato de 32 bits
    movq $1, %rax           # cantidad de argumentos de tipo flotante

    call printf             # llamada a printf

    # Epilogo #

    xorl %eax,%eax          # seteamos eax = 0 como retorno del programa para señalar que se ejecutó con exito
    movq %rbp, %rsp
    popq %rbp
    ret
