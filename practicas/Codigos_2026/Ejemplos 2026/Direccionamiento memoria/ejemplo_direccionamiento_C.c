#include <stdio.h>

struct Datos {
    int header;       // desplazamiento 0
    int array[5];     // desplazamiento 4
};

int main() {
    struct Datos d = {0, {10, 20, 30, 40, 50}};
    int sum = 0;

    for (int i = 0; i < 5; i++) {
        sum += d.array[i];   // acceso con desplazamiento fijo
    }

    printf("Suma: %d\n", sum);
    return 0;
}

