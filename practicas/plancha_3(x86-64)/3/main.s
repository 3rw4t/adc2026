
.text
.global main
main:
    # xor %rax, %rax
    # xor %rbx, %rbx

    movb $120, %bl
    movb $-91, %al

    subb %bl, %al
    
    # (CF)
    # (0) 10100101 -91
    # (0) 10001000 -120
    # (1) 00101101 = 45



    retq