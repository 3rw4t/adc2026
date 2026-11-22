.data
a: .word -1, -2, 0xff, 0xab
b: .quad 0x12345678
str: asciz "%d\n"

.text
.global main
main:
    movl a, %eax                           # rax = 0xfffeffff
    movq $a, %rbx                          # rbx = 0x404010
    movl $3, %ecx                          # rcx = 0x3
    movw (%rbx, %rcx, 1), %ax              # rax = 0xfffeffff
    movb 0x5(%rbx), %al                    # rax = 0xfffeff00
    leaq b, %rbx                           # rbx = 0x404018
    movl (%rbx, %rcx, 1), %eax             # rax = 0x12
    movl $-1, %r8d                         # r8  = 0xffffffff
    imull %r8d                             # rax = 0xffffffee rdx = 0xffffffff
    ret

    # (a) dibujar el esquema de memoria, mostranndo contenido de cada byte, las direcciones y etiquetas. Asumiendo que &a = 0x404010
    
    # (b) rellenar comentarios luego de ejecutar la instrucción correspondiente

    # (c) Indicar el valor de retorno al imprimir la variable de entorno en shell con echo $?

    # a-
    #    0x404010 - 0xff - a[0]
    #    0x404011 - 0xff - a[0]
    #    0x404012 - 0xfe - a[1]
    #    0x404013 - 0xff - a[1]
    #    0x404014 - 0xff - a[2]
    #    0x404015 - 0x0 - a[2]
    #    0x404016 - 0xab - a[3]
    #    0x404017 - 0x0 - a[3]
    #    0x404018 - 0x78 - b
    #    0x404019 - 0x56 - b
    #    0x40401a - 0x34 - b
    #    0x40401b - 0x12 - b
    #    0x40401c - 0x00 - b
    #    0x40401d - 0x00 - b
    #    0x40401e - 0x00 - b
    #    0x40401f - 0x00 - b
    #    0x404020 - '%' - str
    #    0x404021 - 'd' - str
    #    0x404022 - '\n' - str
    #    0x404023 - '\0' - str
        
        
    # c- echo $? = 238
        