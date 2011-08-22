#include "definitions.h"
#include "array.h"

#ifndef __EULER_LIB_PRIMES_H__
#define __EULER_LIB_PRIMES_H__

#define IS_PRIME 1
#define IS_UNDETERMINED 0
#define IS_COMPOSITE -1

bool isPrime(UInteger n);
UInteger primesFirstPrimeFactor(UInteger n);
UInteger primesGetFactors(UInteger n, Array *array);
UInteger primesGetPrimesTo(UInteger n, Array *array);
UInteger primesGetPrimes(UInteger n, Array *array);

#endif
