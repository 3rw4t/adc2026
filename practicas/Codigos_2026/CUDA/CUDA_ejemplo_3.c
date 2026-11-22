#include <stdio.h>

__global__ void kernel() {
    printf("Hola mundo desde la GPU!\n");
}

int main() {
    / Lanzamiento del kernel con la sintaxis <<<Dg, Db>>>:
    // - Dg = 1 bloque en la grilla
    // - Db = 5 hilos dentro del bloque
    // En total, se lanzan 5 hilos que ejecutan el mismo código en paralelo
    kernel<<<1,5>>>();
    cudaDeviceSynchronize();
    return 0;
}