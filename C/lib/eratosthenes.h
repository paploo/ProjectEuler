/*
Example code:

#include <stdio.h>

int main(void){
	UInteger n = 20;
	Array *primes = arrayAlloc();
	eratosthenesGetPrimes(n, primes);
	arrayPrint(primes, sizeof(UInteger32), true);
	arrayDelete(primes);

	return 0;
}
*/

#include "array.h"

#ifndef __EULER_LIB_ERATOSTHENES_H__
#define __EULER_LIB_ERATOSTHENES_H__

/*
	Generates a list of all primes less than or equal to n as UInteger32 values,
	and places it in the given Array object.
	Returns the length of the arrays
*/
UInteger32 eratosthenesGetPrimes(UInteger n, Array *a);

#endif
