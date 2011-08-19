/*
	If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
	Find the sum of all the multiples of 3 or 5 below 1000.
*/

#include "problem.h"

UInteger sum(UInteger n) {
	UInteger sum = 0;
	for(UInteger x=0; x<n; x++){
		if( x%3==0 || x%5==0 )
			sum += x;
	}
	return sum;
}

ProblemInteger check(void) {
	return sum(10);
}

ProblemInteger run(void) {
	return sum(1000);
}

int main(void) {
	ProblemIntegerCheck(23, &check);
	ProblemIntegerRun(233168, true, &run);
	return 0;
}
