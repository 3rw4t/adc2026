#include <stdio.h>

__global__ void kernel() {
    // printf ejecutado desde la GPU.
    // Requiere soporte del runtime CUDA y sincronización posterior
    printf("Hola mundo desde la GPU!\n");
}

int main() {
    // Lanzamiento del kernel con la sintaxis <<<Dg, Db>>>:
    // - 1 bloque en la grilla (Dg = 1)
    // - 1 hilo por bloque (Db = 1)
    kernel<<<1,1>>>();

    // Sincroniza el host con el device:
    // asegura que el kernel termine antes de que el programa finalice
    // (necesario para que el printf en GPU se ejecute correctamente)
    cudaDeviceSynchronize();
    
    // Fin del programa en el host
    return 0;
}
