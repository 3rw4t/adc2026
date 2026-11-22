.data
array:  .word   4, 7, 10, 3          @ Arreglo de 4 enteros (32 bits)
sum:    .word   0                    @ Aquí se guardará la suma final

.text
.global main
main:
        MOV     r0, #0               @ r0 = contador (i)
        MOV     r1, #4               @ r1 = número de elementos
        LDR     r2, =array           @ r2 = puntero al arreglo
        MOV     r3, #0               @ r3 = suma acumulada

loop:
        CMP     r0, r1               @ ¿i == 4?
        BGE     fin                  @ si i >= 4, salir

        LDR     r4, [r2, r0, LSL #2] @ carga array[i] — usa barrel shifter
                                      @ (desplaza i*4 para índice en bytes)

        ADD     r4, r4, r4           @ r4 = r4 * 2 (multiplica por 2)
                                      @ alternativa: ADD r4, r4, r4
                                      @ o usando shifter: MOV r4, r4, LSL #1

        ADD     r3, r3, r4           @ acumula suma

        ADD     r0, r0, #1           @ i++

        B       loop                 @ vuelve al comienzo

fin:
        LDR     r5, =sum             @ puntero a sum
        STR     r3, [r5]             @ guarda suma acumulada en memoria

        @ Ejemplo adicional: acceso byte a byte
        MOV     r6, #0xAA            @ valor ejemplo
        STRB    r6, [r5, #4]         @ guarda un byte junto al resultado
                                      @ sum ocupa 4 bytes; esto escribe el byte siguiente

        @ Ejemplo de carga múltiple: cargar r0–r3 desde memoria
        LDM     r5, {r0, r1, r2, r3} @ r0 = sum, r1 = byte AA y otros datos contiguos

        @ Ejemplo de almacenamiento múltiple: guardar r0–r3 contiguos
        STM     r5, {r0, r1, r2, r3}

        BX       LR                  @ retorna

