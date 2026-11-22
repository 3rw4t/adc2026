.data
x: .word 0x12345678

.text
.global main
main:
    ldr r1,     =x
    ldr r2,     [r1]
    ldrh r3,    [r1]
    ldrb r4,    [r1]
    bx          lr
