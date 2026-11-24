#include <stdio.h>
#include <math.h>
#include <ieee754.h>

union myUnion{
    union ieee754_float ie;
    unsigned int bits;
}; 

int main(){
    union myUnion myfloat;
    myfloat.ie.f = 0.2f;
    printf("Float infinity\n");
    printf("Signo: %x\n", myfloat.ie.ieee.negative);
    printf("Exponente: %x\n", myfloat.ie.ieee.exponent);
    printf("Mantisa %x\n", myfloat.ie.ieee.mantissa);
    
    printf("Numero entero %x\n", myfloat.bits);

    union ieee754_double mydouble;
    mydouble.d = NAN;
    printf("Double NaN\n");
    printf("Signo: %x\n", mydouble.ieee.negative);
    printf("Exponente: %x\n", mydouble.ieee.exponent);
    printf("Mantisa (b51 a b32): %x\n", mydouble.ieee.mantissa0);
    printf("Mantisa (b31 a b0): %x\n", mydouble.ieee.mantissa1);
    return 0;

}