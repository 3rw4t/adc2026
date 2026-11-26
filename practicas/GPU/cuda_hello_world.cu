#include <stdio.h>


__global__ void kernel(void){

    printf("Hola mundo desde la GPU!\n");
}

int main(){

    kernel<<<1,5>>>();

    cudaDeviceSynchronize();

    return 0;
}