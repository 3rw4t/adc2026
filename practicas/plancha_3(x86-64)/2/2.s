.text
.global main
main:

    movb $0xFE, %al     # 254[cite: 34]
    movb $-1, %bl
    addb %bl, %al
    incb %bl


    ret
