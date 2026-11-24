#include <stdio.h>

int main(){

    // "Escriba una expresión en C que permita poner en cero los bits b2 y b3 de X, manteniendo sin cambios los restantes bits."

    unsigned char x = 0b10110110, m = 0b00001111;

    // cambiamos la máscara a 0b11111001

    m = 0b11111001;

    // imprimimos el resultaqdo de aplicar la máscara a X

    printf("Resultado: %08b\n", x & m);

    return 0;
}