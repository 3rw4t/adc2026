#include <stdio.h>

__global__ void sumaVectores(int *a, int *b, int *c, int n){
    int i = threadIdx.x;
    if (i < n){
        c[i] = a[i] + b[i];
    }

}

int main(){
    const int N = 5; // Tamaño de los vectores
    
    // Vectores en memoria del host (CPU)

    int a[N] = {1, 2, 3, 4, 5};
    int b[N] = {10, 20, 30, 40, 50};
    int c[N];

    // Punteros para memoria en el device (GPU)
    
    int *dev_a, *dev_b, *dev_c;

    // Reserva de memoria en la GPU

    cudaMalloc((void**)&dev_a, N*sizeof(int));
    cudaMalloc((void**)&dev_b, N*sizeof(int));
    cudaMalloc((void**)&dev_c, N*sizeof(int));

    // Copia de datos desde el host (CPU) al device (GPU)
    
    cudaMemcpy(dev_a, a, N*sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(dev_b, b, N*sizeof(int), cudaMemcpyHostToDevice);

    // Lanzamiento del kernel

    sumaVectores<<<1,N>>>(dev_a, dev_b, dev_c, N);

    // Copia del resultado desde la GPU al host

    cudaMemcpy(c, dev_c, N*sizeof(int), cudaMemcpyDeviceToHost);

    // Impresión del resultado en el host
    for(int i = 0; i < N; i++){
        printf("%d ", c[i]);
    }
    printf("\n");

    // Liberación de memoria en la GPU

    cudaFree(dev_a);
    cudaFree(dev_b);
    cudaFree(dev_c);

    return 0;
}