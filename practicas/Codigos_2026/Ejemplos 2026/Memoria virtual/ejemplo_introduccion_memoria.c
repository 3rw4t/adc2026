#include <stdio.h>
int a=0x11223344, b=0x55667788;

int main()
{
    int c=0xaabbccdd, d=0xdeadbeef;
    printf(" a: 0x%x\n b: 0x%x\n c: 0x%x\n d: 0x%x\n",a,b,c,d);
    printf(" Dirección de a: %p \n Dirección de b: %p \n Dirección de c: %p \n Dirección de d: %p\n",&a,&b,&c,&d);
    return 0;
}
