#include <stdint.h>
#include <inttypes.h>
#include <stdbool.h>

#ifndef __EULER_LIB_DEFINITIONS_H__
#define __EULER_LIB_DEFINITIONS_H__

typedef int8_t Integer8;
typedef uint8_t UInteger8;

typedef int16_t Integer16;
typedef uint16_t UInteger16;

typedef int32_t Integer32;
typedef uint32_t UInteger32;

typedef int64_t Integer64;
typedef uint64_t UInteger64;

typedef uintptr_t PointerAddress;

typedef Integer64 Integer;
typedef UInteger64 UInteger;

typedef UInteger8 Byte;

#define PRI_INTEGER   PRId64
#define PRI_UINTEGER  PRIu64

#endif
