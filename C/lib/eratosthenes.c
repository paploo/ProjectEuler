#include <stdlib.h>

#include "definitions.h"

// Generates all the primes less than or equal to n, sets the return array
// in the passed struct pointer and returns the count.
UInteger32 eratosthenesGetPrimes(UInteger32 n, UInteger32Array *a) {
	// Allocate the list.
	// Calloc sets them all to false, so we treat each slot as a question of if it is composite rather than if it is prime.
	UInteger32 *list = calloc(n+1, sizeof(UInteger32));
	
	// Initialize a few values as composite.
	list[0] = true;
	list[1] = true;
	
	// Now we can get to work sieving.
	for(UInteger32 x=2; x*x<=n; x++){
		if( list[x] == false ) {
			for( UInteger32 i=2*x; i<=n; i+=x )
				list[i] = true;
		}
	}
	
	// Now we need to know how many results we have to malloc the array.
	UInteger32 count = 0;
	for(UInteger32 i=2; i<=n; i++) {
		if( list[i] == false )
			count += 1;
	}
	
	// Now we transfer the values to a new array.
	if( count == 0 )
		return 0;
	
	UInteger32 *primes = malloc(count * sizeof(UInteger32));
	UInteger32 j = 0;
	for(UInteger32 i=2; i<=n; i++) {
		if( list[i] == false ) {
			primes[j++] = i;
		}
	}
	
	// Now we cleanup.
	free(list);
	
	// Return a pointer to an array struct.
	if(a) {
		a->length = count;
		a->array = primes;
	}
	
	return count;
}


// TODO: Make an array helper that can iterate through and print an array, make an array, free an array (and its content array), and set it to a new array (which frees the old one and sets the new length).

#include <stdio.h>

int main(void){
	UInteger n = 20;
	UInteger32Array *primes = malloc( sizeof(UInteger32Array) );
	eratosthenesGeneratePrimes(n, primes);
	for(UInteger i=0; i<primes->length; i++)
		printf("%d\n", primes->array[i]);
	
	free(primes->array);
	free(primes);
	return 0;
}
