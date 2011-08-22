#include <stdlib.h>

#include "intmath.h"

UInteger intmath_sqrt(UInteger n) {
	UInteger a = n;
	UInteger b;
	while(true) {
		b = (a + n/a) >> 1;
		if( intmath_abs(b-a) < 1 )
			return b;
		a = b;
	}
}

Integer intmath_abs(Integer a) {
	return llabs(a);
}

Integer intmath_log2_floor(UInteger a) {
	Integer l=0;
	while( (a = a>>1) ) 
		l++;
	return l;
}

Integer intmath_log2_ceil(UInteger a) {
	Integer lFloor = intmath_log2_floor(a);
	UInteger y = 1 << lFloor;
	return y>=a ? lFloor : lFloor+1;
}

