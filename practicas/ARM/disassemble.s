@ compilado con:    arm-linux-gnueabi-gcc -static -g -marm -o prueba arm_adr_disassemble_test.s
@ debugeado con:    gdb-multiarch prueba
@ disassemble con:  disassemble /r main
.data
place: .word 0x11223344

.text
.global main
main:
    ldr r0, =0xff0
    ldr r1, =-1
    ldr r2, =0x11223344
    ldr r3, =place
    bx lr

