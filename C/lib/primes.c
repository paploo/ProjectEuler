#include "primes.h"
#include "eratosthenes.h"
#include "intmath.h"

UInteger primesNthPrimeUppderBound(UInteger n);
UInteger primesPrimePIUpperBound(UInteger n); 

bool isPrime(UInteger n) {
	// One and zero are special cases to this algorithm.
	if(n<2)
		return false;
	
	// If we don't have a factor, then we are prime.
	return primesFirstPrimeFactor(n) == n;
}

UInteger primesFirstPrimeFactor(UInteger n) {
	// Get the list of necessary primes
	Array *primes = arrayAlloc();
	primesGetPrimesTo( intmath_sqrt(n), primes );
	
	// Now try to factor it.
	for(UInteger i=0; i<primes->len; i++) {
		UInteger p = ((UInteger *)primes->ptr)[i];
		if(n%p == 0)
			return p;
	}
	
	// If we have no factors, then return n.
	return n;
}

UInteger primesGetFactors(UInteger n, Array *array) {
	// To implement this, we need a linked list or an
	// expandable array construct that we can keep appending to.
	return 0;
}

UInteger primesGetPrimesTo(UInteger n, Array *array) {
	return eratosthenesGetPrimes(n, array);
}

UInteger primesGetPrimes(UInteger n, Array *array) {
	UInteger m = primesNthPrimeUppderBound(n);
	return eratosthenesGetPrimes(m, array);
}


/* ===== Private Functions ===== */


//Prime[2^#] & /@ Table[k, {k, 0, 32}]
UInteger nthPrimesExp2[] = {2, 3, 7, 19, 53, 131, 311, 719, 1619, 3671, 8161, 17863, 38873, 84017, 180503, 386093, 821641, 1742537, 3681131, 7754077, 16290047, 34136029, 71378569, 148948139, 310248241, 645155197, 1339484197, 2777105129, 5750079047, 11891268401, 24563311309, 50685770167, 104484802057};

// PrimePi[2^#] & /@ Table[k, {k, 0, 32}]
UInteger PrimePIsExp2[] = {0, 1, 2, 4, 6, 11, 18, 31, 54, 97, 172, 309, 564, 1028, 1900, 3512, 6542, 12251, 23000, 43390, 82025, 155611, 295947, 564163, 1077871, 2063689, 3957809, 7603553, 14630843, 28192750, 54400028, 105097565, 203280221};



UInteger primesNthPrimeUppderBound(UInteger n) {
	Integer exponent = intmath_log2_ceil(n);
	return nthPrimesExp2[exponent];
}

UInteger primesPrimePIUpperBound(UInteger n) {
	Integer exponent = intmath_log2_ceil(n);
	return PrimePIsExp2[exponent];
} 
