#include <stdio.h>


int main(){
    // se quieren imprimir los 4 bits inferiores de x

    unsigned char x = 0b10110110;
    
    printf("x = %08b\n", x);

    // creamos una máscara con los 4 bits inferiores = 1 

    unsigned char mascara = 0b00001111;

    printf("mascara = %08b\n", mascara);

    // calculamos operandos
    
    printf("~x & mascara = %08b\n", ~x & mascara);

    printf("x & ~mascara: %08b\n", x & ~mascara);

    // swapeamos los 4 bits inferiores con la suma de los 2 resultados anteriores

    printf("swap 4 bits: (~x & mascara) + (x & ~mascara): %08b\n", (~x & mascara) + (x & ~mascara));

    return 0;
}