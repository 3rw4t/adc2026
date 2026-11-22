#include <stdio.h>


void printBinary(unsigned int num){
    for (int i = 31; 0 <= i; i-- ){

        printf("%d", (num >> i) & 1);
    }
    printf("\n");

}

int main(){
    unsigned int a;
    a = (1U << 31) | (1U);
    printBinary(a);

    return 0;
}