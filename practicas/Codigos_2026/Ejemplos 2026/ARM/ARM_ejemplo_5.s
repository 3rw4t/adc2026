calculo:
    sub     sp, sp, #32
    str     r0, [sp, #28]           @ a
    str     r1, [sp, #24]           @ b
    str     r2, [sp, #20]           @ c
    str     r3, [sp, #16]           @ d
    vstr.32 s0, [sp, #12]           @ e
    vstr.64 d1, [sp]                @ f
    ldr     r2, [sp, #28]
    ldr     r3, [sp, #24]
    add     r2, r2, r3              @ a + b
    ldr     r3, [sp, #20]
    add     r2, r2, r3              @ a + b + c 
    ldr     r3, [sp, #16]
    add     r3, r3, r2              @ a + b + c + d
    vmov    s1, r3                 
    vcvt.f32.s32    s0, s1          @ convertimos a float
    vldr.32         s1, [sp, #12]   @ e
    vadd.f32        s1, s0, s1      @ a + b + c + d + e
    vcvt.f64.f32    d1, s1          @ convertimos a double 
    vldr.64         d0, [sp]        @ f
    vadd.f64        d1, d1, d0      @ a + b + c + d + e + f
    ldr             r3, [sp, #32]   @ g
    vmov            s1, r3          
    vcvt.f64.s32    d0, s1          @ convertimos a double
    vadd.f64        d1, d1, d0      @ a + b + c + d + e + f + g
    ldr             r3, [sp, #36]   @ h
    vmov            s1, r3          
    vcvt.f64.s32    d0, s1          @ convertimos a double
    vadd.f64        d0, d1, d0      @ a + b + c + d + e + f + g + h
    vcvt.f32.f64    s1, d0          @ convertimos a float
    vmov.f32        s0, s1          @ valor de retorno de calculo
    add             sp, sp, #32
    bx              lr

.data
str: .asciz  "La suma es: %f\n"

.text
.global main
main:
    push    {lr}
    sub     sp, sp, #12
    movs    r3, #8
    str     r3, [sp, #4]        @ h
    movs    r3, #7
    str     r3, [sp]            @ g
    vmov.f64    d1, #6.0e+0     @ f
    vmov.f32    s0, #5.0e+0     @ e
    movs    r3, #4              @ d
    movs    r2, #3              @ c
    movs    r1, #2              @ b
    movs    r0, #1              @ a
    bl      calculo
    vcvt.f64.f32    d1, s0      @ convertir a double el resultado      
    vmov    r2, r3, d1          @ segundo argumento de printf 
    ldr     r0, =str            @ primer argumento de printf
    bl      printf
    mov     r0, #0              @ valor de retorno de main
    add     sp, sp, #12
    pop     {lr}
    bx      lr