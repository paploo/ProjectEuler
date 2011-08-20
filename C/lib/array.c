#include <stdio.h>

#include "array.h"

void *arrayNew(UInteger len, void *cArray) {
	return arrayInit(arrayAlloc(), len, cArray);
}

void *arrayAlloc() {
	return malloc( sizeof(Array) );
}

void *arrayInit(Array *array, UInteger len, void *cArray) {
	array->len = len;
	array->ptr = cArray;
	return array;
}

void arrayDelete(Array *array) {
	free( array->ptr );
	free( array );
}

void arrayPrint(Array *array, size_t elementSize, bool isUnsigned) {
	UInteger i;
	printf("Array(%" PRI_UINTEGER ")[ ", array->len);
	
	if(isUnsigned){
		UInteger x=0;
		for(i=0; i<array->len; i++){
			switch(elementSize){
				case 1:
					x = ((uint8_t *)array->ptr)[i];
					break;
				case 2:
					x = ((uint16_t *)array->ptr)[i];
					break;
				case 4:
					x = ((uint32_t *)array->ptr)[i];
					break;
				case 8:
					x = ((uint64_t *)array->ptr)[i];
					break;
			}
			printf("%" PRI_UINTEGER " ", x);
		}
	} else {
		Integer x=0;
		for(i=0; i<array->len; i++){
			switch(elementSize){
				case 1:
					x = ((int8_t *)array->ptr)[i];
					break;
				case 2:
					x = ((int16_t *)array->ptr)[i];
					break;
				case 4:
					x = ((int32_t *)array->ptr)[i];
					break;
				case 8:
					x = ((int64_t *)array->ptr)[i];
					break;
			}
			printf("%" PRI_INTEGER " ", x);
		}
	}
	
	printf("]\n");
}
