#include <stdio.h>

// Definición de un kernel CUDA.
// __global__ indica que la función se ejecuta en la GPU (device)
// y puede ser invocada desde la CPU (host).
__global__ void kernel(void){}

int main() {
    // Lanzamiento del kernel con la sintaxis <<<Dg, Db>>>:
    // - 1 bloque en la grilla (Dg = 1)
    // - 1 hilo por bloque (Db = 1)
    kernel<<<1,1>>>();
    // Impresión desde la CPU (host)
    printf("Hola mundo!\n");
    return 0;
}
