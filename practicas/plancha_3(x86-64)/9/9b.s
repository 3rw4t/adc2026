.data
a: .word -1
b: .byte 0xaa, 99
c: .float 1.5
str: .asciz "Hola mundo\n"

.text
.global main
main:
    leaq a(%rip), %rdx
    movw (%rdx), %ax # ax = 0xffff
    movb 3(%rdx), %al # 0x63 (99)
    movl 8(%rdx), %esi
    movl 4(%rdx), %edi
    ret

