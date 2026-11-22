@ compilado con:    arm-linux-gnueabi-gcc -static -g -marm -o prueba arm_adr_disassemble_test.s
@ debugeado con:    gdb-multiarch prueba
@ disassemble con:  disassemble /r main
.text
.global main
main:
    mov r1, #45
    nop
    adr r0, main    @ se reemplaza por: sub r0, pc, #16, Ya que al momento de ejecutarse la instrucción, ya avanzó 8 bytes (esta leyendo bx lr) por el pipeline
    mov r0, #0      @ cada instrucción ocupa 4 bytes. Luego, la dirección de la etiqueta main se corresponde con la de la primera instrucción (mov r1, #45)
    bx lr
