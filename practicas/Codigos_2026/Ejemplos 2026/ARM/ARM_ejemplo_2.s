.text
.global main
main:

        @ ---- MOV de un inmediato grande usando MOV + MOVT ----
        MOVW    r0, #0x3344              @ parte baja
        MOVT    r0, #0x1122              @ parte alta

        @ ---- Construcción de otro inmediato grande vía ORR y shifter ----
        MOV     r1, #0                  @ r1 = 0
        ORR     r1, r1, #0x12 << 24      @ r1 = 0x12000000
        ORR     r1, r1, #0x34 << 16      @ r1 = 0x12340000
        ORR     r1, r1, #0x56 << 8       @ r1 = 0x12345600
        ORR     r1, r1, #0x78            @ r1 = 0x12345678

        @ ---- Comparación de números grandes ----
        CMP     r0, r1
        BLT     menor

        @ ---- Aritmética con inmediatos grandes (usando rotaciones) ----
        ADD     r2, r1, #0xFF000000      @ suma con inmediato codificable via rotation
        B       continuar

menor:
        @ ---- Lógica con barrel shifter y valores grandes ----
        EOR     r2, r0, r1, ROR #8       @ r2 = r0 XOR (r1 rotado 8 bits)

continuar:

        @ ---- Construcción rápida de inmediato grande con MVN ----
        MVN     r3, #0x00FFFFFF          @ r3 = 0xFF00FF00 (complemento)

        @ ---- Aritmética combinada ----
        SUB     r4, r2, r3               @ resta valores grandes
        ADD     r5, r4, r1, LSR #4       @ suma r1>>4 usando shifter

fin:
        BX       LR
