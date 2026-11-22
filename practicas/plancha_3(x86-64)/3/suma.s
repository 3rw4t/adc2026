.text
.global suma
suma:
    pushq %rbp
    movq %rsp, %rbp

    movb %dil, %al
    addb %sil, %al

    movq %rbp, %rsp
    popq %rbp
    retq    
