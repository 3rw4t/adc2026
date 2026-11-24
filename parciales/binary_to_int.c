#include <stdio.h>

int main (){

    // "Escriba una expresión en C que permita obtener los cuatro bits más significativos de X como un numero entre 0 y 15"

    unsigned char x = 0b10110110;
    unsigned char m = 0b00001111;

    // bits más significativos = 0b1011 = x >> 4

    printf ("Resultado: %d\n", x >> 4);

    return 0;
}