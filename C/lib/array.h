#include "stdlib.h"
#include "definitions.h"

#ifndef __EULER_LIB_ARRAY_H__
#define __EULER_LIB_ARRAY_H__

typedef struct ArrayStruct {
	UInteger len;
	void *ptr;
} Array;

void *arrayNew(UInteger len, void *cArray);
void *arrayAlloc();
void *arrayInit(Array *array, UInteger len, void *cArray);
void arrayDelete(Array *array);

void arrayPrint(Array *array, size_t elementSize, bool isUnsigned);

#endif
