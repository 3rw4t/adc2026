// Compilar con las siguientes opciones:
// gcc -O3 -march=native -ftree-vectorize -fopt-info-vec-optimized suma_vectorizada.c -o suma_vectorizada


#include <stdio.h>

void suma(float *a, float *b, float *c, int n) {
    for (int i = 0; i < n; i++) {
        c[i] = a[i] + b[i];
    }
}

int main() {
    float a[] = {1,2,3,4,5,6,7,8,9,10};
    float b[] = {1,2,3,4,5,6,7,8,9,10};
    float c[10];

    suma(a, b, c, 10);

    for (int i = 0; i < 10; i++) {
        printf("%.1f ", c[i]);
    }
    printf("\n");
    return 0;
}
