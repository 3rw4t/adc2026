.data
    arr: .byte 100, 120, -63, -56, -91

.text
.global main
main:
    pushq %rbp
    movq %rsp, %rbp
    
    leaq arr(%rip), %rbx
    movb (%rbx), %dil

    leaq arr+2(%rip), %rbx
    movb (%rbx), %sil

    call suma

    movq %rbp, %rsp
    popq %rbp
    retq

