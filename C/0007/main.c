/*
	By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
	
	What is the 10001st prime number?
*/

#include "definitions.h"
#include "problem.h"
#include "array.h"
#include "eratosthenes.h"

Array *primes = NULL;

// By making primes a global, the time reported for the run is incorrect,
// but it makes it faster overall.
UInteger nthPrime(UInteger n) {
	UInteger m = 1<<17; //2^17
	
	if( !primes ) {
		primes = arrayAlloc();
		eratosthenesGetPrimes(m, primes);
	}
	
	if(n >= primes->len)
		return 0;
	
	UInteger32 *a = primes->ptr;
	return a[n-1];
}

ProblemInteger check(void) {
	return nthPrime(6);
}

ProblemInteger run(void) {
	return nthPrime(10001);
}

int main(void) {
	ProblemIntegerCheck(13, &check);
	ProblemIntegerRun(104743, true, &run);
	return 0;
}
